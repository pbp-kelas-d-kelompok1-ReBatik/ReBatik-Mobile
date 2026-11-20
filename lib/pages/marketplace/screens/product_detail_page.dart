import 'package:flutter/material.dart';

import '../marketplace_style.dart';
import '../models/product.dart';
import '../services/marketplace_service.dart';
import '../widgets/async_states.dart';
import '../widgets/product_card.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final _service = MarketplaceService();
  late Future<Product> _future;

  @override
  void initState() {
    super.initState();
    _future = _service.fetchProduct(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: marketplaceAppBar('Detail Produk'),
      body: FutureBuilder<Product>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return ErrorRetry(
              message: snapshot.error.toString(),
              onRetry: () => setState(
                () => _future = _service.fetchProduct(widget.productId),
              ),
            );
          }
          return _ProductDetailBody(product: snapshot.data!);
        },
      ),
    );
  }
}

class _ProductDetailBody extends StatelessWidget {
  const _ProductDetailBody({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListView(
      children: [
        AspectRatio(aspectRatio: 1, child: ProductImage(url: product.imageUrl)),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 8,
                children: [
                  Chip(label: Text(product.categoryDisplay)),
                  if (product.badgeStatus != null && product.badgeStatus!.isNotEmpty)
                    Chip(
                      label: Text(product.badgeStatus!),
                      backgroundColor: AppColors.gold,
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                product.name,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.brown,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                formatRupiah(product.price),
                style: textTheme.titleLarge?.copyWith(color: AppColors.brown),
              ),
              const SizedBox(height: 4),
              Text(
                product.isInStock ? 'Stok tersedia: ${product.stock}' : 'Stok habis',
                style: TextStyle(
                  color: product.isInStock ? Colors.green[800] : Colors.red,
                ),
              ),
              const Divider(height: 32),
              _InfoRow(label: 'Motif batik', value: product.motif),
              _InfoRow(label: 'Sumber kain', value: product.materialSource),
              _InfoRow(label: 'Pengrajin / asal', value: product.artisanOrigin),
              if (product.description.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text('Cerita karya', style: textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(product.description),
              ],
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  icon: const Icon(Icons.shopping_cart_checkout),
                  label: const Text('Beli Sekarang'),
                  // Checkout (POST /api/v1/marketplace/orders/) butuh login;
                  // dihubungkan setelah modul autentikasi mobile siap.
                  onPressed: product.isInStock
                      ? () => ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Checkout akan tersedia setelah fitur login.'),
                            ),
                          )
                      : null,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(label, style: const TextStyle(color: AppColors.brownLight)),
          ),
          Expanded(child: Text(value.isEmpty ? '-' : value)),
        ],
      ),
    );
  }
}
