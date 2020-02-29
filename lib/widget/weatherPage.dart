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
          Background(setColor(weatherModel.iconito), weatherModel.imageURL),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints){
              if(constraints.maxHeight<800){
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 50,
                      ),
                      child: TopBar(weatherModel.address, weatherBloc, weatherModel.imageURL), //Topbar
                    ), // Padding for the Topbar
                    Container(
                      child: WeatherInfo(
                          weatherModel.temperature,
                          weatherModel.summary,
                          weatherModel.forecast,
                          weatherModel.precip,
                          weatherModel.iconito),
                    ),// Weather information
                  ],
                );
              }else {
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 50,
                      ),
                      child: TopBar(weatherModel.address, weatherBloc, weatherModel.imageURL), //Topbar
                    ), // Padding for the Topbar
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 230,
                      ),
                      child: WeatherInfo(
                          weatherModel.temperature,
                          weatherModel.summary,
                          weatherModel.forecast,
                          weatherModel.precip,
                          weatherModel.iconito),
                    ),// Weather information
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Color setColor(String ic){ //Receive an icon to know which color to set as the default one
    switch (ic){
      case 'clear-day':
        return Colors.orange.withOpacity(0.15);
        break;
      case 'clear-night':
        return Colors.grey.withOpacity(0.3);
        break;
      case 'cloudy':
        return Colors.grey.withOpacity(0.3);
        break;
      case 'fog':
        return Colors.grey.withOpacity(0.3);
        break;
      case 'partly-cloudy-day':
        return Colors.grey.withOpacity(0.3);
        break;
      case 'partly-cloudy-night':
        return Colors.grey.withOpacity(0.3);
        break;
      case 'rain':
        return Colors.blue.withOpacity(0.2);
        break;
      case 'sleet':
        return Colors.grey.withOpacity(0.3);
        break;
      case 'snow':
        return Colors.grey.withOpacity(0.3);
        break;
      case 'weird':
        return Colors.red.withOpacity(0.3);
        break;
      case 'wind':
        return Colors.grey.withOpacity(0.2);
        break;

    }

  }
}