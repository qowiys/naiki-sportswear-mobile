# Tugas 7
1. Widget Tree adalah struktur hierarki berbentuk pohon yang menggambarkan bagaimana widget-widget disusun dalam aplikasi Flutter. Setiap widget dapat memiliki widget lain sebagai child (anak), dan widget tersebut menjadi parent (induk).

Cara Kerja Hubungan Parent-Child:
- Parent bertanggung jawab merender dan mengelola child-nya
- Child mewarisi konteks dan tema dari parent
- Parent menentukan constraint (batasan ukuran) untuk child
- Komunikasi data mengalir dari parent ke child melalui constructor parameters
- Contoh di tugas: Scaffold → Padding → Column → Row → InfoCard

2. 
MaterialApp         Root widget aplikasi, menyediakan Material Design dan routing
Scaffold            Struktur dasar halaman (AppBar, Body, dll)
AppBar              Bar di bagian atas halaman untuk judul dan aksi
Text                Menampilkan teks
Padding             Memberikan jarak/ruang di sekeliling widget child
Column              Menyusun widget secara vertikal (dari atas ke bawah)
Row                 Menyusun widget secara horizontal (dari kiri ke kanan)
SizedBox            Membuat kotak dengan ukuran tetap, sering untuk spacing
Center              Menempatkan child widget di tengah
GridView.count      Menampilkan widget dalam bentuk grid dengan jumlah kolom tetap
Card                Kotak dengan elevasi (bayangan) untuk menampilkan informasi
Container           Widget serbaguna untuk styling (padding, margin, ukuran, dll)
Material            Memberikan efek Material Design (warna, shape, ink effects)
InkWell             Memberikan efek ripple saat widget ditekan
Icon                Menampilkan ikon
MediaQuery          Mengakses informasi tentang ukuran dan orientasi layar
ScaffoldMessenger   Menampilkan SnackBar dan notifikasiSnackBarNotifikasi sementara di bagian bawah layar

3. Fungsi MaterialApp:

- Menyediakan Material Design theme untuk seluruh aplikasi
- Mengelola routing dan navigasi antar halaman
- Menyediakan Localizations untuk internasionalisasi
- Mengatur title aplikasi yang muncul di task manager
- Menyediakan Navigator untuk navigasi
- Mengatur theme (warna, font, dll) secara global

Mengapa Sering Digunakan sebagai Root Widget:

- Foundation: Menyediakan fondasi Material Design yang konsisten
- Theme Management: Satu tempat untuk mengatur tema aplikasi
- Navigation: Built-in navigation system
- Best Practice: Mengikuti guidelines Google Material Design
- Convenience: Menyediakan banyak fitur out-of-the-box (MediaQuery, Localizations, dll)

Tanpa MaterialApp, harus manually setup banyak fitur dasar.

4. StatelessWidget

- Immutable (tidak berubah)
- Tidak memiliki state internal yang bisa berubah
- Di-rebuild hanya jika parent widget rebuild dengan data berbeda
- Lebih efisien karena lebih sederhana

Kapan Menggunakan:

- UI yang statis (tidak ada interaksi yang mengubah tampilan)
- Hanya menampilkan data yang diterima dari parent
- Contoh: Text, Icon, Card dengan data tetap

Contoh di tugas: InfoCard, ItemCard → hanya menampilkan data, tidak ada perubahan state
StatefulWidget

- Mutable (bisa berubah)
- Memiliki objek State yang menyimpan data yang bisa berubah
- Bisa rebuild dirinya sendiri dengan setState()
- Cocok untuk interaksi user

Kapan Menggunakan:

- Ada animasi
- Ada form input
- Data yang berubah berdasarkan user interaction
- Contoh: Checkbox, TextField, Counter

5. Apa itu BuildContext?

- Objek yang merepresentasikan lokasi widget dalam widget tree
- Handle untuk mengakses informasi tentang widget tree
- "Alamat" widget dalam hierarki

Mengapa Penting:

- Akses Theme: Theme.of(context).colorScheme.primary
- Navigation: Navigator.of(context).push()
- Show Dialogs/SnackBar: ScaffoldMessenger.of(context).showSnackBar()
- MediaQuery: MediaQuery.of(context).size.width
- InheritedWidget: Mengakses data yang di-share dari ancestor widget

Penggunaan di Method build:

@override
Widget build(BuildContext context) {
  // context digunakan untuk akses theme
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary, // Akses theme
    ),
    body: Container(
      width: MediaQuery.of(context).size.width, // Akses ukuran layar
    ),
  );
}   

Context dari method build merujuk pada widget yang sedang di-build, sehingga bisa mengakses parent widgets di atasnya dalam tree.

6. Hot Reload

- Kecepatan: Sangat cepat (< 1 detik)
- Yang Dipertahankan: State aplikasi tetap (data, posisi scroll, dll)
- Yang Di-update: Code changes di method build() dan UI
- Kapan Digunakan: Perubahan UI, styling, logic di build method
- Shortcut: r di terminal atau ⌘\ (Mac) / Ctrl+\ (Windows)

Limitasi:

- Tidak reload perubahan di method main()
- Tidak reload perubahan di initState()
- Tidak reload perubahan pada global variables atau static fields

Hot Restart

- Kecepatan: Lebih lambat (beberapa detik)
- Yang Terjadi: Aplikasi restart dari awal, semua state hilang
- Yang Di-update: Semua code changes, termasuk main() dan initialization
- Kapan Digunakan:
    - Perubahan di main()
    - Menambah/menghapus dependencies
    - Perubahan yang hot reload tidak bisa handle
- Shortcut: R (kapital) di terminal atau ⌘⇧\ (Mac) / Ctrl+Shift+\ (Windows)

Analogi Sederhana:

- Hot Reload = Ganti wallpaper komputer (cepat, data tetap ada)
- Hot Restart = Restart komputer (lebih lama, mulai dari awal)

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# Tugas 8

1. Navigator.push() = Menambahkan halaman baru di atas halaman sebelumnya. Halaman lama tetap ada di stack dan bisa dikembalikan dengan tombol “back”.
   Digunakan saat menekan produk di daftar, lalu melihat detail produk. Setelah selesai, mereka bisa kembali ke daftar produk.

   Navigator.pushReplacement() = Mengganti halaman saat ini dengan halaman baru. Halaman lama dihapus dari stack, jadi tidak bisa kembali ke halaman sebelumnya.
   Digunakan setelah menyimpan data form (misalnya menambah produk baru), aplikasi langsung kembali ke halaman utama (Home) tanpa bisa kembali ke form tersebut.

2. Scaffold: Kerangka utama setiap halaman. Menyediakan area untuk AppBar, Drawer, body, dan FloatingActionButton.
   AppBar: Bagian atas halaman, berisi judul dan tombol aksi (seperti icon keranjang atau logout).
   Drawer: Navigasi samping untuk berpindah antar halaman (misalnya ke Home, Products, Orders, Profile).

   contoh di kode: productlist_form.dart line 35 ke bawah

3. Widget Padding digunakan untuk memberikan jarak antara setiap elemen form dengan tepi layar, sehingga tampilan tidak terlalu rapat dan lebih nyaman dilihat oleh pengguna.
   Digunakan pada kolom Nama Produk, Harga, Deskripsi, Kategori, Thumbnail, dan Switch Produk Unggulan.

   Widget SingleChildScrollView digunakan untuk membungkus seluruh isi form di dalam body halaman.
   Digunakan untuk membuat halaman dapat discroll.

   Widget Column digunakan untuk menyusun semua elemen form secara vertikal.
   Digunakan mulai dari kolom Nama Produk hingga tombol Save.

4. Agar Football Shop memiliki identitas visual yang konsisten kita harus mengatur theme global di file main.dart.

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# Tugas 9

1. 
- Validasi tipe & null-safety
Dengan model (kelas Dart dengan field bertipe), kamu memaksa parsing dan konversi eksplisit (mis. json['age'] as int atau fallback). Kalau pakai Map bebas, error tipe akan muncul tiba-tiba di runtime (casting error, NoSuchMethodError) dan lebih susah dilacak. Model memudahkan memilih default, menangani missing key, dan mengurangi !/? abuse.

- Keamanan dan konsistensi data
Model memungkinkan central place untuk normalisasi data (e.g. parse date string → DateTime, ubah 0/1 → bool). Tanpa itu, setiap file UI dapat menangani parsing berbeda → bug.

- Autocompletion & refactor
IDE (VS Code / Android Studio) otomatis bantu ketika kamu punya tipe; mengganti nama field satu tempat lebih mudah. Map kehilangan semua keuntungan ini.

- Testing & maintainability
Unit test lebih mudah (bisa buat instance model contoh). Selain itu, jika API berubah, cari/ubah constructors / fromJson cukup di satu file, bukan di banyak widget.

2. 
- http (package:http)
Library HTTP dasar di Dart/Flutter untuk GET/POST/PUT/DELETE dan menerima response (headers, body). Cocok untuk request stateless (mis. public API, token-based jika kamu sendiri menambah Authorization header). Dokumentasi dasar ada di panduan Flutter networking. 

- CookieRequest (dari paket pbp_django_auth / pbp_django_auth_extended atau implementasi sejenis)
Ini wrapper/abstraction di atas HTTP yang mengelola cookie session otomatis (menerima Set-Cookie pada response, menyimpan cookie, mengirimkan cookie pada request selanjutnya), plus fitur helper untuk login/logout menggunakan session Django dan integrasi dengan Provider supaya status autentikasi tersedia di seluruh widget. Jadi CookieRequest memudahkan session-based auth dengan Django. Dokumentasi paket menyarankan menyediakan instance CookieRequest melalui Provider.

3. Alasannya praktis dan teknis:

- State autentikasi terpusat: cookie/session adalah state global (user logged-in, cookie session id). Jika setiap widget pakai instance terpisah, mereka mungkin tidak berbagi cookie yang sama → beberapa bagian aplikasi “tidak tahu” user sudah login.

- Konsistensi header dan pengiriman cookie: CookieRequest bertugas menyisipkan cookie + header CSRF yang diperlukan pada setiap request. Bila hanya dibuat local di satu widget, request lain tidak mendapatkan cookie → 403/unauthorized.

- Mudah inject & mock: pakai Provider atau InheritedWidget membuatnya sederhana untuk testing dan mocking (satu source of truth). Dokumentasi paket menekankan menyediakan CookieRequest via Provider di root app.

4. 
- 10.0.2.2 pada emulator
Android emulator tidak melihat localhost/127.0.0.1 host-mu — localhost di emulator berarti device sendiri. Android menyediakan alias khusus 10.0.2.2 untuk menunjuk ke loopback host-mu. Jadi saat dev, URL API dari Flutter (emulator) biasanya http://10.0.2.2:8000/. Jika tidak pakai alamat ini, emulator tidak akan terhubung ke backend lokal. (Dokumentasi Android emulator). 

- ALLOWED_HOSTS di Django
Django menolak request yang Host header-nya tidak ada di ALLOWED_HOSTS. Kalau emulator mengakses 10.0.2.2, Django mungkin menolak kecuali 10.0.2.2 (atau wildcard saat dev) ditambahkan. Kalau tidak ditambahkan → DisallowedHost dan 400 response. 

- CORS & SameSite / cookie attributes
Untuk session-based auth via cookies dari origin lain (mis. Flutter web, atau mobile yang meniru cross-origin), backend harus mengizinkan cross-origin dan mengizinkan pengiriman cookie:

  - django-cors-headers: set CORS_ALLOW_ALL_ORIGINS/CORS_ALLOWED_ORIGINS dan CORS_ALLOW_CREDENTIALS = True.

  - Cookie harus dibuat dengan SameSite=None dan Secure sesuai kebutuhan (untuk cross-site cookie pada browser; untuk development HTTP, harus hati-hati dengan Secure yang mengharuskan HTTPS). Jika pengaturan ini salah, cookie session/CSRFTOKEN tidak akan dikirim atau browser/emulator akan menolak set-cookie. Banyak masalah autentikasi lintas-origin disebabkan oleh kombinasi CORS, SameSite dan Secure. 

- Android: permission INTERNET
Aplikasi Android harus men-declare <uses-permission android:name="android.permission.INTERNET" /> di AndroidManifest.xml. Tanpa ini, tidak ada koneksi jaringan (atau koneksi terbatasi), khususnya di build release. Flutter docs menyarankan ini. 

Konsekuensi kalau salah konfigurasi

- Tidak bisa terhubung (timeout / connection refused).
- Django menolak dengan DisallowedHost.
- Cookies tidak diset atau tidak dikirim → login gagal, selalu 403 atau tampilan “not logged in”.
- Request CORS preflight gagal → browser/Flutter web menolak request.

5. 
User input di UI —> data dikumpulkan (controller.text atau form fields).

Validasi lokal —> periksa required, format (email), panjang, dsb.

Buat model / DTO —> convert ke Map<String,dynamic> via toJson() dari model Dart.

Panggil service/repository —> service memanggil CookieRequest atau http untuk POST ke endpoint Django.

Pada CookieRequest, cookie (sessionid) dan header CSRF ditambahkan otomatis jika login diperlukan.

Server Django memproses request: validasi, simpan DB, return JSON (biasanya objek baru). Jika server mengubah state session, ia mengirim Set-Cookie header.

Client (Flutter) menerima response: parse JSON → Model.fromJson → update state (Provider / setState / Bloc).

UI rebuild berdasarkan state baru → data tampil.

Jika terjadi error: tampilkan snackbar/dialog berdasarkan HTTP status dan message. Pastikan handling code untuk status 4xx/5xx.

6. Alur end-to-end (session & CSRF):

A. Register

Flutter kirim POST /register/ dengan payload (username, password, etc.) lewat CookieRequest/http.

Django membuat user, biasanya mengembalikan status 201 dan mungkin otomatis login atau tidak. Jika otomatis login, server akan mengirim Set-Cookie: sessionid=... dan Set-Cookie: csrftoken=....

CookieRequest menangkap cookie dan menyimpannya; UI menandai user sebagai logged-in.

B. Login

Flutter kirim POST /login/ dengan credentials. Jika menggunakan CSRF, client harus mengirim header X-CSRFToken (mengambil csrftoken yang sebelumnya diset atau endpoints khusus untuk mendapat CSRF). Namun umumnya paket pbp_django_auth/CookieRequest sudah bantu flow ini: ambil csrf, submit form dengan cookies.

Django memverifikasi, jika sukses mengembalikan Set-Cookie: sessionid=....

CookieRequest menyimpan cookie; karena shared instance, semua widget bisa cek isLoggedIn. UI menavigasi ke area yang perlu login.

C. Menggunakan sesi

Untuk request selanjutnya yang memerlukan autentikasi, CookieRequest menyertakan cookie sessionid di header Cookie, sehingga server tahu user tersebut. Tanpa cookie, server dianggap anonymous.

D. Logout

Flutter panggil endpoint POST /logout/. Django menghapus session dan biasanya menghapus cookie (mengirim Set-Cookie untuk mengosongkan sessionid).

CookieRequest membersihkan cookie lokal; UI update ke state logged-out.

Catatan CSRF: jika backend memakai CSRF protection (Django default), kamu perlu memastikan client mengirim token CSRF pada requests yang state-changing (POST/PUT/DELETE). Paket CookieRequest / integrasi biasanya menyediakan mekanisme untuk mengambil dan mengirim token ini. Jika tidak, server mereturn 403. (Masalah ini sering terjadi jika CORS/credentials/SameSite salah).

7. 
- Buat djanggo-app baru bernama authentication dan install django-cors-headers

- Konfigurasikan Django untuk CORS & Cookies di settings.py

- Tambahkan fungsi untuk login dan register di authenticaion/views.py dan routing di authenticaion/urls.py

- Buat login.dart dan register.dart di flutter

- Buat models kustom pada flutter berdasarkan endpoint json 

- Buat endpoint json di django untuk daftar produk

- Fetch produk di flutter dan buat list produk dan detail produk

- Tambahkan fungsi untuk logoutdi authenticaion/views.py dan routing di authenticaion/urls.py dan buat file .dart nya