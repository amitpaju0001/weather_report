import 'package:flutter/material.dart';
import 'package:weather_report/service/weather_service.dart';
import 'package:weather_report/shared/const/string_const.dart';


class WeatherProvider with ChangeNotifier {
  final WeatherService _weatherService = WeatherService();
  Map<String, dynamic>? _currentWeather;
  List<dynamic>? _forecast;
  List<dynamic>? _citySuggestions;
  String _city = StringConst.london;
  String? _errorMessage;

  String get city => _city;

  Map<String, dynamic>? get currentWeather => _currentWeather;

  List<dynamic>? get forecast => _forecast;

  List<dynamic>? get citySuggestions => _citySuggestions;

  String? get errorMessage => _errorMessage;

  Future<void> fetchWeather() async {
    try {
      final weatherData = await _weatherService.fetchCurrentWeather(_city);
      _currentWeather = weatherData;
      _errorMessage = null;
    } catch (e) {
      _currentWeather = null;
      _errorMessage = StringConst.errorMessageWeather;
      debugPrint('Error fetching weather: $e');
    }
    notifyListeners();
  }

  Future<void> fetchForecastDays() async {
    try {
      final forecastData = await _weatherService.fetch7DayForecast(_city);
      _forecast = forecastData[StringConst.forecast][StringConst.forecastDay];
      _errorMessage = null;
    } catch (e) {
      _forecast = null;
      _errorMessage = StringConst.errorMessageForecast;
      debugPrint('Error fetching forecast: $e');
    }
    notifyListeners();
  }

  Future<List<dynamic>> fetchCitySuggestions(String query) async {
    try {
      final suggestions = await _weatherService.fetchCitySuggestions(query);
      _citySuggestions = suggestions;
      _errorMessage = null;
    } catch (e) {
      _citySuggestions = null;
      _errorMessage = StringConst.errorMessageCity;
      debugPrint('Error fetching city suggestions: $e');
    }
    notifyListeners();
    return _citySuggestions ?? [];
  }

  void setCity(String city) {
    _city = city;
    fetchWeather();
    fetchForecastDays();
  }
}
