import 'package:flutter/material.dart';
import 'package:rebatik_mobile/pages/widgets/info_card.dart';
import 'package:rebatik_mobile/pages/widgets/item_card.dart';
import 'package:rebatik_mobile/pages/widgets/left_drawer.dart';


class ReBatikPage extends StatelessWidget {
  ReBatikPage({super.key});

  final String kelompok = 'Kelompok 1';
  final String kelas = 'PBP-D';
  final String modul = 'Modul 2';

  final List<ItemHomepage> items = [
    ItemHomepage('Batik Story', Icons.menu_book, const Color(0xFF795548)),
    ItemHomepage('Batik Custom', Icons.palette, const Color(0xFF00695C)),
    ItemHomepage('Donasi', Icons.volunteer_activism, const Color(0xFFBF360C)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F0),
      appBar: AppBar(
        title: const Text(
          'ReBatik',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF795548),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Tiga InfoCard sejajar secara horizontal.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoCard(title: 'Kelompok', content: kelompok),
                  InfoCard(title: 'Kelas', content: kelas),
                  InfoCard(title: 'Modul', content: modul),
                ],
              ),
              const SizedBox(height: 16.0),
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  'Selamat Datang di ReBatik!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    color: Color(0xFF5D4037),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Mari mengenal dan melestarikan warisan budaya batik Indonesia bersama ReBatik.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.brown, height: 1.5),
              ),
              // Kisi tombol menu, 3 kolom.
              GridView.count(
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ItemHomepage item) {
                  return ItemCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
