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
    Beranda(),
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
        title: const Text('Beranda'),
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

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Masukkan Nama',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama tidak boleh kosong';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Masukkan Email',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email tidak boleh kosong';
                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Masukkan email yang valid';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Form berhasil dikirim')),
                  );
                }
              },
              child: const Text('Submit'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
