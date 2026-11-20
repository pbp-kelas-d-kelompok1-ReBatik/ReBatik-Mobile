import 'package:flutter/material.dart';

/// Warna modul Marketplace, mengikuti palet halaman ReBatik & Donasi.
class AppColors {
  static const brown = Color(0xFF795548);
  static const brownDark = Color(0xFF5D4037);
  static const brownLight = Color(0xFF8D6E63);
  static const gold = Color(0xFFD9A441);
  static const cream = Color(0xFFF4EBDD);
  static const background = Color(0xFFFAF7F0);
}

/// AppBar seragam untuk halaman-halaman Marketplace.
AppBar marketplaceAppBar(String title, {List<Widget>? actions}) => AppBar(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      backgroundColor: AppColors.brown,
      foregroundColor: Colors.white,
      actions: actions,
    );

/// Format angka ke Rupiah, contoh: 150000 -> "Rp150.000".
String formatRupiah(int value) {
  final digits = value.toString();
  final buffer = StringBuffer();
  for (var i = 0; i < digits.length; i++) {
    if (i > 0 && (digits.length - i) % 3 == 0) buffer.write('.');
    buffer.write(digits[i]);
  }
  return 'Rp$buffer';
}
