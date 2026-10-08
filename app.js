const $ = s => document.querySelector(s);
const $$ = s => [...document.querySelectorAll(s)];
const cards = $$('.card');
const byId = Object.fromEntries(ITEMS.map(i => [i.id, i]));
const reduce = matchMedia('(prefers-reduced-motion: reduce)').matches;
let merk = 'all', favOnly = false, q = '', gal = [];

// Favorit tersimpan di browser
let fav = new Set();
try { fav = new Set(JSON.parse(localStorage.getItem('fav') || '[]')); } catch (e) {}
const saveFav = () => { try { localStorage.setItem('fav', JSON.stringify([...fav])); } catch (e) {} };

// Gambar yang gagal dimuat diganti placeholder
const fix = im => { const f = () => { im.onerror = null; im.src = PH; }; im.onerror = f; if (im.complete && !im.naturalWidth) f(); };
$$('.thumb img').forEach(fix);

// Cahaya neon mengikuti kursor
if (!reduce) addEventListener('pointermove', e => { const g = $('#glow'); g.style.left = e.clientX + 'px'; g.style.top = e.clientY + 'px'; });

// Filter + pencarian instan
function apply() {
  let n = 0;
  cards.forEach(c => {
    const ok = (merk === 'all' || c.dataset.merk === merk) && (!favOnly || fav.has(c.dataset.id)) && c.dataset.q.includes(q);
    c.hidden = !ok; if (ok) n++;
  });
  $('#count').textContent = n;
  $('.empty').style.display = n ? 'none' : 'block';
}
$('#q').addEventListener('input', e => { q = e.target.value.trim().toLowerCase(); apply(); });
$('#sort').addEventListener('change', e => {
  const v = e.target.value, g = $('.grid');
  [...cards].sort((a, b) => v === 'lo' ? a.dataset.harga - b.dataset.harga : v === 'hi' ? b.dataset.harga - a.dataset.harga : a.dataset.id - b.dataset.id).forEach(c => g.append(c));
});
const setMerk = v => {
  merk = v;
  $$('.chip[data-m]').forEach(x => x.classList.toggle('on', x.dataset.m === v));
  $('#merkSel').value = v;
  apply();
};
$$('.chip[data-m]').forEach(b => b.addEventListener('click', () => setMerk(b.dataset.m)));
$('#merkSel').addEventListener('change', e => setMerk(e.target.value));
$('#favchip').addEventListener('click', e => { favOnly = !favOnly; e.currentTarget.classList.toggle('on', favOnly); apply(); });

// Favorit
const upFav = () => { $('#favn').textContent = fav.size; };
$$('.fav').forEach(b => {
  const id = b.closest('.card').dataset.id;
  b.classList.toggle('on', fav.has(id));
  b.addEventListener('click', e => {
    e.stopPropagation();
    fav.has(id) ? fav.delete(id) : fav.add(id);
    b.classList.remove('on'); void b.offsetWidth; b.classList.toggle('on', fav.has(id));
    saveFav(); upFav(); apply();
  });
});
upFav();

// Kartu miring 3D mengikuti kursor + kilau cahaya
cards.forEach(c => {
  if (!reduce) {
    c.addEventListener('pointermove', e => {
      if (e.pointerType === 'touch') return;
      const r = c.getBoundingClientRect(), x = (e.clientX - r.left) / r.width, y = (e.clientY - r.top) / r.height;
      c.style.transform = `rotateY(${(x - .5) * 14}deg) rotateX(${(.5 - y) * 14}deg) scale(1.03)`;
      c.style.setProperty('--mx', x * 100 + '%'); c.style.setProperty('--my', y * 100 + '%');
    });
    c.addEventListener('pointerleave', () => { c.style.transform = ''; });
  }
  c.addEventListener('click', () => openModal(c.dataset.id));
  c.addEventListener('keydown', e => { if (e.key === 'Enter') openModal(c.dataset.id); });
});

// Detail produk
// Slideshow: timer JS, jadi tetap jalan walau animasi CSS dimatikan di perangkat
let cur = 0, timer = null, hold = false;
const TICK = 3500; // jeda antar foto (ms), samakan dengan durasi "fill" di style.css
function play() {
  clearTimeout(timer);
  if (gal.length > 1 && !hold) timer = setTimeout(() => show((cur + 1) % gal.length), TICK);
}
// Berhenti saat mouse di atas galeri, lanjut saat keluar
const galEl = $('.gal');
galEl.addEventListener('pointerenter', e => { if (e.pointerType === 'mouse') { hold = true; clearTimeout(timer); } });
galEl.addEventListener('pointerleave', e => { if (e.pointerType === 'mouse') { hold = false; play(); } });
function show(k) {
  cur = k;
  const im = $('#m-img');
  im.style.opacity = 0;
  setTimeout(() => { im.src = gal[k]; im.onerror = () => { im.onerror = null; im.src = PH; }; im.style.opacity = 1; }, 120);
  $$('#m-thumbs button').forEach((b, j) => b.classList.toggle('on', j === k));
  play();
}
function openModal(id) {
  const i = byId[id]; if (!i) return;
  gal = i.img.length ? i.img : [PH];
  $('#m-brand').textContent = i.merk + ' ' + i.tipe;
  $('#m-name').textContent = i.nama;
  $('#m-img').alt = i.nama;
  $('#m-price').textContent = i.rp + (i.habis ? ' (stok habis)' : '');
  const th = $('#m-thumbs'); th.replaceChildren();
  if (gal.length > 1) gal.forEach((u, k) => {
    const b = document.createElement('button'), im = document.createElement('img');
    im.src = u; im.alt = 'Foto ' + (k + 1); fix(im); b.append(im);
    b.addEventListener('click', () => show(k)); th.append(b);
  });
  const sp = $('#m-spec'); sp.replaceChildren();
  i.spek.forEach(([l, v]) => {
    const li = document.createElement('li'), b = document.createElement('b'), s = document.createElement('span');
    b.textContent = l; s.textContent = v; li.append(b, s); sp.append(li);
  });
  $('#m-wa').href = 'https://wa.me/' + WA + '?text=' + encodeURIComponent('Halo, saya tertarik dengan ' + i.nama + ' (' + i.rp + '). Apakah masih tersedia?');
  show(0);
  $('#modal').classList.add('open'); $('#modal').setAttribute('aria-hidden', 'false');
  document.body.style.overflow = 'hidden';
}
function closeModal() {
  clearTimeout(timer); hold = false;
  $('#m-thumbs').replaceChildren();
  $('#modal').classList.remove('open'); $('#modal').setAttribute('aria-hidden', 'true');
  document.body.style.overflow = '';
}
$('#close').addEventListener('click', closeModal);
$('#modal').addEventListener('click', e => { if (e.target.id === 'modal') closeModal(); });
addEventListener('keydown', e => {
  if (e.key === 'Escape') closeModal();
  if (e.key === '/' && document.activeElement.tagName !== 'INPUT') { e.preventDefault(); $('#q').focus(); }
});
