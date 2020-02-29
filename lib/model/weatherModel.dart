class WeatherModel{
  var summary;
  var temperature;
  var forecast;
  var address;
  var iconito;
  var precip;
  var imageURL;
  var location;

  WeatherModel(
      this.summary,
      this.temperature,
      this.forecast,
      this.address,
      this.iconito,
      this.precip,
      this.imageURL,
      this.location,
      );

  factory WeatherModel.fromJson(Map<String, dynamic> jsonData){
    return WeatherModel(
        jsonData['summary'],
        jsonData['temperature'],
        jsonData['forecast'],
        jsonData['address'],
        jsonData['iconito'],
        jsonData['precipnum'],
        jsonData['imageURL'],
        jsonData['location'],

    );

  }

}