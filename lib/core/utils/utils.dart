import 'package:geolocator/geolocator.dart';

class MapPermissionUtil {
  static Future<LocationPermission> checkAndRequestLocationPermission() async {
    LocationPermission locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied ||
        locationPermission == LocationPermission.deniedForever) {
      locationPermission = await Geolocator.requestPermission();
    }
    return locationPermission;
  }
}
