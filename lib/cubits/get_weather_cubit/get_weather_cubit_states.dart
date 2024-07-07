// حالات تغير الاستيت
import 'package:weatherapps/models/weather_model.dart';

class WeatherState {} // apply polymorphism

class InitialWeatherState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;
  WeatherLoadedState(this.weatherModel);
}

class WeatherFailerState extends WeatherState {}
