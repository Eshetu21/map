import 'package:geolocator/geolocator.dart';

class PanelPositionUtils {
  static bool isSlidingPanelOpen(double position) {
    return position > 0.98;
  }

  static bool isSlidingPanelClosed(double position) {
    return position < 0.98;
  }
}

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

