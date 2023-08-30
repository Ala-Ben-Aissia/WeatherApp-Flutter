// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/screens/location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherDataLoading = await weatherModel.getLocationWeather();
    if (!context.mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (_) => LocationScreen(locationWeather: weatherDataLoading)),
      (route) => false,
    );
  }

  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitThreeBounce(
          color: Colors.green.shade900,
          size: 50,
        ),
      ),
    );
  }
}
