import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weatherapps/models/weather_model.dart';

class WeatherServices {
  final String baseUrl =
      "https://api.weatherapi.com"; // because of const for all method
  final String apiKey = "234fc9e559384c39a1c133055241505";
  final Dio dio;
  WeatherServices({required this.dio});

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/v1/forecast.json?key=$apiKey&q=$cityName&days=0');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      String errMessage = e.response?.data['error']['message'] ??
          "opps there was an error please try agin a later ...";
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("there was an error pls try again alater ");
    }
  }
}
