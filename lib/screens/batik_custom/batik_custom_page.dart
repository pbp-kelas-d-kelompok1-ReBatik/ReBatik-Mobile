import 'package:flutter/material.dart';
import 'package:rebatik_mobile/data/batik_data.dart';
import 'package:rebatik_mobile/models/batik_motif.dart';
import 'package:rebatik_mobile/widgets/left_drawer.dart';

const Color primaryBrown = Color(0xFF795548);
const Color darkBrown = Color(0xFF5D4037);
const Color creamBackground = Color(0xFFFAF7F0);
const Color lightBrown = Color(0xFFE8DCD2);

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

  List<BatikMotif> get _recommendations {
    final palette = _palette;

    if (palette == null) return [];

    return batikMotifs.where((motif) => motif.tone == palette.tone).toList();
  }

  InputDecoration _decoration(String label, {String? hint}) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      labelStyle: const TextStyle(color: darkBrown),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFFD7C2B8)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFFD7C2B8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: primaryBrown, width: 1.8),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 1.8),
      ),
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
          backgroundColor: creamBackground,
          title: const Text(
            'Desain berhasil dibuat!',
            style: TextStyle(color: darkBrown, fontWeight: FontWeight.bold),
          ),
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
              child: const Text(
                'OK',
                style: TextStyle(
                  color: primaryBrown,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
      backgroundColor: creamBackground,

      appBar: AppBar(
        title: const Text(
          'Batik Custom',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: primaryBrown,
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      drawer: const LeftDrawer(),

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nama Desain
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: _decoration(
                    'Nama Desain',
                    hint: 'Contoh: Kemeja Parang Indigo',
                  ),
                  onChanged: (value) {
                    _designName = value;
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nama desain tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),

              // Gender
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: _decoration('Gender'),
                  initialValue: _gender,
                  items: batikGenders.map((gender) {
                    return DropdownMenuItem(value: gender, child: Text(gender));
                  }).toList(),
                  onChanged: (newValue) {
                    if (newValue == null) return;

                    setState(() {
                      _gender = newValue;
                    });
                  },
                ),
              ),

              // Style
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: _decoration('Style'),
                  initialValue: _style,
                  items: batikStyles.map((style) {
                    return DropdownMenuItem(value: style, child: Text(style));
                  }).toList(),
                  onChanged: (newValue) {
                    if (newValue == null) return;

                    setState(() {
                      _style = newValue;
                    });
                  },
                ),
              ),

              // Color Palette
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 4),
                child: Text(
                  'Color Palette',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _showPaletteError
                        ? Theme.of(context).colorScheme.error
                        : darkBrown,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: batikPalettes.map((palette) {
                    final selected = _palette == palette;

                    return ChoiceChip(
                      backgroundColor: Colors.white,
                      selectedColor: lightBrown,
                      side: BorderSide(
                        color: selected
                            ? primaryBrown
                            : const Color(0xFFD7C2B8),
                      ),
                      checkmarkColor: darkBrown,
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (final color in palette.colors)
                            Container(
                              width: 14,
                              height: 14,
                              margin: const EdgeInsets.only(right: 3),
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                              ),
                            ),
                          const SizedBox(width: 4),
                          Text(palette.name),
                        ],
                      ),
                      selected: selected,
                      onSelected: (_) {
                        setState(() {
                          _palette = palette;
                          _motif = null;
                          _showPaletteError = false;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),

              if (_showPaletteError)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Pilih salah satu color palette!',
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
                ),

              // Rekomendasi Motif
              if (_palette != null) ...[
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 12, 8, 4),
                  child: Text(
                    'Rekomendasi motif untuk tone ${_palette!.tone}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: darkBrown,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _recommendations.map((motif) {
                      return ChoiceChip(
                        label: Text(motif.name),
                        selected: _motif == motif,
                        backgroundColor: Colors.white,
                        selectedColor: lightBrown,
                        side: BorderSide(
                          color: _motif == motif
                              ? primaryBrown
                              : const Color(0xFFD7C2B8),
                        ),
                        checkmarkColor: darkBrown,
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

              // Model Pakaian
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: _decoration('Model Pakaian'),
                  initialValue: _garment,
                  items: batikGarments.map((garment) {
                    return DropdownMenuItem(
                      value: garment,
                      child: Text(garment),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    if (newValue == null) return;

                    setState(() {
                      _garment = newValue;
                    });
                  },
                ),
              ),

              // Catatan Tambahan
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 4,
                  decoration: _decoration(
                    'Catatan Tambahan',
                    hint: 'Ukuran, preferensi bahan, dan lainnya (opsional)',
                  ),
                  onChanged: (value) {
                    _notes = value;
                  },
                ),
              ),

              // Tombol Simpan
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBrown,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 2,
                    ),
                    onPressed: _submit,
                    child: const Text(
                      'Simpan Desain',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
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
