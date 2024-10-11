import 'package:flutter/material.dart';

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

class BerandaJudul extends StatelessWidget {
  const BerandaJudul({super.key, required this.judul});

  final String judul;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          judul,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 16),
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
            const SizedBox(height: 16),
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
