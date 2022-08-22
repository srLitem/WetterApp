abstract class WeatherEvent {}

class FetchData extends WeatherEvent {
  String city;

  FetchData(this.city);
}

class LoadData extends WeatherEvent {
  LoadData();
}
