/// Titik pengumpulan kain dari endpoint `/api/v1/marketplace/dropoff-points/`.
class DropOffPoint {
  final int id;
  final String? code;
  final String name;
  final String address;
  final String city;
  final String province;
  final String operatingHours;
  final String phone;
  final List<String> acceptedItems;
  final String? mapsUrl;

  const DropOffPoint({
    required this.id,
    required this.code,
    required this.name,
    required this.address,
    required this.city,
    required this.province,
    required this.operatingHours,
    required this.phone,
    required this.acceptedItems,
    required this.mapsUrl,
  });

  factory DropOffPoint.fromJson(Map<String, dynamic> json) => DropOffPoint(
        id: json['id'] as int,
        code: json['code'] as String?,
        name: json['name'] as String,
        address: json['address'] as String? ?? '',
        city: json['city'] as String? ?? '',
        province: json['province'] as String? ?? '',
        operatingHours: json['operating_hours'] as String? ?? '',
        phone: json['phone'] as String? ?? '',
        acceptedItems: [
          for (final item in (json['accepted_items'] as List? ?? const []))
            item.toString(),
        ],
        mapsUrl: json['maps_url'] as String?,
      );
}
