import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_report/shared/api_endpoints.dart';

class WeatherService {
  Future<Map<String, dynamic>> fetchCurrentWeather(String city) async {
    final url =
        '${ApiEndpoints.forecastBaseUrl}?key=${ApiEndpoints.apiKey}&q=$city&days=1&aqi=no&alerts=no';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather');
    }
  }

  Future<Map<String, dynamic>> fetch7DayForecast(String city) async {
    final url =
        '${ApiEndpoints.forecastBaseUrl}?key=${ApiEndpoints.apiKey}&q=$city&days=7&aqi=no&alerts=no';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load forecast data');
    }
  }

  Future<List<dynamic>?> fetchCitySuggestions(String query) async {
    final url =
        '${ApiEndpoints.searchBaseUrl}?key=${ApiEndpoints.apiKey}&q=$query';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }
}
