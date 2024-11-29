<div align="center">

**LAPORAN PRAKTIKUM**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**PERTEMUAN 11**  
**DATA STORAGE (BAGIAN 2)**


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
# GUIDED

## Firebase Notifikasi
Firebase Cloud Messaging (FCM) adalah layanan yang digunakan untuk mengirimkan notifikasi dengan mudah ke banyak pengguna sekaligus. Dengan FCM, Kita dapat mengirimkan pesan baik ke perangkat individu maupun ke grup pengguna yang berlangganan topik tertentu. Dokumentasi lengkapnya dapat diakses di https://firebase.google.com/docs/flutter/setup?platform=android
Agar dapat mengirim pesan, Kita perlu:
1. Mendapatkan token unik dari setiap perangkat pengguna.
2. Atau mengelompokkan pengguna berdasarkan topik tertentu (misalnya "promo" atau
"berita").
Setelah itu, notifikasi dapat dikirim menggunakan Firebase Cloud Functions.

## Jenis Pesan pada Firebase Cloud Messaging (FCM)
FCM memiliki dua jenis pesan utama yang digunakan untuk kebutuhan notifikasi, yaitu:
1) Notification Message
Pesan ini digunakan untuk langsung menampilkan notifikasi di perangkat pengguna.
Cara kerja:
- Jika aplikasi berjalan di latar depan (foreground), pesan diteruskan ke fungsi onMessage
untuk diproses.
- Jika aplikasi di latar belakang (background) atau dimatikan (terminated), notifikasi akan
langsung muncul di tray notifikasi perangkat tanpa memerlukan kode tambahan.
2) Data Message
Pesan ini memberikan lebih banyak fleksibilitas karena isinya tidak langsung ditampilkan
sebagai notifikasi.
Cara kerja:
- Pesan ini akan diproses oleh aplikasi, baik saat aplikasi aktif maupun tidak aktif.
- Untuk menampilkan notifikasi ke pengguna, Kita perlu menambahkan kode khusus,
biasanya menggunakan plugin seperti flutter_local_notifications.



## Praktikum

## Integrasi Aplikasi dengan Firebase
A. Daftar dan login pada firebase console lalu buat sebuah projek baru.
   
   ![image](https://github.com/user-attachments/assets/7b4003d9-7945-43ad-97e9-82790befc5ca)
 
B. Tambahkan android package name, app nickname and SHA-1 signing certificate key. Android package name dapat ditemukan di ./android/app/ build.gradle. Catatan: App nickname and SHA-1 signing certificate key itu opsional.

   ![image](https://github.com/user-attachments/assets/396157de-e6c3-48a8-9d8e-9ceaa83b1998)

   ![image](https://github.com/user-attachments/assets/4d0b67bd-d524-4359-95b4-1d788c2c5aeb)

   ![image](https://github.com/user-attachments/assets/1a420833-5bf8-4d75-9de3-7489ae4ff283)

   ![image](https://github.com/user-attachments/assets/6aaaac35-0a35-407d-8dd3-69aee40df78d)

   ![image](https://github.com/user-attachments/assets/81d69537-1e50-4e6c-b801-9e688c1c595e)

   ![image](https://github.com/user-attachments/assets/389d7870-aa92-4755-b87b-959ffa81d4a5)
   
C. Setelah berhasil mendaftarkan aplikasi ke firebase, download file google-services.json lalu simpan pada ./android/app/

   ![image](https://github.com/user-attachments/assets/0d97ba30-cc5b-4a61-9438-3b5303054828)

   ![image](https://github.com/user-attachments/assets/64af2bc7-5806-43d1-b181-7981f5ce5640)

D. Tambahkan plugin dan sdk sesuai perintah pada ./android/build.gradle dan ./android/app/build.gradle lalu lakukan sync dengan mengetik “flutter pub get” pada terminal.

![image](https://github.com/user-attachments/assets/32fdb213-bee7-443a-b0a3-5d321b520ea5)

![image](https://github.com/user-attachments/assets/05522878-c573-4111-8480-7db7df3aad6b)

E. Setelah memodifikasi file build.gradle, tambahkan beberapa package pada file pubspec.yaml dengan mengetik “flutter pub add firebase_core firebase_messaging flutter_local_notifications” pada terminal.

![image](https://github.com/user-attachments/assets/f683026f-08af-4d9d-a63b-cfeb73066d63)

F. Ubah compile sdk agar menggunakan versi 33 dan min sdk pada versi 21 yang terletak pada file ./android/app/build.gradle

![image](https://github.com/user-attachments/assets/ea187b1f-1e5d-4b71-b688-93406f1b928e)

## Membuat Notifikasi Handler

#### lib/main.dart
```dart
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:guided_ppb11/my_notification_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FlutterLocalNotificationsPlugin()
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(const MyApp());
}

String? token;
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message: ${message.messageId}');
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // ID Channel
  'High Importance Notifications', // Nama Channel
  description: 'This channel is used for important notifications.',
  importance: Importance.high, // Prioritas
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyNotificationScreen(),
    );
  }
}
```

#### lib/my_notification_screen.dart
```dart
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:guided_ppb11/main.dart';

class MyNotificationScreen extends StatefulWidget {
  const MyNotificationScreen({super.key});

  @override
  State<MyNotificationScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyNotificationScreen> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late AndroidNotificationChannel channel;

  @override
  void initState() {
    super.initState();

    // Inisialisasi FlutterLocalNotificationsPlugin
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // Membuat channel untuk Android
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // ID channel
      'High Importance Notifications', // Nama channel
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    // Mengatur inisialisasi untuk Android
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // Mendengarkan pesan saat aplikasi aktif
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode, // ID notifikasi
          notification.title, // Judul
          notification.body, // Isi
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              importance: Importance.high,
              color: Colors.blue,
              icon: '@mipmap/ic_launcher',
            ),
          ),
        );
      }
    });

    // Menangani aksi ketika notifikasi dibuka
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text(notification.title ?? ""),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(notification.body ?? "")],
                ),
              ),
            );
          },
        );
      }
    });

    // Memanggil metode untuk mendapatkan token FCM
    getToken();
  }

  // Metode untuk mendapatkan token FCM
  void getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print('FCM Token: $token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notification Screen'),
        backgroundColor: Colors.amber,
      ),
      body: const Center(child: Text('Halaman untuk menerima notifikasi')),
    );
  }
}
```

## Mengirim Notifikasi Via FCM Console
A. Dimulai dengan membuka halaman all product pada tab firebase --> pilih menu cloud messaging --> lalu pilih send your first message.
B. Selanjutnya, inputkan judul, pesan, dan foto dari notifikasi kalian sesuai dengan kebutuhan.

![image](https://github.com/user-attachments/assets/9d67b75d-a1fe-45b3-a4e5-8e06ae87c4c2)

C. Setelah itu, pilih aplikasi mana yang akan dikirimkan notifikasi dan setting waktu "Now” jika ingin langsung mengirimkan notifikasi. Lalu klik publish jika isi dan settingan notifikasi sudah benar

![image](https://github.com/user-attachments/assets/f0b807ba-b979-456d-bc45-00a9c1010d16)

![image](https://github.com/user-attachments/assets/da9718cd-7e1c-44d4-9666-71aa08e673c6)


D. Silakan tunggu notifikasi muncul pada aplikasi. Catatan: pengiriman notifikasi memerlukan beberapa saat dan tidak akan langsung muncul setelah dikirim jadi silakan menunggu.

#### Output
![Screenshot_2024-11-27-18-34-42-39_f5621ac9021a99484278ec5e1a024592](https://github.com/user-attachments/assets/760c764f-a951-4016-b51b-954271427291)

![Screenshot_2024-11-27-18-34-55-49_f5621ac9021a99484278ec5e1a024592](https://github.com/user-attachments/assets/e26a96fc-fc16-4e67-82b5-825032b7cac3)

#### Deskripsi
- main.dart
  - WidgetsFlutterBinding.ensureInitialized(): Memastikan semua binding Flutter telah diinisialisasi sebelum menjalankan kode.
  - Firebase.initializeApp(): Menginisialisasi Firebase di aplikasi.
  - FirebaseMessaging.onBackgroundMessage(): Menentukan fungsi handler untuk menangani pesan saat aplikasi berjalan di latar belakang.
  - FlutterLocalNotificationsPlugin().resolvePlatformSpecificImplementation(): Membuat channel notifikasi khusus untuk Android.
  - FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(): Mengatur opsi tampilan notifikasi saat aplikasi berada di latar depan (foreground).
  - Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message): Fungsi ini menangani pesan yang diterima ketika aplikasi berada di latar belakang atau tidak aktif.
  - const AndroidNotificationChannel: Mendefinisikan channel notifikasi untuk Android dengan prioritas tinggi.

- my_notification_screen.dart
  - Inisialisasi FlutterLocalNotificationsPlugin: Digunakan untuk menampilkan notifikasi lokal pada perangkat.
  - Pembuatan AndroidNotificationChannel: Mendefinisikan channel khusus untuk notifikasi prioritas tinggi.
  - FirebaseMessaging.onMessage Listener: Menangani pesan saat aplikasi aktif (foreground). Jika pesan memiliki notifikasi dan platform Android, akan ditampilkan notifikasi lokal menggunakan flutterLocalNotificationsPlugin.
  - FirebaseMessaging.onMessageOpenedApp Listener: Menangani aksi ketika pengguna mengetuk notifikasi untuk membuka aplikasi. Menampilkan dialog dengan judul dan isi pesan.
  - getToken() Fungsi untuk Mengambil Token FCM: Memanggil FirebaseMessaging.instance.getToken() untuk mendapatkan token unik perangkat. Mencetak token ke konsol menggunakan print.

# UNGUIDED

## Tugas Mandiri
Modifikasi Guided diatas bisa menampilkan Nama, Nim, Kelas, dan Prodi kalian ke dalam Notifikasi Flutter Cloud Messaging dan landing page notifikasinya.

#### Konfigurasi Membuat Notifikasi Via FCM Console
![Screenshot 2024-11-28 102751](https://github.com/user-attachments/assets/0db8ddf6-4403-4b3a-8c78-c0629c974127)

![Screenshot 2024-11-28 102805](https://github.com/user-attachments/assets/45a767be-023d-40b5-a359-8cedc6a0689d)

![Screenshot 2024-11-28 102816](https://github.com/user-attachments/assets/f64652de-3637-40ed-8a3a-b74408d2dbf0)

![Screenshot 2024-11-28 102825](https://github.com/user-attachments/assets/7062ae86-5989-483f-b922-46b48cdee7b2)

#### Source Code

lib/main.dart
```dart
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:guided_ppb11/my_notification_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FlutterLocalNotificationsPlugin()
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(const MyApp());
}

String? token;
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message: ${message.messageId}');
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // ID Channel
  'High Importance Notifications', // Nama Channel
  description: 'This channel is used for important notifications.',
  importance: Importance.high, // Prioritas
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyNotificationScreen(),
    );
  }
}
```

lib/my_notification_screen.dart
```dart
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:guided_ppb11/main.dart';

class MyNotificationScreen extends StatefulWidget {
  const MyNotificationScreen({super.key});

  @override
  State<MyNotificationScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyNotificationScreen> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late AndroidNotificationChannel channel;

  @override
  void initState() {
    super.initState();

    // Inisialisasi FlutterLocalNotificationsPlugin
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // Membuat channel untuk Android
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // ID channel
      'High Importance Notifications', // Nama channel
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    // Mengatur inisialisasi untuk Android
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // Mendengarkan pesan saat aplikasi aktif
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode, // ID notifikasi
          notification.title, // Judul
          notification.body, // Isi
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              importance: Importance.high,
              color: Colors.blue,
              icon: '@mipmap/ic_launcher',
            ),
          ),
        );
      }
    });

    // Menangani aksi ketika notifikasi dibuka
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text(notification.title ?? ""),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(notification.body ?? "")],
                ),
              ),
            );
          },
        );
      }
    });

    // Memanggil metode untuk mendapatkan token FCM
    getToken();
  }

  // Metode untuk mendapatkan token FCM
  void getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print('FCM Token: $token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tel-U'),
        backgroundColor: const Color.fromARGB(255, 255, 2, 2),
      ),
      body: const Center(child: Text('Halaman notifikasi')),
    );
  }
}
```

#### Output
![Screenshot_2024-11-28-10-32-33-77_92b64b2a7aa6eb3771ed6e18d0029815](https://github.com/user-attachments/assets/a55ee070-3378-46a9-b615-c43fdb785e41)

![Screenshot_2024-11-28-10-32-45-64_f5621ac9021a99484278ec5e1a024592](https://github.com/user-attachments/assets/0b7d3664-b16f-4e29-8af0-9ae1c0811989)

#### Deskripsi
- main.dart
  - WidgetsFlutterBinding.ensureInitialized(): Memastikan semua binding Flutter telah diinisialisasi sebelum menjalankan kode.
  - Firebase.initializeApp(): Menginisialisasi Firebase di aplikasi.
  - FirebaseMessaging.onBackgroundMessage(): Menentukan fungsi handler untuk menangani pesan saat aplikasi berjalan di latar belakang.
  - FlutterLocalNotificationsPlugin().resolvePlatformSpecificImplementation(): Membuat channel notifikasi khusus untuk Android.
  - FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(): Mengatur opsi tampilan notifikasi saat aplikasi berada di latar depan (foreground).
  - Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message): Fungsi ini menangani pesan yang diterima ketika aplikasi berada di latar belakang atau tidak aktif.
  - const AndroidNotificationChannel: Mendefinisikan channel notifikasi untuk Android dengan prioritas tinggi.

- my_notification_screen.dart
  - Inisialisasi FlutterLocalNotificationsPlugin: Digunakan untuk menampilkan notifikasi lokal pada perangkat.
  - Pembuatan AndroidNotificationChannel: Mendefinisikan channel khusus untuk notifikasi prioritas tinggi.
  - FirebaseMessaging.onMessage Listener: Menangani pesan saat aplikasi aktif (foreground). Jika pesan memiliki notifikasi dan platform Android, akan ditampilkan notifikasi lokal menggunakan flutterLocalNotificationsPlugin.
  - FirebaseMessaging.onMessageOpenedApp Listener: Menangani aksi ketika pengguna mengetuk notifikasi untuk membuka aplikasi. Menampilkan dialog dengan judul dan isi pesan.
  - getToken() Fungsi untuk Mengambil Token FCM: Memanggil FirebaseMessaging.instance.getToken() untuk mendapatkan token unik perangkat. Mencetak token ke konsol menggunakan print.
