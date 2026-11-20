import 'package:flutter/material.dart';
import 'package:rebatik_mobile/models/batik_motif.dart';

class BatikStoryDetailPage extends StatefulWidget {
  final BatikMotif motif;

  const BatikStoryDetailPage({super.key, required this.motif});

  @override
  State<BatikStoryDetailPage> createState() => _BatikStoryDetailPageState();
}

class _BatikStoryDetailPageState extends State<BatikStoryDetailPage> {
  // Status favorit masih lokal. Nanti dihubungkan ke
  // POST /api/v1/batik-story/motifs/<uuid>/favorite/.
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final BatikMotif motif = widget.motif;

    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F0),
      appBar: AppBar(
        title: Text(
          motif.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF795548),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(
                      _isFavorite
                          ? '${motif.name} ditambahkan ke favorit'
                          : '${motif.name} dihapus dari favorit',
                    ),
                  ),
                );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: teks ditumpuk di atas blok warna dengan Stack.
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  width: double.infinity,
                  height: 160,
                  color: motif.color,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        motif.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        children: [
                          const Icon(
                            Icons.place,
                            color: Colors.white,
                            size: 16,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            motif.origin,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Section(title: 'Sejarah', body: motif.history),
                  const SizedBox(height: 16.0),
                  _Section(title: 'Filosofi', body: motif.philosophy),
                  const SizedBox(height: 24.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      label: const Text(
                        'Kembali ke daftar motif',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF795548),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final String body;

  const _Section({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF5D4037),
          ),
        ),
        const SizedBox(height: 6.0),
        Text(body, style: const TextStyle(fontSize: 15, height: 1.6)),
      ],
    );
  }
}
