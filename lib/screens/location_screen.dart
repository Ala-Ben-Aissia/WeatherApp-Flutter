import 'package:flutter/material.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/screens/city_screen.dart';
import 'package:weather/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final dynamic locationWeather;
  const LocationScreen({super.key, this.locationWeather});
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late String temperature;
  late int condition;
  late String cityName;
  late String text;
  late String icon;
  WeatherModel weather = WeatherModel();

  @override
  void initState() {
    updateUI(
      widget.locationWeather,
    );
    super.initState();
  }

  void updateUI(dynamic data) {
    setState(() {
      if (data == null) {
        temperature = '';
        icon = '';
        cityName = 'An Error Occured';
        text = 'Unable to get current weather data';
        return;
      }
      temperature = data['main']['temp'].round().toString();
      condition = data['weather'][0]['id'];
      cityName = data['name'];
      text = weather.getMessage(temperature);
      icon = weather.getWeatherIcon(condition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: const Icon(
                      color: Colors.blue,
                      Icons.near_me_rounded,
                      size: 50.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CityScreen(),
                        ),
                      );
                      if (typedName != null) {
                        var weatherData =
                            await weather.getCityWeather(city: typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: const Icon(
                      Icons.location_city_rounded,
                      size: 50.0,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 200),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$temperature°',
                          style: kTempTextStyle,
                        ),
                        Text(
                          icon,
                          style: kConditionTextStyle,
                        ),
                      ],
                    ),
                    Text(
                      cityName,
                      style: const TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, bottom: 40),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
