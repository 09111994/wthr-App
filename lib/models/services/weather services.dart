import 'dart:convert';

import '../weather_model.dart';
import 'package:http/http.dart'as http;

class weatherservices{

  final String apikey = "72e7d9cbcfbb2f5dc05cf9a7020d85aa";

  Future<weather> fetchweather (String cityname)async{
    final url = Uri.parse
      ("https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apikey");

    final response = await http.get(url);


    if(response.statusCode == 200){
      return weather.fromJson(jsonDecode(response.body));
    }else(
    throw Exception("failed to load weather data")
    );

  }
}