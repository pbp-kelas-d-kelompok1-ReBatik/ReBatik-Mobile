import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:rebatik_mobile/main.dart';
import 'package:rebatik_mobile/screens/marketplace/marketplace_style.dart';
import 'package:rebatik_mobile/screens/marketplace/models/dropoff_point.dart';
import 'package:rebatik_mobile/screens/marketplace/models/product.dart';

Future<void> _tapMenuButton(WidgetTester tester, String label) async {
  final button = find.text(label);
  await tester.scrollUntilVisible(button, 200);
  await tester.tap(button);
  await tester.pumpAndSettle();
}

Future<void> _goBack(WidgetTester tester) async {
  await tester.pageBack();
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('Halaman utama membuka Donasi, Marketplace, dan Drop-Off Point', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Selamat Datang di ReBatik!'), findsOneWidget);

    await _tapMenuButton(tester, 'Buka Halaman Donasi');
    expect(find.text('Donasi ReBatik'), findsOneWidget);
    await _goBack(tester);

    await _tapMenuButton(tester, 'Buka Marketplace');
    expect(find.widgetWithText(AppBar, 'Marketplace'), findsOneWidget);
    expect(find.text('Cari produk, motif, atau pengrajin'), findsOneWidget);
    await _goBack(tester);

    await _tapMenuButton(tester, 'Lihat Drop-Off Point');
    expect(find.widgetWithText(AppBar, 'Drop-Off Point'), findsOneWidget);
  });

  test('formatRupiah memakai pemisah ribuan titik', () {
    expect(formatRupiah(0), 'Rp0');
    expect(formatRupiah(5000), 'Rp5.000');
    expect(formatRupiah(1250000), 'Rp1.250.000');
  });

  test('Product dan DropOffPoint dibaca dari JSON API', () {
    final product = Product.fromJson({
      'id': 1,
      'name': 'Tas Perca Parang',
      'motif': 'Parang',
      'category': 'TAS',
      'category_display': 'Tas',
      'description': '',
      'badge_status': null,
      'material_source': 'Kain perca',
      'artisan_origin': 'Solo',
      'price': 150000,
      'stock': 2,
      'is_in_stock': true,
      'image_url': '',
    });

    expect(product.imageUrl, isNull);
    expect(product.isInStock, isTrue);

    final point = DropOffPoint.fromJson({
      'id': 7,
      'code': 'rbt-dpk-01',
      'name': 'Drop-off Margonda',
      'address': 'Jl. Margonda',
      'city': 'Depok',
      'province': 'Jawa Barat',
      'operating_hours': '08:30 - 20:00 WIB',
      'phone': '0812',
      'accepted_items': ['Kain Perca Batik'],
      'maps_url': null,
    });

    expect(point.acceptedItems, ['Kain Perca Batik']);
  });
}
