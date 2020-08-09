import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

int count = 0;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  dynamic temp;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData;
    WeatherModel weatherModel = WeatherModel();
    weatherData = await weatherModel.locationWeatherData();

    temp = weatherData['main']['temp'];
    print('temp: $temp°C');
    print('area: ${weatherData['name']}');

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationScreen(
                  locationWeather: weatherData,
                )));
  }

  @override
  Widget build(BuildContext context) {
    print('Build in loading screen called');

    return Scaffold(
      body: Center(
        child: FlatButton(
          child: SpinKitChasingDots(
            color: Colors.white,
          ),
          onPressed: () {
            getLocationData();
          },
        ),
      ),
    );
  }
}
