import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

abstract class SearchRepo {
  Future<List> getList(String cityQ);
}

class SearchRepoImpl implements SearchRepo {
  List<String?> _places = [];
  String apiKey = dotenv.env['GAPI_KEY'] ?? "Invalid API";

  Future<List> getList(String cityQ) async {
    debugPrint('Searching API location for $cityQ');
    String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?key=$apiKey&input=$cityQ';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      for (int i = 0; i < jsonData['predictions'].length; i++) {
        _places.add(jsonData['predictions'][i]['description']);
      }
      return _places;
    } else
      throw Exception();
  }
}
