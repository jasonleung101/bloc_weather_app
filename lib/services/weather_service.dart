import 'package:bloc_weather_app/model/weather.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherService {
  static dynamic getWeather(String lat, String lon) async {
    const String baseURL = 'https://api.openweathermap.org/data/2.5/weather';
    String apiKey = dotenv.env['OPEN_WEATHER_MAP_API_KEY'] ?? '';
    Dio dio = Dio();
    String _url = '$baseURL?lat=$lat&lon=$lon&appid=$apiKey&units=metric';
    print(_url);
    Response _response = await dio.get(_url);
    try {
      WeatherResponse _weatherResponse =
          WeatherResponse.fromJson(_response.data);
      return _weatherResponse;
    } catch (e) {
      print(e);
    }
  }
}
