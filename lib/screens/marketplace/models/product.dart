/// Produk upcycling dari endpoint `/api/v1/marketplace/products/`.
class Product {
  final int id;
  final String name;
  final String motif;
  final String category;
  final String categoryDisplay;
  final String description;
  final String? badgeStatus;
  final String materialSource;
  final String artisanOrigin;
  final int price;
  final int stock;
  final bool isInStock;
  final String? imageUrl;

  const Product({
    required this.id,
    required this.name,
    required this.motif,
    required this.category,
    required this.categoryDisplay,
    required this.description,
    required this.badgeStatus,
    required this.materialSource,
    required this.artisanOrigin,
    required this.price,
    required this.stock,
    required this.isInStock,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as int,
        name: json['name'] as String,
        motif: json['motif'] as String? ?? '',
        category: json['category'] as String? ?? '',
        categoryDisplay: json['category_display'] as String? ?? '',
        description: json['description'] as String? ?? '',
        badgeStatus: json['badge_status'] as String?,
        materialSource: json['material_source'] as String? ?? '',
        artisanOrigin: json['artisan_origin'] as String? ?? '',
        price: json['price'] as int,
        stock: json['stock'] as int? ?? 0,
        isInStock: json['is_in_stock'] as bool? ?? false,
        imageUrl: _nonEmpty(json['image_url'] as String?),
      );

  static String? _nonEmpty(String? value) =>
      (value == null || value.trim().isEmpty) ? null : value.trim();
}

class ProductCategory {
  final String value;
  final String label;

  const ProductCategory(this.value, this.label);

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(json['value'] as String, json['label'] as String);
}
