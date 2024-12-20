<div align="center">

**TUGAS PENDAHULUAN**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**MODUL 14**  
**DATA STORAGE (BAGIAN 3)**

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

## A. Sebutkan dan jelaskan dua jenis utama Web Service yang sering digunakan dalam pengembangan aplikasi.
Dua jenis utama Web Service yang sering digunakan dalam pengembangan aplikasi adalah SOAP (Simple Object Access Protocol) dan REST (Representational State Transfer).  
1. SOAP adalah protokol berbasis XML yang dirancang untuk mendukung komunikasi antar aplikasi melalui internet. SOAP memiliki struktur pesan yang terstandarisasi dan menggunakan protokol seperti HTTP, SMTP, atau lainnya untuk mengirimkan data. Keunggulan utama SOAP adalah keamanannya yang tinggi, cocok untuk aplikasi enterprise, karena mendukung WS-Security dan transaksi yang kompleks. Namun, implementasinya cenderung lebih berat dan membutuhkan lebih banyak sumber daya dibandingkan REST.  

2. REST adalah gaya arsitektur yang lebih ringan dan fleksibel. REST menggunakan protokol HTTP standar untuk komunikasi, dengan operasi seperti GET, POST, PUT, dan DELETE untuk memanipulasi sumber daya yang diwakili oleh URL. REST sering menggunakan format data seperti JSON atau XML, yang lebih ringan dan mudah dipahami. REST sangat populer dalam pengembangan aplikasi modern, terutama untuk aplikasi berbasis web dan mobile, karena kesederhanaan dan efisiensinya. REST juga lebih mudah diintegrasikan dengan berbagai bahasa pemrograman dan platform, menjadikannya pilihan utama untuk aplikasi yang membutuhkan skalabilitas tinggi.

## B. Apa yang dimaksud dengan Data Storage API, dan bagaimana API ini mempermudah pengelolaan data dalam aplikasi?
Data Storage API adalah sekumpulan antarmuka pemrograman (API) yang memungkinkan pengembang untuk menyimpan, mengelola, dan mengambil data secara efisien dalam aplikasi mereka. API ini menyediakan cara yang terstandar untuk berinteraksi dengan mekanisme penyimpanan data di berbagai platform, seperti memori perangkat lokal, penyimpanan berbasis cloud, atau database.

Berikut adalah bagaimana Data Storage API mempermudah pengelolaan data dalam aplikasi:

1. Abstraksi dari Teknologi Penyimpanan
Data Storage API menyembunyikan kerumitan pengelolaan data di level rendah, seperti komunikasi dengan database atau sistem file.
Pengembang dapat fokus pada pengelolaan data secara logis tanpa memikirkan detail teknis penyimpanan.
2. Dukungan untuk Penyimpanan yang Beragam
API ini biasanya mendukung berbagai jenis penyimpanan, seperti:
Lokal: LocalStorage atau IndexedDB untuk aplikasi web.
Cloud: Firebase Realtime Database atau Amazon S3 untuk aplikasi berbasis cloud.
Hybrid: Solusi seperti SQLite pada aplikasi mobile.
Ini memungkinkan aplikasi untuk menyimpan data sesuai kebutuhan, baik secara lokal maupun online.
3. Kemudahan dalam Sinkronisasi Data
Banyak Data Storage API menyediakan fitur sinkronisasi data otomatis antara perangkat dan server, sehingga data tetap konsisten di berbagai platform.
Contoh: Firebase menyediakan real-time sync, sehingga perubahan pada satu perangkat langsung diterapkan ke perangkat lain.
4. Manajemen Data yang Terstruktur
API ini sering memungkinkan penyimpanan data dalam format terstruktur seperti JSON atau tabel, sehingga lebih mudah untuk membaca, menulis, dan memanipulasi data.
5. Keamanan Data
Data Storage API biasanya dilengkapi dengan fitur keamanan seperti enkripsi dan kontrol akses.
Contoh: API di cloud seperti AWS S3 dan Azure Blob Storage mendukung kebijakan akses dan autentikasi untuk mengamankan data.
6. Performansi dan Efisiensi
API ini dirancang untuk menangani data dalam jumlah besar secara efisien dengan caching, paging, dan optimasi lainnya.
Contoh: IndexedDB pada browser mendukung penyimpanan data besar tanpa mengorbankan performa.
7. Portabilitas
Dengan menggunakan Data Storage API, aplikasi menjadi lebih portabel karena kode yang sama dapat berjalan di berbagai perangkat dan platform tanpa perubahan signifikan.

## C. Jelaskan bagaimana proses kerja komunikasi antara klien dan server dalam sebuah Web Service, mulai dari permintaan (request) hingga tanggapan (response).
1. Permintaan (Request) oleh Klien
   - Inisiasi Permintaan: Klien (misalnya, aplikasi web, browser, atau perangkat lain) menginisiasi permintaan ke server melalui protokol komunikasi seperti HTTP atau HTTPS.
   - Pengemasan Data: Jika diperlukan, klien mengemas data dalam format tertentu (misalnya, JSON atau XML) dan menyertakannya dalam permintaan. Hal ini umumnya terjadi pada metode HTTP seperti POST atau PUT.
   - Pengiriman Permintaan: Klien mengirimkan permintaan ke endpoint API (Uniform Resource Identifier/URI) yang spesifik menggunakan metode HTTP (seperti GET, POST, PUT, DELETE).
2. Proses di Server
   - Penerimaan Permintaan: Server menerima permintaan dari klien melalui endpoint yang ditentukan.
   - Pemeriksaan dan Validasi: Server memeriksa dan memvalidasi permintaan, termasuk: Autentikasi dan otorisasi (jika diperlukan). Format dan isi data permintaan.
   - Pemrosesan Logika Bisnis:
     Server menjalankan logika bisnis berdasarkan permintaan. Jika server memerlukan data dari basis data atau sistem lain, server akan melakukan pengambilan data (query) atau operasi lainnya.
   - Penyiapan Tanggapan: Setelah logika bisnis selesai, server mempersiapkan tanggapan. Data hasil pemrosesan biasanya dikemas dalam format tertentu seperti JSON atau XML.
3. Pengiriman Tanggapan (Response)
   - Format Tanggapan: Server mengemas data tanggapan dalam format yang dapat dipahami klien (misalnya, JSON, XML, atau HTML).
   - Header dan Kode Status: Server menyertakan header HTTP dan kode status untuk memberi tahu klien tentang hasil permintaan.
     Contoh kode status: 
     200 OK: Permintaan berhasil.  
     400 Bad Request: Ada kesalahan dalam permintaan klien.  
     500 Internal Server Error: Ada kesalahan di sisi server.
   - Pengiriman Tanggapan: Server mengirimkan tanggapan ke klien melalui jaringan.
4. Penerimaan dan Pemrosesan Tanggapan oleh Klien
   - Penerimaan Tanggapan: Klien menerima tanggapan dari server.
   - Pemeriksaan Tanggapan: Klien memeriksa kode status HTTP dan header untuk memastikan tanggapan berhasil.
   - Penggunaan Data: Data dari tanggapan diproses atau ditampilkan kepada pengguna. Misalnya:  
     Dalam aplikasi web, data ditampilkan di antarmuka pengguna.  
     Dalam aplikasi backend, data digunakan untuk operasi lebih lanjut.  


## D. Mengapa keamanan penting dalam penggunaan Web Service, dan metode apa saja yang dapat diterapkan untuk memastikan data tetap aman?
Web Service berperan sebagai jembatan yang menghubungkan berbagai aplikasi dan sistem. Melalui Web Service, data sensitif seperti informasi pribadi, keuangan, atau bisnis dapat ditransmisikan. Oleh karena itu, keamanan menjadi sangat krusial.

Beberapa metode keamanan yang umum digunakan untuk melindungi Web Service antara lain:
- Otentikasi:
  - Username dan password: Metode paling dasar, namun tetap efektif jika dikombinasikan dengan teknik lain.
  - Token: Token adalah string unik yang diberikan kepada pengguna setelah berhasil login. Token ini kemudian digunakan untuk mengotentikasi permintaan selanjutnya.
  - OAuth: Protokol otentikasi yang populer, memungkinkan pengguna memberikan akses ke data mereka kepada aplikasi pihak ketiga tanpa harus memberikan kredensial login.
- Autorisasi:
  - Role-based access control (RBAC): Memberikan izin akses berdasarkan peran pengguna.
  - Attribute-based access control (ABAC): Memberikan izin akses berdasarkan atribut pengguna dan sumber daya.
- Enkripsi:
  - Transport Layer Security (TLS): Menjamin keamanan komunikasi antara klien dan server dengan mengenkripsi data yang ditransmisikan.
  - XML Encryption: Mengenkripsi data dalam pesan XML.
- Digital Signature:
  - Memastikan integritas dan keaslian pesan.
  - Mencegah penolakan pesan.
- WS-Security: Standar keamanan Web Service yang menyediakan kerangka kerja untuk menerapkan berbagai mekanisme keamanan seperti otentikasi, enkripsi, dan digital signature.
- Web Application Firewall (WAF):
Melindungi Web Service dari serangan web umum seperti injeksi SQL, cross-site scripting (XSS), dan cross-site request forgery (CSRF).
