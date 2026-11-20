import 'package:flutter/material.dart';

class ReBatikPage extends StatelessWidget {
  const ReBatikPage({super.key});

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

      body: Padding(
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
              style: TextStyle(fontSize: 15, color: Colors.brown, height: 1.5),
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
                    color: Colors.brown.withOpacity(0.10),
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

                      icon: const Icon(Icons.favorite, color: Colors.white),

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
          ],
        ),
      ),
    );
  }
}

// ======================================
// HALAMAN DONASI
// ======================================

class DonasiPage extends StatelessWidget {
  const DonasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F0),

      appBar: AppBar(
        title: const Text(
          'Donasi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF795548),
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.volunteer_activism,
                size: 90,
                color: Color(0xFF795548),
              ),

              const SizedBox(height: 25),

              const Text(
                'Donasi ReBatik',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5D4037),
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                'Terima kasih telah mendukung pelestarian batik Indonesia. '
                'Halaman donasi sedang dalam tahap pengembangan.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.6,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },

                icon: const Icon(Icons.arrow_back, color: Colors.white),

                label: const Text(
                  'Kembali ke ReBatik',
                  style: TextStyle(color: Colors.white),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF795548),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
