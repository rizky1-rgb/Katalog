<?php
require __DIR__ . '/config.php';
defined('OWNER_CODE') || define('OWNER_CODE', 'aksesowner1');   // untuk config.php lama yang belum punya baris ini
session_set_cookie_params(['httponly' => true, 'samesite' => 'Lax']);
session_start();
header('X-Frame-Options: DENY');

$pdo = db();
// Tabel `user` bawaan databasemu. Kolom password char(10) terlalu pendek untuk hash, jadi dilebarkan otomatis.
$pdo->exec("CREATE TABLE IF NOT EXISTS `user` (
    id_user TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) DEFAULT NULL,
    password VARCHAR(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
$col = $pdo->query("SHOW COLUMNS FROM `user` LIKE 'password'")->fetch();
if ($col && stripos($col['Type'], 'char(10)') !== false) {
    $pdo->exec('ALTER TABLE `user` MODIFY `password` VARCHAR(255) DEFAULT NULL');
}
if (!$pdo->query("SHOW COLUMNS FROM `user` LIKE 'peran'")->fetch()) {   // kolom peran belum ada: buat
    $pdo->exec("ALTER TABLE `user` ADD `peran` VARCHAR(100) DEFAULT NULL");
}
// Catatan akun yang dihapus owner, supaya pemiliknya dapat pemberitahuan saat mencoba login
$pdo->exec("CREATE TABLE IF NOT EXISTS akun_dihapus (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    password VARCHAR(255) DEFAULT NULL,
    dihapus_oleh TINYINT DEFAULT NULL,
    dihapus_pada TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    KEY (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
// Kalau belum ada owner sama sekali, akun paling awal jadi owner utama (mencegah terkunci dari panel)
if (!(int)$pdo->query("SELECT COUNT(*) FROM `user` WHERE LOWER(peran) = 'owner'")->fetchColumn()) {
    $pdo->exec("UPDATE `user` SET peran = 'owner' ORDER BY id_user LIMIT 1");
}
$utama = (int)$pdo->query("SELECT MIN(id_user) FROM `user` WHERE LOWER(peran) = 'owner'")->fetchColumn();   // owner utama

$_SESSION['csrf'] ??= bin2hex(random_bytes(16));
$uid = (int)($_SESSION['uid'] ?? 0); $role = ''; $me = null;
if ($uid) {                                     // peran dibaca dari database setiap halaman dibuka
    $q = $pdo->prepare("SELECT username, IF(LOWER(peran) IN ('owner','admin'), LOWER(peran), 'user') AS role FROM `user` WHERE id_user = ?"); $q->execute([$uid]); $me = $q->fetch();
    if ($me) $role = $me['role']; else { unset($_SESSION['uid']); $uid = 0; $_SESSION['flash'] = 'Akunmu sudah dihapus oleh owner, jadi kamu keluar otomatis.'; }
}
$isOwner = $role === 'owner';
$isUtama = $isOwner && $uid === $utama;
$in   = $isOwner || $role === 'admin';          // boleh masuk panel: owner dan penjual (admin)
$user = $uid && !$in;                           // sudah login tapi pengguna biasa
$n     = (int)$pdo->query("SELECT COUNT(*) FROM `user` WHERE username <> '' AND password <> ''")->fetchColumn();
$err   = [];
$flash = $_SESSION['flash'] ?? '';
unset($_SESSION['flash']);
$a     = $_GET['a'] ?? 'list';
if ($in && !$isOwner) $a = 'form';              // penjual hanya punya form tambah produk
$STAT  = ['availabel' => 'Tersedia', 'not availabel' => 'Stok habis'];
$row   = null;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!hash_equals($_SESSION['csrf'], (string)($_POST['csrf'] ?? ''))) {
        http_response_code(400);
        exit('Sesi tidak valid. Muat ulang halaman.');
    }
    $do = $_POST['do'] ?? '';
    if ($do === 'logout') { $_SESSION = []; session_destroy(); header('Location: admin.php'); exit; }

    if (!$in) {
        if ($do === 'register') {                     // daftar akun baru: akun pertama jadi owner utama; lainnya pilih pengguna, penjual, atau owner (butuh kode)
            $u = trim($_POST['u'] ?? ''); $p = (string)($_POST['p'] ?? '');
            if (!preg_match('/^\w{3,50}$/', $u)) $err[] = 'Username 3 sampai 50 karakter (huruf, angka, underscore).';
            if (strlen($p) < 8) $err[] = 'Password minimal 8 karakter.';
            if ($p !== (string)($_POST['p2'] ?? '')) $err[] = 'Konfirmasi password tidak sama.';
            $tp = in_array($_POST['tipe'] ?? '', ['user', 'admin', 'owner'], true) ? $_POST['tipe'] : 'user';
            if ($n === 0) $tp = 'owner';
            $kode = trim((string)($_POST['kode'] ?? ''));
            if ($n > 0 && $tp === 'owner' && !hash_equals(OWNER_CODE, $kode)) { usleep(600000); $err[] = 'Kode verifikasi owner salah.'; }
            if (!$err) {
                $c = $pdo->prepare('SELECT 1 FROM `user` WHERE username = ?'); $c->execute([$u]);
                if ($c->fetch()) $err[] = 'Username sudah dipakai.';
            }
            if (!$err) {
                $pdo->prepare('INSERT INTO `user` (username, password, peran) VALUES (?, ?, ?)')->execute([$u, md5($p), $tp]);
                $n++; $a = 'login'; $flash = 'Akun berhasil dibuat. Silakan login.';
            } else $a = 'daftar';
        } elseif ($do === 'login' && $n > 0) {
            $s = $pdo->prepare("SELECT id_user, username, password, IF(LOWER(peran) IN ('owner','admin'), LOWER(peran), 'user') AS role FROM `user` WHERE username = ?");
            $s->execute([trim($_POST['u'] ?? '')]);
            $r  = $s->fetch();
            $pw = (string)($_POST['p'] ?? '');
            $ok = false;
            if ($r && $r['password'] !== null && $r['password'] !== '') {
                $st = $r['password'];
                if (password_get_info($st)['algo']) {
                    $ok = password_verify($pw, $st);                      // hash bcrypt dari versi sebelumnya
                } elseif (preg_match('/^[a-f0-9]{32}$/i', $st)) {
                    $ok = hash_equals(strtolower($st), md5($pw));         // password MD5
                } elseif (hash_equals($st, $pw)) {                        // teks biasa: terima, lalu ganti jadi MD5
                    $ok = true;
                    $pdo->prepare('UPDATE `user` SET password = ? WHERE id_user = ?')->execute([md5($pw), $r['id_user']]);
                }
            }
            if ($ok) {
                session_regenerate_id(true);
                $_SESSION['uid']  = (int)$r['id_user'];
                $_SESSION['nama'] = $r['username'];
                $_SESSION['role'] = $r['role'];
                $_SESSION['csrf'] = bin2hex(random_bytes(16));
                header('Location: ' . (in_array($r['role'], ['owner', 'admin'], true) ? 'admin.php' : 'index.php')); exit;
            }
            usleep(600000);
            if (!$r) {                                        // akun sudah tidak ada: cek apakah pernah dihapus
                $dl = $pdo->prepare('SELECT password FROM akun_dihapus WHERE username = ? ORDER BY id DESC LIMIT 1');
                $dl->execute([trim($_POST['u'] ?? '')]);
                $dp = $dl->fetchColumn();
                if ($dp !== false && cek_pw((string)$dp, $pw)) $err[] = 'Akun ini sudah dihapus oleh owner, jadi tidak bisa login lagi. Hubungi owner kalau ini keliru, atau daftar dengan akun baru.';
            }
            if (!$err) $err[] = 'Username atau password salah.';
        }
    } else {
        if ($do === 'logout') { $_SESSION = []; session_destroy(); header('Location: admin.php'); exit; }

        if ($do === 'delete' && $isOwner) {                          // hapus lunak: status jadi 'deleted'
            $pdo->prepare("UPDATE seri SET status = 'deleted' WHERE id_seri = ?")->execute([(int)($_POST['id'] ?? 0)]);
            $_SESSION['flash'] = 'Produk dihapus dari katalog.';
            header('Location: admin.php'); exit;
        }

        if (($do === 'role' || $do === 'deluser') && $isOwner) {      // kelola akun (owner)
            $tid = (int)($_POST['id'] ?? 0);
            $tr = $pdo->prepare("SELECT IF(LOWER(peran) IN ('owner','admin'), LOWER(peran), 'user') FROM `user` WHERE id_user = ?");
            $tr->execute([$tid]); $trole = $tr->fetchColumn();
            if ($tid === $uid) $_SESSION['flash'] = 'Akunmu sendiri tidak bisa diubah atau dihapus dari sini.';
            elseif ($trole === false) $_SESSION['flash'] = 'Akun tidak ditemukan.';
            elseif ($trole === 'owner' && !$isUtama) $_SESSION['flash'] = 'Akun owner hanya bisa diubah oleh owner utama.';
            elseif ($do === 'deluser') {
                $pdo->prepare('INSERT INTO akun_dihapus (username, password, dihapus_oleh) SELECT username, password, ? FROM `user` WHERE id_user = ?')->execute([$uid, $tid]);
                $pdo->prepare('DELETE FROM `user` WHERE id_user = ?')->execute([$tid]);
                $_SESSION['flash'] = 'Akun dihapus.';
            }
            else { $pdo->prepare('UPDATE `user` SET peran = ? WHERE id_user = ?')->execute([($_POST['role'] ?? '') === 'admin' ? 'admin' : 'user', $tid]); $_SESSION['flash'] = 'Peran akun diubah.'; }
            header('Location: admin.php?a=akun'); exit;
        }

        if ($do === 'save') {
            $g  = fn($k) => trim((string)($_POST[$k] ?? ''));
            $id = $isOwner ? (int)($_POST['id'] ?? 0) : 0;      // penjual hanya boleh menambah
            $row = ['id_seri' => $id, 'id_tipe' => (int)$g('id_tipe'), 'nama_seri' => $g('nama_seri'), 'spek' => $g('spek'),
                    'harga' => $g('harga'), 'gambar1' => $g('gambar1'), 'gambar2' => $g('gambar2'), 'gambar3' => $g('gambar3'),
                    'status' => isset($STAT[$g('status')]) ? $g('status') : 'availabel'];
            $h = preg_replace('/\D/', '', $row['harga']);
            if ($row['nama_seri'] === '' || mb_strlen($row['nama_seri']) > 255) $err[] = 'Nama HP wajib diisi (maksimal 255 karakter).';
            $t = $pdo->prepare('SELECT 1 FROM tipe WHERE id_tipe = ?'); $t->execute([$row['id_tipe']]);
            if (!$t->fetch()) $err[] = 'Pilih tipe/seri HP.';
            if ($h === '' || strlen($h) > 9) $err[] = 'Harga tidak valid.';
            foreach (['gambar1', 'gambar2', 'gambar3'] as $k)
                if ($row[$k] !== '' && (!preg_match('#^https?://#i', $row[$k]) || strlen($row[$k]) > 255))
                    $err[] = "Link $k harus diawali http:// atau https:// (maksimal 255 karakter).";
            if (!$err) {
                $v = [$row['id_tipe'], $row['nama_seri'], $row['spek'], (int)$h, $row['gambar1'], $row['gambar2'], $row['gambar3'], $row['status']];
                if ($id) $pdo->prepare('UPDATE seri SET id_tipe=?, nama_seri=?, spek=?, harga=?, gambar1=?, gambar2=?, gambar3=?, status=? WHERE id_seri=?')->execute([...$v, $id]);
                else     $pdo->prepare('INSERT INTO seri (id_tipe, nama_seri, spek, harga, gambar1, gambar2, gambar3, status) VALUES (?,?,?,?,?,?,?,?)')->execute($v);
                $_SESSION['flash'] = 'Produk disimpan.';
                header('Location: admin.php'); exit;
            }
            $a = 'form';
        }
    }
}

function cek_pw(string $st, string $pw): bool {      // cocokkan password dengan nilai tersimpan (bcrypt, MD5, atau teks biasa)
    if ($st === '') return false;
    if (password_get_info($st)['algo']) return password_verify($pw, $st);
    if (preg_match('/^[a-f0-9]{32}$/i', $st)) return hash_equals(strtolower($st), md5($pw));
    return hash_equals($st, $pw);
}
function csrf(): string { return '<input type="hidden" name="csrf" value="' . e($_SESSION['csrf']) . '">'; }
?>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="noindex">
<title>Admin - <?= e(SITE_NAME) ?></title>
<link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@700;900&family=Rajdhani:wght@500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="style.css?v=<?= filemtime(__DIR__ . '/style.css') ?>">
</head>
<body class="adm">
<div class="wrap">
<?php if ($flash): ?><div class="msg"><?= e($flash) ?></div><?php endif; ?>
<?php foreach ($err as $x): ?><div class="msg e"><?= e($x) ?></div><?php endforeach; ?>

<?php if ($user): ?>
  <div class="panel login">
    <h1>Halo, <?= e($me['username']) ?></h1>
    <p class="sub" style="margin:8px 0 20px">Akunmu terdaftar sebagai pengguna biasa dan tidak punya akses ke panel ini. Panel hanya untuk penjual dan owner.</p>
    <div style="display:flex;gap:10px;flex-wrap:wrap">
      <a class="btn alt" href="index.php">Ke katalog</a>
      <form method="post"><?= csrf() ?><input type="hidden" name="do" value="logout"><button class="btn">Keluar</button></form>
    </div>
  </div>
<?php elseif (!$in): ?>
<?php $reg = ($n === 0) || ($a === 'daftar'); ?>
  <form method="post" class="panel login">
    <h1><?= $reg ? 'Daftar akun' : 'Login' ?></h1>
    <p class="sub" style="margin:8px 0 20px"><?= $reg ? ($n ? 'Isi data di bawah untuk membuat akun baru.' : 'Belum ada akun. Buat akun owner pertama sekarang.') : 'Masuk untuk mengelola katalog.' ?></p>
    <?= csrf() ?><input type="hidden" name="do" value="<?= $reg ? 'register' : 'login' ?>">
    <div class="f"><label for="u">Username</label><input id="u" name="u" required autocomplete="username" value="<?= e($_POST['u'] ?? '') ?>"></div>
    <div class="f"><label for="p">Password<?= $reg ? ' (minimal 8 karakter)' : '' ?></label><input id="p" name="p" type="password" required autocomplete="<?= $reg ? 'new-password' : 'current-password' ?>"></div>
    <?php if ($reg): ?>
      <div class="f"><label for="p2">Ulangi password</label><input id="p2" name="p2" type="password" required autocomplete="new-password"></div>
      <?php if ($n): ?>
        <div class="f"><label for="tipe">Daftar sebagai</label>
          <select id="tipe" name="tipe">
            <option value="user">Pengguna (melihat katalog)</option>
            <option value="admin"<?= ($_POST['tipe'] ?? '') === 'admin' ? ' selected' : '' ?>>Penjual (menambah produk)</option>
            <option value="owner"<?= ($_POST['tipe'] ?? '') === 'owner' ? ' selected' : '' ?>>Owner (butuh kode verifikasi)</option>
          </select></div>
        <div class="f" id="kodebox" style="display:none"><label for="kode">Kode verifikasi owner</label><input id="kode" name="kode" type="password" autocomplete="off"></div>
        <script>
          const tp = document.getElementById('tipe'), kb = document.getElementById('kodebox'), ki = document.getElementById('kode');
          const sync = () => { const o = tp.value === 'owner'; kb.style.display = o ? '' : 'none'; ki.required = o; };
          tp.addEventListener('change', sync); sync();
        </script>
      <?php endif; ?>
    <?php endif; ?>
    <button class="btn"><?= $reg ? 'Buat akun' : 'Masuk' ?></button>
    <?php if ($n): ?><p class="swap"><?= $reg ? 'Sudah punya akun? <a href="admin.php">Masuk</a>' : 'Belum punya akun? <a href="admin.php?a=daftar">Daftar akun baru</a>' ?></p><?php endif; ?>
  </form>

<?php else: ?>
  <div class="top">
    <h1><?= $isOwner ? 'Kelola katalog' : 'Tambah produk' ?></h1>
    <div style="display:flex;gap:10px;flex-wrap:wrap">
      <?php if ($isOwner): ?>
        <a class="btn sm alt" href="admin.php">Produk</a>
        <a class="btn sm alt" href="admin.php?a=akun">Kelola akun</a>
      <?php endif; ?>
      <a class="btn sm alt" href="index.php" target="_blank">Lihat katalog</a>
      <form method="post"><?= csrf() ?><input type="hidden" name="do" value="logout"><button class="btn sm alt">Keluar</button></form>
    </div>
  </div>

<?php if ($a === 'akun'):
    $us = $pdo->query("SELECT id_user, username, IF(LOWER(peran) IN ('owner','admin'), LOWER(peran), 'user') AS role FROM `user` ORDER BY id_user")->fetchAll();
?>
  <div class="panel tw">
    <table class="t">
      <tr><th>ID</th><th>Username</th><th>Peran</th><th></th></tr>
      <?php foreach ($us as $x): $xid = (int)$x['id_user']; ?>
        <tr>
          <td><?= $xid ?></td>
          <td><?= e($x['username']) ?><?= $xid === $uid ? ' (kamu)' : '' ?><?= $xid === $utama ? ' (owner utama)' : '' ?></td>
          <td><?= ['owner' => 'Owner', 'admin' => 'Penjual', 'user' => 'Pengguna'][$x['role']] ?></td>
          <td style="white-space:nowrap">
            <?php if ($xid !== $uid && ($x['role'] !== 'owner' || $isUtama)): ?>
              <form method="post" style="display:inline"><?= csrf() ?><input type="hidden" name="do" value="role"><input type="hidden" name="id" value="<?= $xid ?>"><input type="hidden" name="role" value="<?= $x['role'] === 'admin' ? 'user' : 'admin' ?>"><button class="btn sm alt"><?= ['owner' => 'Turunkan jadi penjual', 'admin' => 'Jadikan pengguna', 'user' => 'Jadikan penjual'][$x['role']] ?></button></form>
              <form method="post" style="display:inline" onsubmit="return confirm('Hapus akun ini?')"><?= csrf() ?><input type="hidden" name="do" value="deluser"><input type="hidden" name="id" value="<?= $xid ?>"><button class="btn sm del">Hapus</button></form>
            <?php endif; ?>
          </td>
        </tr>
      <?php endforeach; ?>
    </table>
  </div>
<?php elseif ($a === 'form'):
    if ($row === null) {
        $id = $isOwner ? (int)($_GET['id'] ?? 0) : 0;
        if ($id) { $s = $pdo->prepare("SELECT * FROM seri WHERE id_seri = ? AND NOT FIND_IN_SET('deleted', status)"); $s->execute([$id]); $row = $s->fetch() ?: null; }
        $row ??= ['id_seri' => 0, 'id_tipe' => 0, 'nama_seri' => '', 'spek' => '', 'harga' => '', 'gambar1' => '', 'gambar2' => '', 'gambar3' => '', 'status' => 'availabel'];
    }
    $st = str_contains($row['status'], 'not availabel') ? 'not availabel' : 'availabel';
    $tipe = $pdo->query('SELECT t.id_tipe, TRIM(t.tipe) AS tipe, TRIM(m.merk) AS merk FROM tipe t JOIN merk m ON m.id_merk = t.id_merk ORDER BY m.merk, t.tipe')->fetchAll();
?>
  <form method="post" class="panel">
    <h1 style="font-size:1.2rem;margin-bottom:18px"><?= $row['id_seri'] ? 'Edit produk' : 'Tambah produk' ?></h1>
    <?= csrf() ?><input type="hidden" name="do" value="save"><input type="hidden" name="id" value="<?= (int)$row['id_seri'] ?>">
    <div class="g2">
      <div class="f"><label for="nama_seri">Nama HP</label><input id="nama_seri" name="nama_seri" required maxlength="255" value="<?= e($row['nama_seri']) ?>"></div>
      <div class="f"><label for="harga">Harga (Rp)</label><input id="harga" name="harga" inputmode="numeric" required value="<?= e($row['harga']) ?>"></div>
      <div class="f"><label for="id_tipe">Tipe / seri</label>
        <select id="id_tipe" name="id_tipe" required><option value="">Pilih tipe</option>
          <?php $cur = null; foreach ($tipe as $t): if ($cur !== $t['merk']) { if ($cur !== null) echo '</optgroup>'; echo '<optgroup label="' . e($t['merk']) . '">'; $cur = $t['merk']; } ?>
            <option value="<?= $t['id_tipe'] ?>"<?= (int)$row['id_tipe'] === (int)$t['id_tipe'] ? ' selected' : '' ?>><?= e($t['tipe']) ?></option>
          <?php endforeach; if ($cur !== null) echo '</optgroup>'; ?>
        </select></div>
      <div class="f"><label for="status">Status</label>
        <select id="status" name="status"><?php foreach ($STAT as $k => $lbl): ?><option value="<?= e($k) ?>"<?= $st === $k ? ' selected' : '' ?>><?= $lbl ?></option><?php endforeach; ?></select></div>
    </div>
    <?php foreach ([1, 2, 3] as $i): ?>
      <div class="f"><label for="gambar<?= $i ?>">Link foto <?= $i ?></label><input id="gambar<?= $i ?>" name="gambar<?= $i ?>" type="url" maxlength="255" placeholder="https://..." value="<?= e($row['gambar' . $i]) ?>"></div>
    <?php endforeach; ?>
    <div class="f"><label for="spek">Spesifikasi</label>
      <textarea id="spek" name="spek" placeholder="• Chipset: Snapdragon 8 Gen 3&#10;• Layar: 6.8 inci AMOLED, 120Hz"><?= e($row['spek']) ?></textarea>
      <small style="color:var(--mut)">Satu spesifikasi per baris, diawali tanda • dan format "Judul: isi" agar tampil rapi di katalog.</small></div>
    <div style="display:flex;gap:10px;flex-wrap:wrap"><button class="btn">Simpan</button><a class="btn alt" href="admin.php">Batal</a></div>
  </form>

<?php else:
    $q = trim($_GET['q'] ?? '');
    $s = $pdo->prepare("SELECT s.id_seri, s.nama_seri, s.harga, s.gambar1, s.status, TRIM(t.tipe) AS tipe, TRIM(m.merk) AS merk
        FROM seri s JOIN tipe t ON t.id_tipe = s.id_tipe JOIN merk m ON m.id_merk = t.id_merk
        WHERE NOT FIND_IN_SET('deleted', s.status) AND (s.nama_seri LIKE ? OR m.merk LIKE ?)
        ORDER BY s.id_seri DESC");
    $s->execute(["%$q%", "%$q%"]);
    $list = $s->fetchAll();
?>
  <div class="top">
    <form method="get" style="flex:1 1 260px"><input name="q" type="search" placeholder="Cari nama atau merk" value="<?= e($q) ?>"></form>
    <a class="btn" href="admin.php?a=form">+ Tambah produk</a>
  </div>
  <div class="panel tw">
    <table class="t">
      <tr><th></th><th>Nama</th><th>Merk dan tipe</th><th>Harga</th><th>Status</th><th></th></tr>
      <?php foreach ($list as $r): ?>
        <tr>
          <td><?php if (preg_match('#^https?://#i', $r['gambar1'])): ?><img src="<?= e($r['gambar1']) ?>" alt="" loading="lazy" onerror="this.remove()"><?php endif; ?></td>
          <td><?= e($r['nama_seri']) ?></td>
          <td><?= e($r['merk'] . ' ' . $r['tipe']) ?></td>
          <td><?= e(rupiah($r['harga'])) ?></td>
          <td><?= str_contains($r['status'], 'not availabel') ? 'Stok habis' : 'Tersedia' ?></td>
          <td style="white-space:nowrap">
            <a class="btn sm alt" href="admin.php?a=form&id=<?= $r['id_seri'] ?>">Edit</a>
            <form method="post" style="display:inline" onsubmit="return confirm('Hapus produk ini dari katalog?')">
              <?= csrf() ?><input type="hidden" name="do" value="delete"><input type="hidden" name="id" value="<?= $r['id_seri'] ?>"><button class="btn sm del">Hapus</button></form>
          </td>
        </tr>
      <?php endforeach; ?>
      <?php if (!$list): ?><tr><td colspan="6" style="color:var(--mut)">Tidak ada produk.</td></tr><?php endif; ?>
    </table>
  </div>
<?php endif; endif; ?>
</div>
</body>
</html>
