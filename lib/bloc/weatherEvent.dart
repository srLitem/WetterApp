abstract class WeatherEvent{}

class FetchData extends WeatherEvent{
  String city;

  FetchData(this.city);
}
