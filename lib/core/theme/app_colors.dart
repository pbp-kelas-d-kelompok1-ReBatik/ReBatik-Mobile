import 'package:flutter/material.dart';

/// Design token warna yang bersumber dari stylesheet situs web ReBatik.
///
/// Nama token mengikuti fungsi warna pada `style.css`, `navbar.css`, dan
/// `upcycling.css` agar identitas visual web dan mobile tetap selaras.
class AppColors {
  AppColors._();

  // Palet utama dari style.css.
  static const Color bar = Color(0xFF624A38);
  static const Color cream = Color(0xFFE9D7B9);
  static const Color creamLight = Color(0xFFFFF8ED);
  static const Color brown = Color(0xFF4A2E23);
  static const Color brownDark = Color(0xFF5A3022);
  static const Color brownMuted = Color(0xFF785A4B);
  static const Color gold = Color(0xFFD9A441);
  static const Color focus = Color(0xFFFFF3CF);
  static const Color button = Color(0xFFA8613E);
  static const Color buttonHover = Color(0xFF7D422D);
  static const Color actionAccent = Color(0xFFC9965F);
  static const Color card = Color(0xFFFFF9F1);
  static const Color border = Color(0xFFE2CDB9);
  static const Color danger = Color(0xFF8B3329);
  static const Color dangerHover = Color(0xFF70261F);

  // Warna penyusun gradient tombol utama dan tombol berbahaya.
  static const Color primaryActionStart = Color(0xFF7F5237);
  static const Color primaryActionEnd = Color(0xFF432E2B);
  static const Color dangerActionStart = Color(0xFFB6534B);
  static const Color dangerActionEnd = Color(0xFF7A3027);

  // Palet latar halaman dari bagian home pada style.css.
  static const Color homeBrown = Color(0xFF603B29);
  static const Color homeBrownDark = Color(0xFF422719);
  static const Color homeBrownLight = Color(0xFF8A5234);
  static const Color homeCream = Color(0xFFFFF7E9);
  static const Color homeCreamLight = Color(0xFFFFFAF2);
  static const Color homePeach = Color(0xFFF0C19D);
  static const Color homeGold = Color(0xFFDCA34F);
  static const Color homeGoldLight = Color(0xFFF1CC83);
  static const Color homeText = Color(0xFF684832);

  // Warna penyusun gradient hero pada halaman utama web.
  static const Color heroStart = Color(0xFFF9E8D2);
  static const Color heroMiddle = Color(0xFFEFC19E);
  static const Color heroEnd = Color(0xFFDBA17D);

  // Gradasi dan konten navbar dari navbar.css.
  static const Color navbarStart = Color(0xFF583725);
  static const Color navbarMiddle = Color(0xFF6B452F);
  static const Color navbarEnd = Color(0xFF4C3022);
  static const Color navbarCopper = Color(0xFFB9743F);
  static const Color navbarCopperDark = Color(0xFF9C5E30);
  static const Color navbarGold = homeGoldLight;
  static const Color navbarCream = Color(0xFFFFF4E2);
  static const Color navbarText = Color(0xFFF6E4C8);
  static const Color navbarInk = Color(0xFF4A2A1A);
  static const Color navbarRed = Color(0xFFD8374B);

  // Token khusus modul Upcycling dari upcycling.css.
  static const Color upcyclingPanel = Color(0xFFF3EBE1);
  static const Color upcyclingSurface = Color(0xFFFCF9F5);
  static const Color upcyclingCardBorder = Color(0xFFE7C9A8);
  static const Color upcyclingSoft = Color(0xFFF0E2D5);
  static const Color upcyclingSummary = Color(0xFFECDDCE);

  // Warna gradient interaksi khusus Upcycling.
  static const Color upcyclingButtonStart = Color(0xFF673A1F);
  static const Color upcyclingButtonEnd = Color(0xFF98706B);
  static const Color upcyclingSelectedStart = Color(0xFFE5B77B);

  // Warna status permintaan Upcycling.
  static const Color statusPending = Color(0xFFDBE6F1);
  static const Color statusPendingText = Color(0xFF1F3A56);
  static const Color statusProcessing = Color(0xFFF3DCC0);
  static const Color statusProcessingText = Color(0xFF6A3B12);
  static const Color statusCompleted = Color(0xFFD6E6D2);
  static const Color statusCompletedText = Color(0xFF1F4A22);
  static const Color statusCancelled = Color(0xFFF4D6D2);
  static const Color statusCancelledText = Color(0xFF7A3027);

  /// Bayangan card yang setara dengan cokelat web pada opasitas 22 persen.
  static const Color cardShadow = Color(0x384A2E23);

  /// Bayangan tombol aksi utama pada opasitas 30 persen.
  static const Color primaryActionShadow = Color(0x4D4A2E23);
}
