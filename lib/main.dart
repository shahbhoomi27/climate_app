import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
void main()=>runApp(MaterialApp(
  theme: ThemeData.dark(),
  home: LoadingScreen(),
));

class LoadingScreen extends StatefulWidget {
  @override

  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(onPressed: () async {
          Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
          print(position);
        },
        child: Text("Get Current Location"),),
      ),
    );
  }
}
