import 'package:flutter/material.dart';
import 'package:the_wetter/bloc/weatherBloc.dart';
import 'package:the_wetter/widget/background.dart';
import 'package:the_wetter/widget/topBar.dart';
import 'package:the_wetter/widget/weather_info.dart';
import 'package:the_wetter/model/weatherModel.dart';

class WeatherPage extends StatelessWidget{

  WeatherModel weatherModel;
  WeatherBloc weatherBloc;

  WeatherPage(this.weatherModel, this.weatherBloc);

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Background(Colors.black.withOpacity(0.35), weatherModel.imageURL),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                ),
                child: TopBar(weatherModel.address, weatherBloc, weatherModel.imageURL),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 220,
                ),
                child: WeatherInfo(
                    weatherModel.temperature,
                    weatherModel.summary,
                    weatherModel.forecast,
                    weatherModel.precip,
                    weatherModel.iconito),
              ),
            ],
          ),
        ],
      ),
    );
  }

}