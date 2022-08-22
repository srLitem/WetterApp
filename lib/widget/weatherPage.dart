import 'package:flutter/material.dart';
import 'package:the_wetter/bloc/weatherBloc.dart';
import 'package:the_wetter/widget/background.dart';
import 'package:the_wetter/widget/topBar.dart';
import 'package:the_wetter/widget/weather_info.dart';
import 'package:the_wetter/model/weatherModel.dart';

class WeatherPage extends StatelessWidget {
  WeatherModel weatherModel;
  WeatherBloc? weatherBloc;

  WeatherPage(this.weatherModel, this.weatherBloc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Background(setColor(weatherModel.iconito), weatherModel.imageURL),
          ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                //* Top Search bar
                child: TopBar(weatherModel.address, weatherBloc,
                    weatherModel.imageURL), //Topbar
              ),
              SizedBox(
                height: 20,
              ),
              //* Displayed information
              Container(
                child: WeatherInfo(
                    weatherModel.temperature,
                    weatherModel.summary,
                    weatherModel.forecast,
                    weatherModel.precip,
                    weatherModel.iconito),
              ), // Weather information
            ],
          )
        ],
      ),
    );
  }

  Color setColor(String? ic) {
    //Receive an icon to know which color to set as the default one
    switch (ic) {
      case 'clear-day':
        return Colors.orange.withOpacity(0.15);
      case 'clear-night':
        return Colors.grey.withOpacity(0.3);
      case 'cloudy':
        return Colors.grey.withOpacity(0.3);
      case 'fog':
        return Colors.grey.withOpacity(0.3);
      case 'partly-cloudy-day':
        return Colors.grey.withOpacity(0.3);
      case 'partly-cloudy-night':
        return Colors.grey.withOpacity(0.3);
      case 'rain':
        return Colors.blue.withOpacity(0.2);
      case 'sleet':
        return Colors.grey.withOpacity(0.3);
      case 'snow':
        return Colors.grey.withOpacity(0.3);
      case 'weird':
        return Colors.red.withOpacity(0.3);
      case 'wind':
        return Colors.grey.withOpacity(0.2);
      default:
        {
          return Colors.grey.withOpacity(0.3);
        }
    }
  }
}
