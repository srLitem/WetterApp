import 'package:the_wetter/model/weatherModel.dart';

abstract class WeatherState{}

class WeatherInitialState extends WeatherState{}

class WeatherLoadingState extends WeatherState{}

class WeatherShowState extends WeatherState{
  WeatherModel weatherModel;
  WeatherShowState(this.weatherModel);

  WeatherModel get weather => weatherModel;
}

class WeatherToSearchState extends WeatherState{}

class WeatherErrorState extends WeatherState{
  String message;
  WeatherErrorState(this.message);
}