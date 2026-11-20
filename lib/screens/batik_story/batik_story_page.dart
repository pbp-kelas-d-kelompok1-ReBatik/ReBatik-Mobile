import 'package:flutter/material.dart';
import 'package:rebatik_mobile/data/batik_data.dart';
import 'package:rebatik_mobile/models/batik_motif.dart';
import 'package:rebatik_mobile/screens/batik_story/batik_story_detail_page.dart';

import 'package:rebatik_mobile/widgets/left_drawer.dart';

class BatikStoryPage extends StatefulWidget {
  const BatikStoryPage({super.key});

  @override
  State<BatikStoryPage> createState() => _BatikStoryPageState();
}

class _BatikStoryPageState extends State<BatikStoryPage> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final List<BatikMotif> filtered = batikMotifs.where((motif) {
      final q = _query.trim().toLowerCase();
      return motif.name.toLowerCase().contains(q) ||
          motif.origin.toLowerCase().contains(q);
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F0),
      appBar: AppBar(
        title: const Text(
          'Batik Story',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF795548),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari motif atau daerah asal',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (String value) {
                setState(() {
                  _query = value;
                });
              },
            ),
          ),
          Expanded(
            child: filtered.isEmpty
                ? const Center(child: Text('Motif tidak ditemukan.'))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      return _MotifTile(motif: filtered[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _MotifTile extends StatelessWidget {
  final BatikMotif motif;

  const _MotifTile({required this.motif});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12.0),
        leading: CircleAvatar(
          radius: 26,
          backgroundColor: motif.color,
          child: Text(
            motif.name[0],
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        title: Text(
          motif.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF5D4037),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text('${motif.origin}\n${motif.summary}'),
        ),
        isThreeLine: true,
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BatikStoryDetailPage(motif: motif),
            ),
          );
        },
      ),
    );
  }
}
