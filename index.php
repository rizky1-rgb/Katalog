<?php
require __DIR__ . '/config.php';
session_set_cookie_params(['httponly' => true, 'samesite' => 'Lax']);
session_start();
$label = empty($_SESSION['uid']) ? 'Masuk' : (['owner' => 'Owner', 'admin' => 'Penjual'][$_SESSION['role'] ?? ''] ?? 'Akun ' . ($_SESSION['nama'] ?? ''));

try {
    $rows = db()->query(
        "SELECT s.id_seri, s.nama_seri, s.spek, s.harga, s.gambar1, s.gambar2, s.gambar3, s.status,
                TRIM(t.tipe) AS tipe, TRIM(m.merk) AS merk
         FROM seri s
         JOIN tipe t ON t.id_tipe = s.id_tipe
         JOIN merk m ON m.id_merk = t.id_merk
         WHERE NOT FIND_IN_SET('deleted', s.status)
         ORDER BY s.id_seri"
    )->fetchAll();
} catch (PDOException $ex) {
    error_log($ex->getMessage());
    http_response_code(500);
    exit('Database belum bisa diakses. Cek pengaturan di config.php.');
}

$items = [];
$brands = [];
foreach ($rows as $r) {
    $imgs = array_values(array_filter(
        [$r['gambar1'], $r['gambar2'], $r['gambar3']],
        fn($u) => preg_match('#^https?://#i', $u)
    ));
    $items[] = [
        'id'    => (int)$r['id_seri'],
        'nama'  => $r['nama_seri'],
        'merk'  => $r['merk'],
        'tipe'  => $r['tipe'],
        'harga' => (int)$r['harga'],
        'rp'    => rupiah($r['harga']),
        'habis' => str_contains($r['status'], 'not availabel'),
        'img'   => $imgs,
        'spek'  => parse_spek($r['spek']),
    ];
    $brands[$r['merk']] = ($brands[$r['merk']] ?? 0) + 1;
}

$svg = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 120 120"><rect x="38" y="12" width="44" height="96" rx="9" fill="none" stroke="#00f0ff" stroke-width="3"/><rect x="52" y="19" width="16" height="3" rx="1.5" fill="#ff2bd6"/><circle cx="60" cy="98" r="3" fill="#ff2bd6"/></svg>';
$PH = 'data:image/svg+xml,' . rawurlencode($svg);
?>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?= e(SITE_NAME) ?></title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@700;900&family=Rajdhani:wght@500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="style.css?v=<?= filemtime(__DIR__ . '/style.css') ?>">
</head>
<body>
<div id="glow"></div>

<header class="hero">
  <a class="admin-link" href="admin.php"><?= e($label) ?></a>
  <h1 class="logo"><?= e(SITE_NAME) ?></h1>
  <p class="sub">Cari HP, bandingkan spesifikasinya, lalu tanya harga lewat WhatsApp.</p>
</header>

<div class="bar">
  <div class="bar-in">
    <div class="search"><input id="q" type="search" placeholder="Cari nama HP atau merk (tekan / )" autocomplete="off"></div>
    <select id="sort" aria-label="Urutkan">
      <option value="def">Urutan awal</option>
      <option value="lo">Harga terendah</option>
      <option value="hi">Harga tertinggi</option>
    </select>
    <select id="merkSel" aria-label="Pilih merk">
      <option value="all">Semua merk (<?= count($items) ?>)</option>
      <?php foreach ($brands as $b => $n): ?>
        <option value="<?= e($b) ?>"><?= e($b) ?> (<?= $n ?>)</option>
      <?php endforeach; ?>
    </select>
    <div class="chips">
      <button class="chip on" data-m="all">Semua <i><?= count($items) ?></i></button>
      <?php foreach ($brands as $b => $n): ?>
        <button class="chip" data-m="<?= e($b) ?>"><?= e($b) ?> <i><?= $n ?></i></button>
      <?php endforeach; ?>
      <button class="chip" id="favchip">♥ Favorit <i id="favn">0</i></button>
    </div>
  </div>
</div>

<main>
  <p class="count"><b id="count"><?= count($items) ?></b> HP ditemukan</p>
  <div class="grid">
    <?php foreach ($items as $i): ?>
      <article class="card<?= $i['habis'] ? ' out' : '' ?>" data-id="<?= $i['id'] ?>" data-merk="<?= e($i['merk']) ?>" data-harga="<?= $i['harga'] ?>" data-q="<?= e(mb_strtolower($i['nama'] . ' ' . $i['merk'] . ' ' . $i['tipe'])) ?>" tabindex="0">
        <button class="fav" aria-label="Simpan ke favorit">♥</button>
        <?php if ($i['habis']): ?><span class="badge">Stok habis</span><?php endif; ?>
        <div class="thumb"><img loading="lazy" src="<?= e($i['img'][0] ?? $PH) ?>" alt="<?= e($i['nama']) ?>"></div>
        <div class="info">
          <small><?= e($i['merk'] . ' ' . $i['tipe']) ?></small>
          <h3><?= e($i['nama']) ?></h3>
          <div class="price"><?= e($i['rp']) ?></div>
        </div>
      </article>
    <?php endforeach; ?>
  </div>
  <p class="empty">Tidak ada HP yang cocok. Coba kata kunci lain atau pilih merk Semua.</p>
</main>

<div class="modal" id="modal" aria-hidden="true">
  <div class="sheet" role="dialog" aria-modal="true" aria-labelledby="m-name">
    <button class="x" id="close" aria-label="Tutup">✕</button>
    <div class="gal">
      <div class="main"><img id="m-img" alt=""></div>
      <div class="thumbs" id="m-thumbs"></div>
    </div>
    <div class="det">
      <small id="m-brand"></small>
      <h2 id="m-name"></h2>
      <div class="price big" id="m-price"></div>
      <ul class="spec" id="m-spec"></ul>
      <a class="btn" id="m-wa" target="_blank" rel="noopener">Tanya lewat WhatsApp</a>
    </div>
  </div>
</div>

<script>
const ITEMS = <?= json_encode($items, JSON_HEX_TAG | JSON_HEX_AMP | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_UNESCAPED_UNICODE) ?>;
const PH = <?= json_encode($PH) ?>;
const WA = <?= json_encode(WA_NUMBER) ?>;
</script>
<script src="app.js?v=<?= filemtime(__DIR__ . '/app.js') ?>"></script>
</body>
</html>
