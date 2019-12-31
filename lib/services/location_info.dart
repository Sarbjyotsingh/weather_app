import 'package:location/location.dart';

class LocationInfo {
  double longitude;
  double latitude;

  Future<void> getUserLocationData() async {
    Location location = new Location();
    if (!await Location().hasPermission()) {
      if (!await Location().requestPermission()) {
        return;
      }
    }
    location.changeSettings(accuracy: LocationAccuracy.BALANCED);
    await _enableGPS();
    var currentLocation = await location.getLocation();
    longitude = currentLocation.longitude;
    latitude = currentLocation.latitude;
  }

  Future<bool> getUserLocation() async {
    return await Location().requestPermission();
  }

  Future<void> _enableGPS() async {
    var isGpsEnabled = await Location().serviceEnabled();
    if (!isGpsEnabled) {
      await Location().requestService();
    }
  }
}
