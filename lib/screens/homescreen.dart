import 'package:flutter/material.dart';
import 'package:weather_ap/models/services/weather%20services.dart';
import 'package:weather_ap/models/weather_model.dart';
import 'package:weather_ap/widgets/weather%20card.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final _weatherservices = weatherservices();

  final TextEditingController _controller = TextEditingController();

  bool _isloading = false;
  weather? _weather;

  void getweather() async {
    setState(() {
      _isloading = true;
    });

    try {
      final _weather = await _weatherservices.fetchweather(_controller.text);
      setState(() {
        this._weather = _weather;
        _isloading = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error fetching weather data")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: _weather != null &&
                    _weather!.description.toLowerCase().contains('rain')
                ? const LinearGradient(
                    colors: [Colors.grey, Colors.blueGrey],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                : _weather != null &&
                        _weather!.description.toLowerCase().contains('clear')
                    ? const LinearGradient(
                        colors: [Colors.orangeAccent, Colors.blueAccent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                    : const LinearGradient(
                        colors: [Colors.orangeAccent, Colors.lightBlueAccent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Weather App",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: _controller,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Enter Your City Name",
                    hintStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: const Color.fromARGB(110, 255, 255, 255),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: getweather,
                  child: Text(
                    "Get Weather",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(209, 125, 155, 170),
                    foregroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                if (_isloading)
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                if (_weather != null) weathercard(Weather: _weather!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
