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