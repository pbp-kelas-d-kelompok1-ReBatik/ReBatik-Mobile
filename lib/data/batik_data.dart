import 'package:flutter/material.dart';
import 'package:rebatik_mobile/models/batik_motif.dart';

/// Katalog motif lokal (ringkasan, bisa disesuaikan dengan data web).
const List<BatikMotif> batikMotifs = [
  BatikMotif(
    id: 'parang',
    name: 'Parang',
    origin: 'Yogyakarta dan Surakarta',
    summary: 'Pola diagonal bersambung menyerupai ombak yang tak putus.',
    history:
        'Parang termasuk motif tertua dari lingkungan keraton Mataram. '
        'Pada masanya, beberapa ukuran parang hanya boleh dikenakan oleh '
        'kalangan tertentu di keraton.',
    philosophy:
        'Garis yang bersambung terus melambangkan semangat yang tidak pernah '
        'padam dan upaya menjaga kesinambungan hidup.',
    color: Color(0xFF6D4C41),
    tone: 'hangat',
  ),
  BatikMotif(
    id: 'kawung',
    name: 'Kawung',
    origin: 'Yogyakarta',
    summary: 'Empat lingkaran lonjong tersusun rapi seperti irisan buah.',
    history:
        'Kawung adalah salah satu motif geometris klasik Jawa yang sudah '
        'dikenal sejak lama dan sering muncul pada relief serta arca.',
    philosophy:
        'Susunan yang seimbang dan simetris dimaknai sebagai kesucian, '
        'keadilan, dan pengendalian diri.',
    color: Color(0xFF1565C0),
    tone: 'dingin',
  ),
  BatikMotif(
    id: 'mega-mendung',
    name: 'Mega Mendung',
    origin: 'Cirebon',
    summary: 'Gambaran awan bergradasi dengan warna biru dan merah.',
    history:
        'Mega Mendung berkembang di pesisir Cirebon dan menunjukkan '
        'percampuran budaya setempat dengan pengaruh Tiongkok.',
    philosophy:
        'Awan pembawa hujan melambangkan kesabaran dan ketenangan, '
        'yaitu pemimpin yang meneduhkan.',
    color: Color(0xFF283593),
    tone: 'dingin',
  ),
  BatikMotif(
    id: 'truntum',
    name: 'Truntum',
    origin: 'Surakarta',
    summary: 'Taburan bunga kecil seperti bintang di langit malam.',
    history:
        'Truntum dikenal sebagai motif yang lazim dikenakan orang tua '
        'mempelai dalam rangkaian upacara pernikahan adat Jawa.',
    philosophy:
        'Kata truntum berarti tumbuh kembali, yaitu cinta yang bersemi '
        'lagi dan tuntunan bagi generasi berikutnya.',
    color: Color(0xFFBF360C),
    tone: 'hangat',
  ),
  BatikMotif(
    id: 'sido-mukti',
    name: 'Sido Mukti',
    origin: 'Surakarta dan Yogyakarta',
    summary: 'Motif pernikahan dengan unsur yang melambangkan kemakmuran.',
    history:
        'Sido Mukti banyak dipakai pada acara pernikahan dengan warna '
        'sogan yang khas.',
    philosophy:
        'Sido berarti jadi dan mukti berarti hidup berkecukupan, sehingga '
        'motif ini membawa harapan kehidupan yang sejahtera.',
    color: Color(0xFF8D6E63),
    tone: 'hangat',
  ),
  BatikMotif(
    id: 'sekar-jagad',
    name: 'Sekar Jagad',
    origin: 'Jawa Tengah',
    summary: 'Kumpulan beragam bentuk yang disusun seperti peta bunga dunia.',
    history:
        'Sekar jagad menggabungkan banyak ragam hias dalam satu kain, '
        'sehingga tampilannya berbeda dari pola yang berulang.',
    philosophy:
        'Keberagaman yang tersusun indah melambangkan keindahan dunia dan '
        'kerukunan dalam perbedaan.',
    color: Color(0xFF455A64),
    tone: 'netral',
  ),
];

/// Pilihan color palette untuk Batik Custom.
class BatikPalette {
  final String name;
  final String tone; // 'hangat', 'dingin', atau 'netral'
  final List<Color> colors;

  const BatikPalette(this.name, this.tone, this.colors);
}

const List<BatikPalette> batikPalettes = [
  BatikPalette('Sogan Klasik', 'hangat', [
    Color(0xFF5D4037),
    Color(0xFF8D6E63),
    Color(0xFFD7B98E),
  ]),
  BatikPalette('Terakota', 'hangat', [
    Color(0xFFBF360C),
    Color(0xFFE64A19),
    Color(0xFFFFCCBC),
  ]),
  BatikPalette('Indigo Laut', 'dingin', [
    Color(0xFF1A237E),
    Color(0xFF3F51B5),
    Color(0xFFC5CAE9),
  ]),
  BatikPalette('Abu Netral', 'netral', [
    Color(0xFF37474F),
    Color(0xFF90A4AE),
    Color(0xFFECEFF1),
  ]),
];

const List<String> batikGenders = ['Perempuan', 'Laki-laki', 'Unisex'];
const List<String> batikStyles = ['Klasik', 'Modern', 'Kontemporer'];
const List<String> batikGarments = ['Kemeja', 'Dress', 'Outer', 'Kain panjang'];
