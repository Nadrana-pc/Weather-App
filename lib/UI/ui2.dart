import 'package:flutter/material.dart';
import 'package:my_weather/apiFunction.dart';
import 'package:my_weather/dataModel.dart';
import 'package:provider/provider.dart';

class Ui2 extends StatefulWidget {
  const Ui2({super.key});

  @override
  State<Ui2> createState() => _Ui2State();
}

class _Ui2State extends State<Ui2> {
  @override
  void initState() {
    Provider.of<ApiClass>(context, listen: false).fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<ApiClass>(context);
    final weather = weatherProvider.weatherdata;
    if (weather == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return SafeArea(
        child: Scaffold(
            body: Container(
          color: const Color.fromARGB(255, 241, 188, 28),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                containerWidget(
                    weather, 'Country', weather.location.country.toString()),
                containerWidget(
                  weather,
                  'Region',
                  weather.location.region.toString(),
                ),
                containerWidget(
                  weather,
                  'Feels like ',
                  '${weather.current.feelslikeC.toString()}°C',
                ),
                containerWidget(
                  weather,
                  'Wind',
                  '${weather.current.windKph.toString()}Kph',
                ),
                containerWidget(
                  weather,
                  'Cloud',
                  weather.current.cloud.toString(),
                ),
                containerWidget(
                  weather,
                  'Gust',
                  ' ${weather.current.gustKph.toString()}Kph',
                ),
                containerWidget(
                  weather,
                  'Pressure',
                  "${weather.current.pressureMb.toString()}Mp",
                )
              ],
            ),
          ),
        )),
      );
    }
  }

  Expanded containerWidget(
      WeatherDataModel weather, String value1, String value2) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value1,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 241, 188, 28),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  value2,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 241, 188, 28),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
