import 'package:weather/services/location_service.dart';
import 'package:weather/services/network_service.dart';

const String apiKey = '40d93b36aa8eaa797c192a597e563347';

class WeatherModel {

  Future<dynamic> getCityWeather({String city = 'California'}) async {

    Uri url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'q': city,
      'units': 'metric',
      'appid': apiKey,
    });
    NetworkService networkService = NetworkService(url: url);
    var weatherData = await networkService.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    LocationService location = LocationService();
    await location.getCurrentLocation();
    Uri url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lon': '${location.longitude}',
      'lat': '${location.latitude}',
      'units': 'metric',
      'appid': apiKey,
    });
    NetworkService networkService = NetworkService(url: url);
    var weatherData = await networkService.getData();
    return weatherData;
  }
  

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(String temp) {
    if (int.parse(temp) > 25) {
      return 'It\'s 🍦 time';
    } else if (int.parse(temp) > 20) {
      return 'Time for shorts and 👕';
    } else if (int.parse(temp) < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
