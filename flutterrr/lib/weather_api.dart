import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApi {
  final String apiKey;
  final String baseUrl = 'https://api.weatherapi.com/v1';

  WeatherApi(this.apiKey);

  Future<dynamic> getWeather(String city) async {
    final response =
        await http.get(Uri.parse('$baseUrl/current.json?key=$apiKey&q=$city'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get weather data');
    }
  }
}
