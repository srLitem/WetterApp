import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:the_wetter/model/weatherModel.dart';

abstract class WeatherRepo {
  Future<WeatherModel> getData(String city);
}

class WeatherRepoImpl implements WeatherRepo{

  Future<WeatherModel> getData(String city) async{
    String apiUrl = 'http://litem-weather-webapp.herokuapp.com/weather?address=$city';
    debugPrint(apiUrl);
    http.Response response = await http.get(apiUrl);
    if(response.statusCode ==200) {
      var jsonData = json.decode(response.body);
      debugPrint(response.body);
      return WeatherModel.fromJson(jsonData);
    } else{
      throw Exception();
    }
  }

}