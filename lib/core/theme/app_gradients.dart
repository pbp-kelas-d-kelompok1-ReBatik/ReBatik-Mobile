import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Gradient bersama yang diterjemahkan dari stylesheet situs web ReBatik.
class AppGradients {
  AppGradients._();

  /// Gradient vertikal untuk tombol aksi utama.
  static const LinearGradient primaryAction = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.primaryActionStart, AppColors.primaryActionEnd],
  );

  /// Gradient horizontal untuk header atau AppBar bermerek ReBatik.
  static const LinearGradient navbar = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      AppColors.navbarStart,
      AppColors.navbarMiddle,
      AppColors.navbarEnd,
    ],
    stops: [0, 0.5, 1],
  );

  /// Gradient cream dan peach untuk latar hero atau halaman utama.
  static const LinearGradient hero = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.heroStart, AppColors.heroMiddle, AppColors.heroEnd],
    stops: [0, 0.52, 1],
  );

  /// Gradient untuk aksi destruktif seperti membatalkan permintaan.
  static const LinearGradient dangerAction = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.dangerActionStart, AppColors.dangerActionEnd],
  );

  /// Gradient cokelat alternatif pada tombol modul Upcycling.
  static const LinearGradient upcyclingButton = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.upcyclingButtonStart, AppColors.upcyclingButtonEnd],
  );

  /// Gradient penanda pilihan kain atau produk yang sedang aktif.
  static const LinearGradient upcyclingSelected = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.upcyclingSelectedStart, AppColors.actionAccent],
  );
}
