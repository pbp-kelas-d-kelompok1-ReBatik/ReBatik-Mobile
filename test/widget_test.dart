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
  final pageBackButton = find.text('Kembali ke ReBatik');
  final rebatikBackButton = find.byTooltip('Kembali');
  if (pageBackButton.evaluate().isNotEmpty) {
    await tester.tap(pageBackButton);
  } else if (rebatikBackButton.evaluate().isNotEmpty) {
    await tester.tap(rebatikBackButton);
  } else if (find.byTooltip('Open navigation menu').evaluate().isNotEmpty) {
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Beranda'));
  } else {
    await tester.pageBack();
  }
  await tester.pumpAndSettle();
}

void main() {
  testWidgets(
    'Halaman utama membuka Donasi, Upcycling, Rewards, Marketplace, dan Drop-Off Point',
    (tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.text('Selamat Datang di ReBatik!'), findsOneWidget);

      await _tapMenuButton(tester, 'Buka Halaman Donasi');
      expect(find.text('Donasi ReBatik'), findsOneWidget);
      await _goBack(tester);

      await _tapMenuButton(tester, 'Lihat Rewards');
      expect(find.widgetWithText(AppBar, 'Points & Rewards'), findsOneWidget);
      expect(find.text('Menuju Penenun Mahir'), findsOneWidget);
      await _goBack(tester);

      await _tapMenuButton(tester, 'Buka Upcycling');
      expect(find.widgetWithText(AppBar, 'Upcycling'), findsOneWidget);
      expect(find.text('Permintaan Saya'), findsOneWidget);
      expect(find.text('Belum ada permintaan'), findsOneWidget);
      await _goBack(tester);

      await _tapMenuButton(tester, 'Buka Marketplace');
      expect(find.widgetWithText(AppBar, 'Marketplace'), findsOneWidget);
      expect(find.text('Cari produk, motif, atau pengrajin'), findsOneWidget);
      await _goBack(tester);

      await _tapMenuButton(tester, 'Lihat Drop-Off Point');
      expect(find.widgetWithText(AppBar, 'Drop-Off Point'), findsOneWidget);
    },
  );

  testWidgets('Drawer membuka Rewards, Marketplace, dan Drop-Off Point', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    for (final title in ['Points & Rewards', 'Marketplace', 'Drop-Off Point']) {
      await tester.tap(find.byTooltip('Open navigation menu'));
      await tester.pumpAndSettle();
      final drawer = find.byType(Drawer);
      expect(
        find.descendant(of: drawer, matching: find.text('Upcycling')),
        findsOneWidget,
      );
      final item = find.descendant(of: drawer, matching: find.text(title));
      await tester.ensureVisible(item);
      await tester.pumpAndSettle();
      await tester.tap(item);
      await tester.pumpAndSettle();
      expect(find.widgetWithText(AppBar, title), findsOneWidget);
    }
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
