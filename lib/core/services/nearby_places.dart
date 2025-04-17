import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';

class PlacesService {
  final Dio _dio = Dio();

  Future<List<Map<String, dynamic>>> getNearbyGasStations(
    LatLng position,
  ) async {
    try {
      final query = """
        [out:json];
        (
          node["amenity"="fuel"](around:1000,${position.latitude},${position.longitude});
          way["amenity"="fuel"](around:1000,${position.latitude},${position.longitude});
          relation["amenity"="fuel"](around:1000,${position.latitude},${position.longitude});
        );
        out center;
      """;

      final response = await _dio.get(
        'https://overpass-api.de/api/interpreter',
        queryParameters: {'data': query},
      );

      if (response.statusCode == 200) {
        final elements = response.data['elements'] as List? ?? [];
        return elements.whereType<Map<String, dynamic>>().toList();
      } else {
        throw Exception('Failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('PlacesService error: $e');
    }
  }
}

