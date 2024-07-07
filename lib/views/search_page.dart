import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapps/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapps/models/weather_model.dart';
import 'package:weatherapps/services/weather_services.dart';

WeatherModel? weatherModel; // global variable

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "Search",
          style: TextStyle(
            color: Colors.black,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: TextField(
              onSubmitted: (value) async {
                //used to accepted value from user after he submitted
                // object from global GetWeatherCubit --> bloc pattern
                var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
                getWeatherCubit.getWeather(cityName: value);
                //  weatherModel = await WeatherServices(dio: Dio())
                //    .getCurrentWeather(cityName: value);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search),
                label: const Text("City name"),
                hintText: "enter name of city ",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.orange,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.orange,
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
