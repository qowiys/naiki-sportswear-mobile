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