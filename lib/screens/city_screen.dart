import 'package:flutter/material.dart';
import 'package:weather/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});
  @override
  State<CityScreen> createState() => _CityScreenState();
}

String cityName = '';

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 40.0,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context, cityName);
                },
                child: const Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
