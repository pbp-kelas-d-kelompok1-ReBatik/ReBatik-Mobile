import 'package:flutter/material.dart';
import 'package:rebatik_mobile/data/batik_data.dart';
import 'package:rebatik_mobile/models/batik_motif.dart';
import 'package:rebatik_mobile/widgets/left_drawer.dart';

class BatikCustomPage extends StatefulWidget {
  const BatikCustomPage({super.key});

  @override
  State<BatikCustomPage> createState() => _BatikCustomPageState();
}

class _BatikCustomPageState extends State<BatikCustomPage> {
  final _formKey = GlobalKey<FormState>();

  String _designName = '';
  String _gender = batikGenders.first;
  String _style = batikStyles.first;
  String _garment = batikGarments.first;
  String _notes = '';
  BatikPalette? _palette;
  BatikMotif? _motif;
  bool _showPaletteError = false;

  /// Motif yang tone warnanya cocok dengan palette yang dipilih.
  List<BatikMotif> get _recommendations {
    final palette = _palette;
    if (palette == null) return [];
    return batikMotifs.where((m) => m.tone == palette.tone).toList();
  }

  InputDecoration _decoration(String label, {String? hint}) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
    );
  }

  void _submit() {
    final bool formValid = _formKey.currentState!.validate();
    final bool paletteValid = _palette != null;

    setState(() {
      _showPaletteError = !paletteValid;
    });

    if (!formValid || !paletteValid) return;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Desain berhasil dibuat!'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nama Desain: $_designName'),
                Text('Gender: $_gender'),
                Text('Style: $_style'),
                Text('Color Palette: ${_palette!.name}'),
                Text('Motif: ${_motif?.name ?? 'Belum dipilih'}'),
                Text('Model Pakaian: $_garment'),
                Text('Catatan: ${_notes.isEmpty ? '-' : _notes}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
                _formKey.currentState!.reset();
                setState(() {
                  _designName = '';
                  _gender = batikGenders.first;
                  _style = batikStyles.first;
                  _garment = batikGarments.first;
                  _notes = '';
                  _palette = null;
                  _motif = null;
                  _showPaletteError = false;
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F0),
      appBar: AppBar(
        title: const Text(
          'Batik Custom',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF00695C),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Nama Desain ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: _decoration(
                    'Nama Desain',
                    hint: 'Contoh: Kemeja Parang Indigo',
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _designName = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nama desain tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),
              // === Gender ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: _decoration('Gender'),
                  initialValue: _gender,
                  items: batikGenders
                      .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _gender = newValue!;
                    });
                  },
                ),
              ),
              // === Style ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: _decoration('Style'),
                  initialValue: _style,
                  items: batikStyles
                      .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _style = newValue!;
                    });
                  },
                ),
              ),
              // === Color Palette ===
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                child: Text(
                  'Color Palette',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _showPaletteError
                        ? Theme.of(context).colorScheme.error
                        : const Color(0xFF5D4037),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: batikPalettes.map((palette) {
                    return ChoiceChip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (final c in palette.colors)
                            Container(
                              width: 14,
                              height: 14,
                              margin: const EdgeInsets.only(right: 3),
                              decoration: BoxDecoration(
                                color: c,
                                shape: BoxShape.circle,
                              ),
                            ),
                          const SizedBox(width: 4),
                          Text(palette.name),
                        ],
                      ),
                      selected: _palette == palette,
                      onSelected: (_) {
                        setState(() {
                          _palette = palette;
                          _motif = null; // rekomendasi berubah
                          _showPaletteError = false;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              if (_showPaletteError)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Pilih salah satu color palette!',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
              // === Rekomendasi Motif ===
              if (_palette != null) ...[
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                  child: Text(
                    'Rekomendasi motif untuk tone ${_palette!.tone}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5D4037),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 8.0,
                    children: _recommendations.map((motif) {
                      return ChoiceChip(
                        label: Text(motif.name),
                        selected: _motif == motif,
                        onSelected: (_) {
                          setState(() {
                            _motif = motif;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
              // === Model Pakaian ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: _decoration('Model Pakaian'),
                  initialValue: _garment,
                  items: batikGarments
                      .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _garment = newValue!;
                    });
                  },
                ),
              ),
              // === Catatan ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 4,
                  decoration: _decoration(
                    'Catatan Tambahan',
                    hint: 'Ukuran, preferensi bahan, dan lainnya (opsional)',
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _notes = value!;
                    });
                  },
                ),
              ),
              // === Tombol Simpan ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color(0xFF00695C),
                      ),
                    ),
                    onPressed: _submit,
                    child: const Text(
                      'Simpan Desain',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
