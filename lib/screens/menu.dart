import 'package:flutter/material.dart';
import 'package:rebatik_mobile/screens/batik_custom/batik_custom_page.dart';
import 'package:rebatik_mobile/screens/batik_story/batik_story_page.dart';
import 'package:rebatik_mobile/widgets/left_drawer.dart';

import 'donasi/donasi_page.dart';
import 'marketplace/screens/dropoff_list_page.dart';
import 'marketplace/screens/product_list_page.dart';
import 'marketplace/widgets/menu_card.dart';

class ReBatikPage extends StatelessWidget {
  const ReBatikPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F0),

      // Navigation Drawer
      drawer: const LeftDrawer(),

      appBar: AppBar(
        title: const Text(
          'ReBatik',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF795548),
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            const Text(
              'Selamat Datang di ReBatik!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5D4037),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Mari mengenal dan melestarikan warisan budaya batik Indonesia bersama ReBatik.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.brown,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Menu Utama',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5D4037),
              ),
            ),

            const SizedBox(height: 15),

            // MENU DONASI
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.brown.withValues(alpha: 0.10),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.volunteer_activism,
                    size: 45,
                    color: Color(0xFF795548),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Donasi Pelestarian Batik',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5D4037),
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Bantu mendukung pelestarian budaya batik Indonesia melalui kontribusi donasi.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DonasiPage(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Buka Halaman Donasi',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF795548),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // MENU BATIK STORY
            MenuCard(
              icon: Icons.menu_book,
              title: 'Batik Story',
              description:
                  'Jelajahi keindahan motif batik Indonesia dan kenali sejarah serta makna filosofisnya.',
              buttonLabel: 'Jelajahi Batik Story',
              destination: (context) => const BatikStoryPage(),
            ),

            // MENU BATIK CUSTOM
            MenuCard(
              icon: Icons.palette,
              title: 'Batik Custom',
              description:
                  'Ciptakan gaya fashion batik sesuai selera dengan pilihan style dan warna favoritmu.',
              buttonLabel: 'Mulai Custom',
              destination: (context) => const BatikCustomPage(),
            ),

            // MENU MARKETPLACE
            MenuCard(
              icon: Icons.storefront,
              title: 'Marketplace Upcycling',
              description:
                  'Belanja produk hasil upcycling kain dan pakaian bekas bermotif batik.',
              buttonLabel: 'Buka Marketplace',
              destination: (context) => const ProductListPage(),
            ),

            // MENU DROP-OFF POINT
            MenuCard(
              icon: Icons.place,
              title: 'Drop-Off Point',
              description:
                  'Temukan lokasi pengumpulan kain atau pakaian bekas terdekat.',
              buttonLabel: 'Lihat Drop-Off Point',
              destination: (context) => const DropOffListPage(),
            ),
          ],
        ),
      ),
    );
  }
}
