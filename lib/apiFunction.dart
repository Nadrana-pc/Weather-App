import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_weather/controller/locationController.dart';
import 'package:my_weather/dataModel.dart';
import 'package:my_weather/textEcontoller.dart';
import 'textEcontoller.dart';

class ApiClass with ChangeNotifier {
  WeatherDataModel? _weatherDataModel;
  WeatherDataModel? get weatherdata => _weatherDataModel;
  bool isLoading = true;
  Future<void> fetchData() async {
    var geoData;

    LocationProvider locationProvider = LocationProvider();
    isLoading = true;
    await locationProvider.getLocation();
    if (searchController.text.isEmpty) {
      geoData = '${locationProvider.latitude},${locationProvider.longitute}';
    } else {
      geoData = searchController.text;
    }
    print(geoData);
    var url = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?q=$geoData&key=4c587979de58442798e45943231906');
    print(locationProvider.latitude);
    print(locationProvider.longitute);
    var responce = await http.get(url);
    if (responce.statusCode == 200) {
      final jsondata = jsonDecode(responce.body);
      print(jsondata);
      _weatherDataModel = WeatherDataModel.fromJson(jsondata);
      isLoading = false;
      notifyListeners();
    } else {
      throw Exception("ERROR!!!");
    }
  }
}
