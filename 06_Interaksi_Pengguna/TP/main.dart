import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tp6_interaksipengguna',
      theme: ThemeData(
        primaryColor: Colors.black,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.black,
          secondary: Colors.amber,
        ),
      ),
      home: const HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  int _indeksDipilih = 0;

  static const List<Widget> _halaman = <Widget>[
    Center(child: Text('Ini halaman Beranda', style: TextStyle(fontSize: 24))),
    Center(child: Text('Ini halaman Wisata', style: TextStyle(fontSize: 24))),
    Center(child: Text('Ini halaman Profil', style: TextStyle(fontSize: 24))),
  ];

  void _pilihItem(int indeks) {
    setState(() {
      _indeksDipilih = indeks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan BottomNavigationBar'),
        backgroundColor: Colors.amber,
      ),
      body: _halaman[_indeksDipilih],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Wisata',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _indeksDipilih,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        onTap: _pilihItem,
      ),
    );
  }
}
