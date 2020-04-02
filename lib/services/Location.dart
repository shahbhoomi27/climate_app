import 'package:geolocator/geolocator.dart';

class Location {
  double lattitude;
  double longitude;


  Location({this.lattitude, this.longitude});

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      this.lattitude = position.latitude;
      this.longitude = position.longitude;
      print(position);
    } catch (e) {
      print(e);
    }
  }
}
