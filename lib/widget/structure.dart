import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_wetter/bloc/weatherBloc.dart';
import 'package:the_wetter/bloc/weatherEvent.dart';
import 'package:the_wetter/bloc/weatherState.dart';
import 'package:the_wetter/model/weatherModel.dart';
import 'package:the_wetter/widget/screens/searchPage/searchPage.dart';
import 'package:the_wetter/widget/screens/weatherPage/weatherPage.dart';
import 'package:the_wetter/widget/screens/errorPage/errorPage.dart';

import 'generic/wetterLogo.dart';

class Structure extends StatefulWidget {
  @override
  _StructureState createState() => _StructureState();
}

class _StructureState extends State<Structure> {
  WeatherBloc? weatherBloc;

  @override
  void initState() {
    super.initState();
    weatherBloc = BlocProvider.of<WeatherBloc>(context);
    weatherBloc!.add(LoadData());
    weatherBloc!.add(FetchData('Amsterdam'));
  }

  @override
  Widget build(BuildContext context) {
    String? imgBack;
    return Scaffold(body: Container(
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherShowState) {
            imgBack = state.weather.imageURL;
            return buildWeather(state.weather);
          } else if (state is WeatherToSearchState) {
            return buildSearch(imgBack);
          } else if (state is WeatherErrorState) {
            return buildError(state.message);
          } else {
            return buildLogo();
          }
        },
      ),
    ));
  }

  Widget buildWeather(WeatherModel wm) {
    return WeatherPage(wm, weatherBloc);
  }

  Widget buildSearch(String? imgURL) {
    return SearchPage(Colors.white70, weatherBloc, imgURL);
  }

  Widget buildLogo() {
    return WetterLogo();
  }

  Widget buildError(String message) {
    return ErrorPage(message);
  }
}
