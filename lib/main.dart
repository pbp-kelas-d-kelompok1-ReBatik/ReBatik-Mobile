import 'package:flutter/material.dart';

import 'package:rebatik_mobile/core/theme/app_theme.dart';
import 'package:rebatik_mobile/core/theme/app_gradients.dart';
import 'package:rebatik_mobile/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ReBatik',

      // Tema bersama menjaga warna, font, dan komponen seluruh modul konsisten.
      theme: AppTheme.light,

      // Gradient web dipasang di belakang seluruh route aplikasi.
      builder: (context, child) => DecoratedBox(
        decoration: const BoxDecoration(gradient: AppGradients.hero),
        child: child ?? const SizedBox.shrink(),
      ),

      // Halaman utama aplikasi
      home: const ReBatikPage(),

      // Daftar navigasi halaman
      routes: {'/rebatik': (context) => const ReBatikPage()},
    );
  }
}
