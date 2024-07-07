import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:weatherapps/main.dart';
import 'package:weatherapps/models/weather_model.dart';
import 'package:weatherapps/views/search_page.dart';

class WeatherInfo extends StatelessWidget {
  final WeatherModel weatherModel;
  WeatherInfo({required this.weatherModel});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              getThemeColor(
                weatherModel.weatherCondition,
              ),
              getThemeColor(weatherModel.weatherCondition)[300]!
            ],
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              "Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  "https:${weatherModel.image}",
                  height: 80,
                  width: 80,
                ),
                Text(
                  weatherModel.temp.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    Text(
                      'Maxtemp: ${weatherModel.maxTemp.round()}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Mintemp: ${weatherModel.minTemp.round()}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.weatherCondition.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
