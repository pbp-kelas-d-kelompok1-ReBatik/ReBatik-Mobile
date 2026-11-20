import 'package:flutter/material.dart';

/// Model satu motif batik untuk fitur Batik Story dan Batik Custom.
///
/// Data awal masih lokal. Nanti bisa diganti dari API
/// `/api/v1/batik-story/motifs/` setelah format JSON-nya dipastikan.
class BatikMotif {
  final String id;
  final String name;
  final String origin;
  final String summary;
  final String history;
  final String philosophy;
  final Color color;

  /// Tone warna motif: 'hangat', 'dingin', atau 'netral'.
  /// Dipakai Batik Custom untuk rekomendasi sesuai color palette.
  final String tone;

  const BatikMotif({
    required this.id,
    required this.name,
    required this.origin,
    required this.summary,
    required this.history,
    required this.philosophy,
    required this.color,
    required this.tone,
  });
}
