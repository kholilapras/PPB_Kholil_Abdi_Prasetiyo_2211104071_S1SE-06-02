import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(const AplikasiSaya());
}

class AplikasiSaya extends StatelessWidget {
  const AplikasiSaya({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekomendasi Wisata',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlueAccent,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const BerandaJudul(judul: 'Rekomendasi Wisata Banyumas'),
    );
  }
}

class BerandaJudul extends StatefulWidget {
  const BerandaJudul({super.key, required this.judul});

  final String judul;

  @override
  State<BerandaJudul> createState() => _BerandaJudulState();
}

class _BerandaJudulState extends State<BerandaJudul> {
  late ScrollController _scrollController;
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 150 && !_isScrolled) {
        setState(() {
          _isScrolled = true;
        });
      } else if (_scrollController.offset <= 150 && _isScrolled) {
        setState(() {
          _isScrolled = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                double top = constraints.biggest.height;
                return FlexibleSpaceBar(
                  title: Text(
                    widget.judul,
                    style: TextStyle(
                      color: _isScrolled ? Colors.black : Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  centerTitle: true,
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        'https://ik.imagekit.io/tvlk/blog/2023/03/Alun-Alun-Purwokerto-Wisata-Purwokerto-Traveloka-Xperience.jpg?tr=dpr-1.5,h-480,q-40,w-1024',
                        fit: BoxFit.cover,
                      ),
                      if (top > 100) ...[
                        Positioned.fill(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                );
              },
            ),
            backgroundColor: Colors.lightBlueAccent,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  daftarTempatWisata(
                    nama: 'Alun-alun Purwokerto',
                    urlGambar:
                        'https://ik.imagekit.io/tvlk/blog/2023/03/Alun-Alun-Purwokerto-Wisata-Purwokerto-Traveloka-Xperience.jpg?tr=dpr-1.5,h-480,q-40,w-1024',
                    deskripsi:
                        'Alun-alun Purwokerto adalah pusat aktivitas masyarakat dengan taman terbuka hijau yang indah. Dikelilingi oleh berbagai tempat kuliner dan pusat perbelanjaan, cocok untuk bersantai dan menikmati suasana kota.',
                  ),
                  daftarTempatWisata(
                    nama: 'Menara Pandang Teratai',
                    urlGambar:
                        'https://akcdn.detik.net.id/community/media/visual/2022/07/26/puan-maharani-pamer-foto-di-area-wisata-bung-karno.jpeg?w=700&q=90',
                    deskripsi:
                        'Menara Pandang Teratai adalah menara ikonik di pusat Kota Purwokerto yang memberikan pemandangan indah Banyumas dari atas. Cocok untuk menikmati suasana senja dan malam hari.',
                  ),
                  daftarTempatWisata(
                    nama: 'Baturraden',
                    urlGambar:
                        'https://akcdn.detik.net.id/community/media/visual/2023/09/05/lokawisata-baturraden-1_43.jpeg?w=700&q=90',
                    deskripsi:
                        'Baturraden adalah sebuah objek wisata alam yang terletak di lereng Gunung Slamet. Dikenal dengan pemandangan yang indah dan udara sejuk, tempat ini sangat cocok untuk wisata alam.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget daftarTempatWisata({
    required String nama,
    required String urlGambar,
    required String deskripsi,
  }) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 6,
      shadowColor: const Color.fromARGB(255, 74, 75, 75),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.network(
              urlGambar,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 100,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  deskripsi,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: Text(
                        'Kunjungi Sekarang',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
