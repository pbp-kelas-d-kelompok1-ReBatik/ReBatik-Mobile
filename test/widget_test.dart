import 'package:flutter_test/flutter_test.dart';

import 'package:rebatik_mobile/main.dart';

void main() {
  testWidgets('Halaman utama ReBatik tampil', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Selamat Datang di ReBatik!'), findsOneWidget);
  });
}
