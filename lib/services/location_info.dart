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
    location.changeSettings(accuracy: LocationAccuracy.HIGH);
    try {
      var currentLocation = await location.getLocation();
      longitude = currentLocation.longitude;
      latitude = currentLocation.latitude;
    } catch (e) {
      print(e);
    }
  }

  Future<bool> getUserLocationAndGPS() async {
    return await Location().requestService() &&
        await Location().requestPermission();
  }
}
