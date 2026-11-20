import 'package:flutter/material.dart';

import '../theme/app_gradients.dart';

/// Membuat AppBar bersama dengan identitas navbar ReBatik.
///
/// Perilaku tombol drawer dan tombol kembali tetap ditentukan otomatis oleh
/// [Scaffold] dan [Navigator], sehingga helper ini aman digunakan pada halaman
/// utama maupun halaman detail.
AppBar rebatikAppBar(String title, {List<Widget>? actions}) {
  return AppBar(
    title: Text(title),
    flexibleSpace: const DecoratedBox(
      decoration: BoxDecoration(gradient: AppGradients.navbar),
    ),
    actions: actions,
  );
}
