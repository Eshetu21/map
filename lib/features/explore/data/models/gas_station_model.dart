class GasStation {
  final String name;
  final double lat;
  final double lng;

  GasStation({
    required this.name,
    required this.lat,
    required this.lng,
  });

  factory GasStation.fromJson(Map<String, dynamic> json) {
    final tags = json['tags'] ?? {};

    final name = tags['name'] ??
        tags['name:en'] ??
        tags['name:am'] ??
        'Unknown Gas Station';

    final lat = json['lat'] ?? json['center']?['lat'];
    final lon = json['lon'] ?? json['center']?['lon'];

    return GasStation(
      name: name,
      lat: (lat as num?)?.toDouble() ?? 0.0,
      lng: (lon as num?)?.toDouble() ?? 0.0,
    );
  }
}

