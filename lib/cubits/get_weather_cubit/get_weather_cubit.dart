import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapps/cubits/get_weather_cubit/get_weather_cubit_states.dart';
import 'package:weatherapps/models/weather_model.dart';
import 'package:weatherapps/services/weather_services.dart';
import 'package:weatherapps/views/search_page.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(InitialWeatherState());
  WeatherModel? weatherModel;

  getWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherServices(dio: Dio())
          .getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel!));
    } on Exception catch (e) {
      emit(WeatherFailerState());
    }
  }
}
