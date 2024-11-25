<div align="center">

**TUGAS PENDAHULUAN**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**MODUL 11**  
**DATA STORAGE BAGIAN 2**

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

## 1. Firebase dan Fitur Utamanya  
a. Jelaskan apa yang dimaksud dengan Firebase.  
Firebase adalah platform pengembangan aplikasi berbasis cloud yang dimiliki oleh Google. Firebase menyediakan serangkaian alat dan layanan yang membantu pengembang membangun, mengelola, dan mengoptimalkan aplikasi web maupun seluler dengan cepat dan efisien. Platform ini mendukung pengembangan backend tanpa memerlukan pengelolaan server, sehingga pengembang dapat lebih fokus pada pengalaman pengguna.  

b. Sebutkan tiga fitur utama Firebase beserta fungsinya masing-masing  
1. Firebase Realtime Database : Menyediakan database berbasis cloud yang menyimpan dan menyinkronkan data secara real-time di seluruh pengguna aplikasi. Cocok untuk aplikasi yang membutuhkan pembaruan data secara langsung, seperti aplikasi obrolan atau pelacakan lokasi.  
2. Firebase Authentication : Menyediakan sistem otentikasi yang sederhana dan aman. Mendukung berbagai metode login, seperti email, Google, Facebook, atau nomor telepon, sehingga memudahkan pengembang mengelola autentikasi pengguna.  
3. Firebase Cloud Messaging (FCM) : Memungkinkan pengiriman notifikasi push gratis ke perangkat pengguna. Berguna untuk meningkatkan keterlibatan pengguna dengan mengirimkan pemberitahuan tentang pembaruan, promosi, atau pengingat.

## 2. Notification Message vs. Data Message  
Jelaskan perbedaan antara Notification Message dan Data Message pada Firebase Cloud Messaging. Berikan contoh penggunaan untuk masing-masing jenis pesan. 

- Perbedaan Utama: Notification Message untuk pemberitahuan langsung, sedangkan Data Message untuk logika atau pemrosesan lebih lanjut oleh aplikasi.


- Notification Message: Pesan ini digunakan untuk menampilkan notifikasi langsung di tray perangkat. Payload berisi kunci notification yang diinterpretasikan oleh FCM SDK untuk membuat dan menampilkan notifikasi tanpa intervensi aplikasi. Pesan ini diproses di tingkat sistem jika aplikasi tidak aktif (background/killed).

```json
{
  "to": "device_token",
  "notification": {
    "title": "Promo 12.12 !",
    "body": "Diskon hingga 90% untuk pengguna baru.",
    "icon": "promo.png"
  }
}
```

- Data Message: Pesan ini mengandung kunci data dengan payload berupa pasangan key-value. Pesan ini diteruskan langsung ke aplikasi untuk diproses, memungkinkan penerapan logika khusus (seperti sinkronisasi data atau menampilkan notifikasi secara manual). Data Message selalu diterima oleh aplikasi, baik di foreground maupun background, jika perangkat online.
```json
{
  "to": "device_token",
  "data": {
    "order_id": "1234",
    "status": "delivered",
    "timestamp": "2024-12-25T12:00:00Z"
  }
}
```

## 3. FCM Token  
Apa yang dimaksud dengan Firebase Cloud Messaging (FCM) Token, dan mengapa token ini penting untuk mengirim notifikasi ke aplikasi?  
Firebase Cloud Messaging (FCM) Token adalah identitas unik yang dihasilkan oleh Firebase untuk setiap perangkat atau instans aplikasi yang terhubung dengan layanan Firebase Cloud Messaging. Token ini digunakan untuk mengidentifikasi perangkat secara spesifik agar server Firebase dapat mengirimkan pesan atau notifikasi ke perangkat tersebut.
Mengapa FCM Token Penting?  
1. Identifikasi Perangkat : FCM Token bertindak sebagai identifier unik untuk perangkat atau pengguna aplikasi. Dengan token ini, server dapat memastikan bahwa pesan dikirim ke perangkat atau instans aplikasi yang tepat.
2. Pengiriman Notifikasi yang Ditargetkan : Dengan FCM Token, Anda dapat mengirim notifikasi yang disesuaikan, misalnya: Hanya untuk perangkat tertentu & Berdasarkan preferensi pengguna.
3. Manajemen Skala Besar : Untuk aplikasi dengan jutaan pengguna, token memungkinkan pengiriman pesan secara terorganisir, baik untuk satu perangkat (unicast) maupun kelompok perangkat (multicast atau topic-based messaging).

## 4. Penanganan Notifikasi oleh FCM  
Jelaskan bagaimana Firebase Cloud Messaging menangani notifikasi dalam kondisi aplikasi berikut:  
a. Saat aplikasi berada di foreground.  
1. Data Message: Jika pengirim hanya mengirimkan data message (pesan dengan payload data), pesan diteruskan ke callback di aplikasi, biasanya ke fungsi onMessageReceived di service seperti FirebaseMessagingService. Pesan ini tidak secara otomatis ditampilkan sebagai notifikasi.
2. Notification Message: Jika hanya mengirimkan notification message, pesan diterima oleh aplikasi, tetapi tidak secara otomatis ditampilkan sebagai notifikasi. Pengembang harus menangani sendiri tampilan notifikasi menggunakan API seperti NotificationManager.
3. Combined Message: Jika pesan memiliki payload data dan notifikasi, notifikasi tidak akan muncul di tray. Sebagai gantinya, pengembang dapat mengelola data di

b. Saat aplikasi berada di background.  
1. Data Message: Pesan dikirim ke callback aplikasi hanya jika pengguna membuka aplikasi. Tidak ada notifikasi otomatis di tray.
2. Notification Message: FCM secara otomatis menampilkan notifikasi di tray menggunakan payload notifikasi. Pengembang tidak dapat menangani pesan ini secara langsung di background.
3. Combined Message: Payload data disimpan dan disampaikan ke aplikasi saat pengguna membuka aplikasi. Notifikasi dari payload notifikasi tetap ditampilkan di tray.

c. Saat aplikasi dalam kondisi terminated.  
1. Data Message: Pesan tidak dikirim ke aplikasi hingga pengguna membuka aplikasi.
2. Notification Message: FCM menampilkan notifikasi di tray secara otomatis. Pesan hanya dapat diterima oleh aplikasi jika pengguna mengetuk notifikasi tersebut, yang akan membuka aplikasi dan memungkinkan payload data diteruskan.
3. Combined Message: Sama seperti notifikasi biasa, notifikasi akan ditampilkan di tray, dan data diteruskan saat aplikasi dibuka melalui notifikasi.
