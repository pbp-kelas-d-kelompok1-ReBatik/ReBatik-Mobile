/// Alamat server Django ReBatik.
///
/// Default: deployment PWS. Untuk server lokal jalankan, misalnya:
///   flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8000   (emulator Android)
///   flutter run --dart-define=API_BASE_URL=http://127.0.0.1:8000  (Windows/desktop)
class ApiConfig {
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://alisa-selvia-rebatik.pws.cs.ui.ac.id',
  );

  static Uri uri(String path, [Map<String, String>? query]) {
    final cleanQuery = <String, String>{
      for (final entry in (query ?? const <String, String>{}).entries)
        if (entry.value.isNotEmpty) entry.key: entry.value,
    };
    return Uri.parse('$baseUrl$path')
        .replace(queryParameters: cleanQuery.isEmpty ? null : cleanQuery);
  }
}
