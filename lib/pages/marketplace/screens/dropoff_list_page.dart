import 'package:flutter/material.dart';

import '../marketplace_style.dart';
import '../models/dropoff_point.dart';
import '../services/marketplace_service.dart';
import '../widgets/async_states.dart';

class DropOffListPage extends StatefulWidget {
  const DropOffListPage({super.key});

  @override
  State<DropOffListPage> createState() => _DropOffListPageState();
}

class _DropOffListPageState extends State<DropOffListPage> {
  final _service = MarketplaceService();
  final _searchController = TextEditingController();

  List<String> _cities = const [];
  String _city = '';
  late Future<List<DropOffPoint>> _future;

  @override
  void initState() {
    super.initState();
    _future = _load();
    _service.fetchDropOffCities().then((value) {
      if (mounted) setState(() => _cities = value);
    }).catchError((_) {});
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<List<DropOffPoint>> _load() => _service.fetchDropOffPoints(
        query: _searchController.text.trim(),
        city: _city,
      );

  void _reload() => setState(() => _future = _load());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: marketplaceAppBar('Drop-Off Point'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: TextField(
              controller: _searchController,
              textInputAction: TextInputAction.search,
              onSubmitted: (_) => _reload(),
              decoration: InputDecoration(
                hintText: 'Cari nama tempat atau alamat',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButtonFormField<String>(
              initialValue: _city,
              isExpanded: true,
              decoration: InputDecoration(
                labelText: 'Kota',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              items: [
                const DropdownMenuItem(value: '', child: Text('Semua kota')),
                for (final city in _cities)
                  DropdownMenuItem(value: city, child: Text(city)),
              ],
              onChanged: (value) {
                _city = value ?? '';
                _reload();
              },
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: FutureBuilder<List<DropOffPoint>>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return ErrorRetry(message: snapshot.error.toString(), onRetry: _reload);
                }
                final points = snapshot.data!;
                if (points.isEmpty) {
                  return const EmptyState(
                    icon: Icons.location_off_outlined,
                    message: 'Tidak ada Drop-Off Point yang cocok.',
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
                  itemCount: points.length,
                  itemBuilder: (context, index) => _DropOffCard(point: points[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _DropOffCard extends StatelessWidget {
  const _DropOffCard({required this.point});

  final DropOffPoint point;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              point.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.brown,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 6),
            _line(Icons.location_on_outlined, '${point.address}, ${point.city}'),
            if (point.operatingHours.isNotEmpty)
              _line(Icons.schedule, point.operatingHours),
            if (point.phone.isNotEmpty) _line(Icons.phone_outlined, point.phone),
            if (point.acceptedItems.isNotEmpty) ...[
              const SizedBox(height: 8),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  for (final item in point.acceptedItems)
                    Chip(
                      label: Text(item, style: const TextStyle(fontSize: 12)),
                      backgroundColor: AppColors.cream,
                      visualDensity: VisualDensity.compact,
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _line(IconData icon, String text) => Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 16, color: AppColors.brownLight),
            const SizedBox(width: 6),
            Expanded(child: Text(text)),
          ],
        ),
      );
}
