<div align="center">

**LAPORAN PRAKTIKUM**  
**PEMROGRAMAN PERANGKAT BERGERAK**

**PERTEMUAN 7**  
**NAVIGASI DAN NOTIFIKASI**


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

## 1. Model
Data dalam sebuah aplikasi memiliki sangat banyak bentuk, tergantung dari aplikasi yang dibuat. Setiap data yang diterima atau dikirimkan akan lebih baik apabila memiliki standar yang sama. Hampir mustahil melakukan peneliharaan project yang kompleks tanpa model.

## 2. Navigation
Dalam Flutter, navigation merujuk pada cara berpindah antar halaman (atau tampilan) di aplikasi. Sistem navigasi di Flutter berbasis route dan navigator. Setiap halaman atau layar di Flutter disebut sebagai route, dan Navigator adalah widget yang mengelola stack dari route tersebut.

## 3. Notification
Untuk mengirimkan notifikasi dalam aplikasi Flutter, dapat digunakan package bernama flutter_local_notifications.

Langkah 1: Tambahkan Dependency flutter_local_notifications
- Buka file pubspec.yaml di proyek Flutter Anda.
- Tambahkan flutter_local_notifications ke dalam dependencies aplikasi seperti berikut:
  ```
  dependencies:
  flutter:
    sdk: flutter
  flutter_local_notifications: ^12.0.4  # Gunakan versi terbaru yang tersedia
  ```
- Jalankan perintah berikut untuk mengunduh dan menginstal package:
  ```
  flutter pub get
  ```

Langkah 2: Konfigurasi Project untuk Android dan iOS
- Buka file android/app/build.gradle dan pastikan minSdkVersion diatur ke 21 atau lebih tinggi
  ```
  defaultConfig {
    minSdkVersion 21
  }
  ```
- Jika ingin notifikasi bergetar, tambahkan izin berikut di file AndroidManifest.xml:
  ```
  <uses-permission android:name="android.permission.VIBRATE" />
  ```
- Untuk notifikasi yang aktif setelah perangkat di-reboot, tambahkan izin berikut:
  ```
  <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
  ```

Langkah 3: Inisialisasi flutter_local_notifications
- Buat instance FlutterLocalNotificationsPlugin dan atur inisialisasinya di lib/main.dart:
```
  import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings();

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Local Notifications',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NotificationScreen(),
    );
  }
}
``` 

Langkah 4: Buat Fungsi untuk Menampilkan Notifikasi
- Buat fungsi showNotification untuk menampilkan notifikasi lokal:
 ```
Future<void> showNotification() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'your_channel_id', // ID unik untuk channel
    'your_channel_name', // Nama channel
    channelDescription: 'your_channel_description', // Deskripsi channel
    importance: Importance.max,
    priority: Priority.high,
    showWhen: true,
  );

  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0, // ID notifikasi
    'Hello!', // Judul notifikasi
    'This is a local notification.', // Isi notifikasi
    platformChannelSpecifics,
  );
}
``` 

Langkah 5: Buat UI dengan Tombol untuk Menampilkan Notifikasi
```
class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Local Notifications")),
      body: Center(
        child: ElevatedButton(
          onPressed: showNotification, // Panggil fungsi notifikasi saat tombol ditekan
          child: Text("Show Notification"),
        ),
      ),
    );
  }
}
```

Langkah 6: Jalankan Aplikasi dan Tes Notifikasi
- Build dan jalankan aplikasi di emulator atau perangkat fisik.
- Setelah aplikasi terbuka, tekan tombol "Show Notification".
- Jika konfigurasi sudah benar, notifikasi akan muncul di perangkat.


## Latihan 1
#### lib/main.dart
```dart
import 'package:flutter/material.dart';
import 'package:prak7ppb/pages/mypage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyPage(),
    );
  }
}
```

#### lib/models/product.dart
```dart
class Product {
  final int id;
  final String nama;
  final double harga;
  final String gambarUrl;
  final String deskripsi;

  Product({
    required this.id,
    required this.nama,
    required this.harga,
    required this.gambarUrl,
    required this.deskripsi,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      nama: json['nama'],
      harga: json['harga'],
      gambarUrl: json['gambarUrl'],
      deskripsi: json['deskripsi'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'harga': harga,
      'gambarUrl': gambarUrl,
      'deskripsi': deskripsi,
    };
  }
}
```

#### lib/pages/detailpage.dart
```dart
import 'package:flutter/material.dart';

class Detailpage extends StatelessWidget {
  const Detailpage({super.key, required this.data});

  final Widget data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Center(child: data),
    );
  }
}
```

#### lib/pages/mypage.dart
```dart
import 'package:flutter/material.dart';
import 'package:prak7ppb/models/product.dart';
import 'package:prak7ppb/pages/detailpage.dart';

class MyPage extends StatelessWidget {
  MyPage({super.key});

  final List<Product> products = [
    Product(
      id: 1,
      nama: 'Mouse DPR',
      harga: 700000,
      gambarUrl:
          'https://resource.logitechg.com/w_386,ar_1.0,c_limit,f_auto,q_auto,dpr_2.0/d_transparent.gif/content/dam/gaming/en/products/g502x-plus/gallery/g502x-plus-gallery-1-black.png?v=1',
      deskripsi: 'Mouse Gaming Asli Sokaraja',
    ),
    Product(
      id: 2,
      nama: 'Keyboard Mechanical',
      harga: 200000,
      gambarUrl:
          'https://resource.logitech.com/w_1600,c_limit,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/logitech/en/products/keyboards/mx-mechanical/gallery/mx-mechanical-keyboard-top-view-graphite-us.png?v=1&quot',
      deskripsi: 'keyboard tanpa tombol yang cocok buat kamu yang males ngetik',
    ),
    Product(
      id: 3,
      nama: 'Headset Horeg',
      harga: 45000,
      gambarUrl:
          'https://m.media-amazon.com/images/I/61CGHv6kmWL.AC_UF894,1000_QL80.jpg',
      deskripsi: 'Rasanyaa seperti sound horeggg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Class Model'),
          centerTitle: true,
          backgroundColor: Colors.blue[400],
        ),
        body: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final Product = products[index];
              return ListTile(
                leading: Image.network(
                  Product.gambarUrl,
                  width: 70,
                  height: 70,
                ),
                title: Text(Product.nama),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rp${Product.harga}'),
                    Text(Product.deskripsi),
                  ],
                ),
                onTap: () {
                  print('Tap layar berhasil');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Detailpage(
                        data: Icon(Icons.notifications_outlined),
                      ),
                    ),
                  );
                },
              );
            }));
  }
}
```

#### Output
![image](https://github.com/user-attachments/assets/653cf7e5-4582-4531-a988-7cdd315b7f33)

![image](https://github.com/user-attachments/assets/8f2bfbf0-4826-4213-ba28-758bbbdd4694)


# UNGUIDED

## Tugas Mandiri
1. Buatlah satu project untuk menampilkan beberapa produk dan halaman e-commerce dengan menerapkan class model serta navigasi halaman.

![image](https://github.com/user-attachments/assets/c83f7214-ae50-4d43-9af3-39d1b9221201)

#### lib/models/product_model.dart
```dart
class Product {
  final String name;
  final String image;
  final int price;

  Product({required this.name, required this.image, required this.price});
}

List<Product> products = [
  Product(
      name: "Manchester City Home Jersey 2024/25",
      image: "assets/images/home_jersey.png",
      price: 1500000),
  Product(
      name: "Manchester City Away Jersey 2024/25",
      image: "assets/images/away_jersey.png",
      price: 1450000),
  Product(
      name: "Manchester City Third Jersey 2024/25",
      image: "assets/images/third_jersey.png",
      price: 1400000),
  Product(
      name: "Manchester City Goalkeeper Jersey 2024/25",
      image: "assets/images/goalkeeper_jersey.png",
      price: 1250000),
];
```

#### lib/pages/checkout_page.dart
```dart
import 'package:flutter/material.dart';
import '../models/product_model.dart';

class CheckoutPage extends StatelessWidget {
  final Product product;
  final String selectedSize;
  final int quantity;

  CheckoutPage({
    required this.product,
    required this.selectedSize,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Colors.blue[400],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Detail Pembelian",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text("Nama Produk: ${product.name}",
                style: TextStyle(fontSize: 18)),
            Text("Harga: Rp ${product.price}", style: TextStyle(fontSize: 18)),
            Text("Ukuran: $selectedSize", style: TextStyle(fontSize: 18)),
            Text("Jumlah: $quantity", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Divider(),
            Text(
              "Total Harga: Rp ${product.price * quantity}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Pembelian Berhasil!")),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text('Confirm Purchase'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

#### lib/pages/detail_page.dart
```dart
import 'package:flutter/material.dart';
import '../models/product_model.dart';
import 'checkout_page.dart';

class DetailPage extends StatefulWidget {
  final Product product;

  DetailPage({required this.product});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
        backgroundColor: Colors.blue[400],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(widget.product.image, height: 200),
            SizedBox(height: 16),
            Text(widget.product.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('Rp ${widget.product.price}',
                style: TextStyle(fontSize: 20, color: Colors.grey[700])),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var size in ["S", "M", "L", "XL", "XXL", "3XL"])
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ChoiceChip(
                      label: Text(size),
                      selected: selectedSize == size,
                      onSelected: (isSelected) {
                        setState(() {
                          selectedSize = isSelected ? size : null;
                        });
                      },
                    ),
                  ),
              ],
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Jumlah: ', style: TextStyle(fontSize: 18)),
                DropdownButton<int>(
                  value: quantity,
                  items: List.generate(10, (index) => index + 1)
                      .map((e) => DropdownMenuItem<int>(
                            value: e,
                            child: Text('$e'),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      quantity = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (selectedSize != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckoutPage(
                        product: widget.product,
                        selectedSize: selectedSize!,
                        quantity: quantity,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Pilih ukuran terlebih dahulu")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.yellow[700],
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text('Beli'),
            ),
          ],
        ),
      ),
    );
  }
}
```

#### lib/pages/home_page.dart
```dart
import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manchester City Shop'),
        backgroundColor: Colors.blue[400],
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(product: products[index]),
                ),
              );
            },
            child: ProductCard(product: products[index]),
          );
        },
      ),
    );
  }
}
```

#### lib/widgets/product_card.dart
```dart
import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Image.asset(product.image, height: 80, width: 80, fit: BoxFit.cover),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('Rp ${product.price}', style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
```

#### lib/main.dart
```dart
import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manchester City Shop',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}
```

#### Output
![image](https://github.com/user-attachments/assets/b1f1113d-f644-42c1-9fdd-64b47b327c7a)

![image](https://github.com/user-attachments/assets/2f8219aa-c14f-44f8-814a-72545b669acc)

![image](https://github.com/user-attachments/assets/e0f13020-2cec-4cbd-91cd-0178a690451e)


#### Deskripsi
i.) product_model.dart
- Kelas yang mendefinisikan produk dengan atribut name, image, dan price.

ii.) home_page.dart
- Menampilkan daftar produk menggunakan ListView.builder.
- Setiap produk ditampilkan sebagai ProductCard, dan bisa diklik untuk membuka halaman detail (DetailPage).

iii.) detail_page.dart
- Menampilkan detail produk yang dipilih, seperti gambar, nama, dan harga.
- Pengguna dapat memilih ukuran (menggunakan ChoiceChip) dan jumlah (menggunakan DropdownButton).
- Tombol "Beli" akan mengarahkan pengguna ke halaman checkout (CheckoutPage) jika ukuran sudah dipilih.

iv.) checkout_page.dart
- Menampilkan ringkasan pembelian, termasuk produk, ukuran, jumlah, dan total harga (product.price * quantity).
- Tombol "Confirm Purchase" menampilkan SnackBar untuk notifikasi berhasil dan mengembalikan pengguna ke halaman sebelumnya.

v.) product_card.dart
- Widget khusus untuk menampilkan informasi dasar produk (gambar, nama, dan harga) di HomePage.
- Ikon navigasi (panah) yang menunjukkan bahwa item ini dapat ditekan.

vi.) main.dart
- Menjalankan aplikasi dengan halaman awal class HomePage
