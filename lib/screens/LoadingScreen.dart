import 'package:flutter/material.dart';
import 'package:climate_app/services/Location.dart';
import 'package:climate_app/services/NetworkHelper.dart';
import 'package:climate_app/screens/LocationScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const String api_key = "f3c60dc58a3f9cd6cdfc9d4855cba851";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat, lon;

  @override
  void initState() {
    super.initState();

    getLocationData();
  }

  void getLocationData() async {
    Location mlLocation = Location();
    await mlLocation.getCurrentLocation();
    lat = mlLocation.lattitude;
    lon = mlLocation.longitude;
    String url =
        "https://samples.openweathermap.org/data/2.5/weather?lat=$lat.&lon=$lon&appid=$api_key";
    print(url);
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    var longitude = weatherData["coord"]["lon"];
    var description = weatherData["weather"][0]["description"];
    print(longitude);
    print(description);

    Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(locationWeather: weatherData)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      ),
    );
  }
}
