import 'package:flutter/material.dart';

import '../marketplace_style.dart';
import '../models/product.dart';
import '../services/marketplace_service.dart';
import '../widgets/async_states.dart';
import '../widgets/product_card.dart';
import 'dropoff_list_page.dart';
import 'product_detail_page.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final _service = MarketplaceService();
  final _searchController = TextEditingController();

  static const _sortOptions = {
    'newest': 'Terbaru',
    'price_asc': 'Harga Terendah',
    'price_desc': 'Harga Tertinggi',
  };

  List<ProductCategory> _categories = const [];
  String _category = '';
  String _sort = 'newest';
  late Future<List<Product>> _future;

  @override
  void initState() {
    super.initState();
    _future = _load();
    _service.fetchCategories().then((value) {
      if (mounted) setState(() => _categories = value);
    }).catchError((_) {});
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<List<Product>> _load() => _service.fetchProducts(
        query: _searchController.text.trim(),
        category: _category,
        sort: _sort,
      );

  void _reload() => setState(() => _future = _load());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: marketplaceAppBar(
        'Marketplace',
        actions: [
          IconButton(
            tooltip: 'Drop-Off Point',
            icon: const Icon(Icons.place_outlined),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const DropOffListPage()),
            ),
          ),
          PopupMenuButton<String>(
            tooltip: 'Urutkan',
            icon: const Icon(Icons.sort),
            initialValue: _sort,
            onSelected: (value) {
              _sort = value;
              _reload();
            },
            itemBuilder: (_) => [
              for (final entry in _sortOptions.entries)
                PopupMenuItem(value: entry.key, child: Text(entry.value)),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: TextField(
              controller: _searchController,
              textInputAction: TextInputAction.search,
              onSubmitted: (_) => _reload(),
              decoration: InputDecoration(
                hintText: 'Cari produk, motif, atau pengrajin',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _reload();
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                _categoryChip('', 'Semua'),
                for (final c in _categories) _categoryChip(c.value, c.label),
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                _reload();
                await _future.catchError((_) => <Product>[]);
              },
              child: FutureBuilder<List<Product>>(
                future: _future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return ErrorRetry(
                      message: snapshot.error.toString(),
                      onRetry: _reload,
                    );
                  }
                  final products = snapshot.data!;
                  if (products.isEmpty) {
                    return ListView(
                      children: const [
                        SizedBox(height: 120),
                        EmptyState(
                          icon: Icons.inventory_2_outlined,
                          message: 'Belum ada produk yang cocok.',
                        ),
                      ],
                    );
                  }
                  return GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 240,
                      childAspectRatio: 0.62,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(
                        product: product,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailPage(productId: product.id),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryChip(String value, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(
        label: Text(label),
        selected: _category == value,
        selectedColor: AppColors.gold,
        onSelected: (_) {
          _category = value;
          _reload();
        },
      ),
    );
  }
}
