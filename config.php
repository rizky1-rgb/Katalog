<?php
// ====== Sesuaikan dengan server kamu ======
const DB_HOST   = 'localhost';
const DB_NAME   = 'katalog hp';   // samakan dengan nama database hasil import SQL
const DB_USER   = 'root';
const DB_PASS   = '';
const WA_NUMBER = '6281234567890'; // nomor WhatsApp toko, format 62xxxx tanpa + atau 0
const SITE_NAME = 'Katalog HP';
// Kode verifikasi untuk daftar sebagai owner di admin.php. Ganti isinya kalau mau kode lain.
const OWNER_CODE = 'aksesowner1';

function db(): PDO {
    static $pdo = null;
    if (!$pdo) {
        $pdo = new PDO(
            'mysql:host=' . DB_HOST . ';dbname=' . DB_NAME . ';charset=utf8mb4',
            DB_USER, DB_PASS,
            [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC]
        );
    }
    return $pdo;
}

function e($s): string { return htmlspecialchars((string)$s, ENT_QUOTES, 'UTF-8'); }

function rupiah($n): string { return 'Rp ' . number_format((int)$n, 0, ',', '.'); }

// Ubah teks spek ("• Chipset: ...") menjadi pasangan [label, isi]
function parse_spek(string $t): array {
    $out = [];
    foreach (preg_split('/\R/u', $t) as $l) {
        $l = trim($l);
        if ($l === '' || mb_substr($l, 0, 1) !== '•') continue;
        $l = trim(mb_substr($l, 1));
        $p = explode(':', $l, 2);
        $out[] = count($p) === 2 ? [trim($p[0]), trim($p[1])] : ['', $l];
    }
    return $out;
}
