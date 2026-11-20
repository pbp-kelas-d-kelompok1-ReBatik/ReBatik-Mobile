import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_fonts.dart';
import '../../core/widgets/primary_action_button.dart';
import '../../core/widgets/rebatik_scaffold.dart';

/// Halaman daftar permintaan Upcycling dengan empty state awal.
///
/// Pada checkpoint berikutnya, area ini dapat diisi daftar permintaan dari API
/// dan tombol aksi dapat diarahkan ke formulir pembuatan permintaan.
class UpcyclingPage extends StatelessWidget {
  const UpcyclingPage({super.key});

  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Form permintaan Upcycling akan segera tersedia.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ReBatikScaffold(
      title: 'Upcycling',
      useGradientBackground: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 28, 20, 36),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Column(
              children: [
                const Text(
                  'UPCYCLE · CULTURE · VALUE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.brown,
                    fontFamily: AppFonts.plusJakartaSans,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.2,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Permintaan Saya',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.brownDark,
                    fontFamily: AppFonts.garamond,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Pantau semua permintaan upcycling Anda di sini.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.brown,
                    fontFamily: AppFonts.plusJakartaSans,
                  ),
                ),
                const SizedBox(height: 28),
                Card(
                  color: AppColors.upcyclingPanel,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 36,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.upcyclingSurface,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: AppColors.upcyclingCardBorder,
                        ),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            AppAssets.cryingMascot,
                            width: 170,
                            height: 170,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Belum ada permintaan',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.brownDark,
                              fontFamily: AppFonts.garamond,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Ubah kain tak terpakai menjadi karya baru dalam '
                            'tiga langkah sederhana.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.brownMuted,
                              fontFamily: AppFonts.plusJakartaSans,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 22),
                          PrimaryActionButton(
                            label: 'Mulai Upcycling',
                            trailingIcon: Icons.arrow_forward,
                            onPressed: () => _showComingSoon(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
