import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapps/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherapps/cubits/get_weather_cubit/get_weather_cubit_states.dart';
import 'package:weatherapps/models/weather_model.dart';
import 'package:weatherapps/views/search_page.dart';
import 'package:weatherapps/widgets/no_weather_data.dart';
import 'package:weatherapps/widgets/weather_info.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "WeatherApp",
            style: TextStyle(
              color: Colors.black,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchPage();
                    },
                  ),
                );
              },
              icon: Icon(Icons.search),
            ),
          ],
        ),
        // step 5 create blocbuilder to listen the state of WeatherState in change the ui depend on it ...
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is InitialWeatherState) {
              return NoWeatherData();
            } else if (state is WeatherLoadedState) {
              return WeatherInfo(weatherModel: state.weatherModel);
            } else {
              return const Text("opps there was an error ");
            }
          },
        ));
  }
}
