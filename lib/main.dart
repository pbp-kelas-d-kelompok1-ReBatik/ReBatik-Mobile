import 'package:flutter/material.dart';

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
      title: 'ReBatik Mobile',

      // Theme aplikasi
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),

      // Halaman utama aplikasi
      home:  ReBatikPage(),

      // Daftar navigasi halaman
      routes: {'/rebatik': (context) =>  ReBatikPage()},
    );
  }
}
