<div align="center">

**TUGAS PENDAHULUAN**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**MODUL 10**  
**DATA STORAGE BAGIAN 1**

<img src="https://github.com/user-attachments/assets/8ffbc3d9-1f18-4a72-8723-692ba5757f0c" alt="Logo_Telkom_University" width="25%">

**Disusun Oleh**:  
Kholil Abdi Prasetiyo / 2211104071  
SISE-06-02

**Asisten Praktikum**:  
Muhammad Faza Zulian Gesit Al Barru  
Aisyah Hasna Aulia

**Dosen Pengampu**:  
Yudha Islami Sulistya, S.Kom., M.Cs

**PROGRAM STUDI S1 SOFTWARE ENGINEERING**  
**FAKULTAS INFORMATIKA**  
**TELKOM UNIVERSITY PURWOKERTO**  
**2024**
</div>

---
<div align="center">
  
**TUGAS PENDAHULUAN**  
  
</div>

## 1. Jelaskan secara singkat fungsi SQLite dalam pengembangan aplikasi mobile!
SQLite adalah database relasional ringan yang sering digunakan dalam pengembangan aplikasi mobile karena sifatnya yang cepat, efisien, dan mudah diintegrasikan. Berbeda dengan server database lainnya, SQLite bersifat serverless, artinya semua data disimpan dalam satu file di perangkat, sehingga meminimalkan kebutuhan konfigurasi tambahan. Fungsinya meliputi penyimpanan dan pengelolaan data aplikasi secara lokal, seperti data pengguna, pengaturan aplikasi, atau cache, tanpa memerlukan koneksi internet. SQLite mendukung operasi SQL standar, membuatnya ideal untuk aplikasi yang membutuhkan manajemen data terstruktur dengan performa tinggi, sekaligus menjaga ukuran aplikasi tetap kecil.

## 2. Apa saja yang dimaksud dengan operasi CRUD? Berikan penjelasan singkat untuk masing-masing operasi!
Operasi CRUD adalah empat fungsi utama yang digunakan dalam pengelolaan data pada basis data atau aplikasi. Berikut penjelasan singkat masing-masing operasi:
- Create (C)  
  Operasi untuk menambahkan data baru ke dalam basis data. Contohnya, menyimpan informasi pengguna baru seperti nama dan email.
- Read (R)  
  Operasi untuk membaca atau mengambil data dari basis data tanpa mengubahnya. Contohnya, menampilkan daftar produk dalam aplikasi e-commerce.
- Update (U)  
  Operasi untuk mengubah data yang sudah ada di basis data. Contohnya, memperbarui alamat pengguna yang sudah terdaftar.
- Delete (D)  
  Operasi untuk menghapus data dari basis data. Contohnya, menghapus akun pengguna yang tidak lagi aktif.

## 3. Tuliskan kode SQL untuk membuat tabel bernama users dengan kolom berikut :
- id (integer, primary key, auto increment)
- name (text)
- email (text)
- createdAt (timestamp, default value adalah waktu sekarang)
  ```sql
  CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  );
  ```

## 4. Sebutkan langkah-langkah utama untuk menggunakan plugin sqflite di dalam Flutter!
- Tambahkan Dependensi  
    Tambahkan sqflite dan path di pubspec.yaml, lalu jalankan flutter pub get.  
    dependencies:  
    sqflite: ^2.0.0+4  
    path: ^1.8.0  
- Import library  
    import 'package:sqflite/sqflite.dart';  
    import 'package:path/path.dart';  
- Buat Database  
Buat atau buka database menggunakan fungsi openDatabase. Biasanya, database disimpan di direktori aplikasi:
- Gunakan Operasi CRUD  
- Integrasikan dengan UI Flutte  
Panggil fungsi database pada bagian yang sesuai dalam aplikasi (misalnya, di ViewModel atau state management). Gunakan widget seperti FutureBuilder untuk menampilkan data secara dinamis.

## 5. Lengkapi kode berikut untuk membaca semua data dari tabel users menggunakan sqflite.
![image](https://github.com/user-attachments/assets/4535c945-dd1b-4efb-bae3-35b8ce78be33)

```dart
static Future<List<Map<String, dynamic>>> getUsers() async {
  final db = await SQLHelper.db();

  return db.query('users');
}
```
