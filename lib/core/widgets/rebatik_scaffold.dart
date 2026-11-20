import 'package:flutter/material.dart';

import '../constants/app_assets.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';
import '../theme/app_gradients.dart';

/// Template halaman bersama yang berperan seperti `base.html` pada web ReBatik.
///
/// Widget ini menyediakan identitas visual dan slot layout bersama. Setiap
/// modul tetap mengatur isi, scrolling, dan state halaman melalui [body].
class ReBatikScaffold extends StatelessWidget {
  const ReBatikScaffold({
    required this.title,
    required this.body,
    this.actions,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.showBackButton = true,
    this.showLogo = true,
    this.useGradientBackground = true,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
    super.key,
  });

  /// Judul halaman yang ditampilkan pada AppBar.
  final String title;

  /// Isi utama yang disediakan oleh masing-masing modul.
  final Widget body;

  /// Daftar aksi opsional di sisi kanan AppBar.
  final List<Widget>? actions;

  /// Tombol aksi mengambang opsional milik halaman.
  final Widget? floatingActionButton;

  /// Slot navigasi bawah yang dapat diisi setelah pola navigasi disepakati.
  final Widget? bottomNavigationBar;

  /// Menampilkan tombol kembali yang memanggil `Navigator.maybePop`.
  final bool showBackButton;

  /// Menampilkan logo ReBatik sebelum judul halaman.
  final bool showLogo;

  /// Menggunakan gradient hero web sebagai latar halaman.
  final bool useGradientBackground;

  /// Warna latar khusus ketika halaman tidak memakai gradient.
  final Color? backgroundColor;

  /// Mengikuti perilaku Scaffold ketika keyboard muncul.
  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackButton
            ? IconButton(
                onPressed: () => Navigator.of(context).maybePop(),
                tooltip: 'Kembali',
                icon: const Icon(Icons.arrow_back),
              )
            : null,
        titleSpacing: showBackButton ? 0 : 16,
        flexibleSpace: const DecoratedBox(
          decoration: BoxDecoration(gradient: AppGradients.navbar),
        ),
        title: Row(
          children: [
            if (showLogo) ...[
              Container(
                width: 36,
                height: 36,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.navbarCream,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.navbarGold),
                ),
                child: Image.asset(AppAssets.logo),
              ),
              const SizedBox(width: 10),
            ],
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.navbarText,
                  fontFamily: AppFonts.garamond,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        actions: actions,
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          color: useGradientBackground
              ? null
              : backgroundColor ?? AppColors.homeCream,
          gradient: useGradientBackground ? AppGradients.hero : null,
        ),
        child: SafeArea(top: false, child: body),
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
