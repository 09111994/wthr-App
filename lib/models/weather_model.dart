import 'dart:convert';

class weather{
  final String cityname;
  final String description;
  final double windspeed;
  final double temperature;
  final int humidity;
  final int sunrise;
  final int sunset;


  weather ({
    required this.cityname,
    required this.description,
    required this.humidity,
    required this.sunrise,
    required this.sunset,
    required this.temperature,
    required this.windspeed,});

  factory weather.fromJson(Map<String , dynamic> json){
    return weather(
        cityname: json['name'],
        description: json['weather'][0]['description'],
        humidity: json['main']['humidity'],
        sunrise: json['sys']['sunrise'],
        sunset: json['sys']['sunset'],

        temperature: (json['main']['temp']as num).toDouble()-273.15,
        windspeed: (json['wind']['speed']as num).toDouble(),
    );
  }

}