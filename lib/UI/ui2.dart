import 'package:flutter/material.dart';
import 'package:my_weather/apiFunction.dart';
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
      return Scaffold(
          body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Country ',
                    style: TextStyle(
                        color: Color.fromARGB(255, 241, 188, 28),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const Text(
                    ':',
                    style: TextStyle(
                        color: Color.fromARGB(255, 241, 188, 28),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    weather.location.country.toString(),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 241, 188, 28),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Region ',
                    style: TextStyle(
                        color: Color.fromARGB(255, 241, 188, 28),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const Text(
                    ':',
                    style: TextStyle(
                        color: Color.fromARGB(255, 241, 188, 28),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    weather.location.region.toString(),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 241, 188, 28),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Feels like ',
                    style: TextStyle(
                        color: Color.fromARGB(255, 241, 188, 28),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const Text(
                    ':',
                    style: TextStyle(
                        color: Color.fromARGB(255, 241, 188, 28),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    weather.current.feelslikeC.toString(),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 241, 188, 28),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Wind direction',
                    style: TextStyle(
                        color: Color.fromARGB(255, 241, 188, 28),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const Text(
                    ':',
                    style: TextStyle(
                        color: Color.fromARGB(255, 241, 188, 28),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    weather.current.windDegree.toString(),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 241, 188, 28),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Cloud ',
                    style: TextStyle(
                        color: Color.fromARGB(255, 241, 188, 28),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const Text(
                    ':',
                    style: TextStyle(
                        color: Color.fromARGB(255, 241, 188, 28),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    weather.current.cloud.toString(),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 241, 188, 28),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Gust',
                    style: TextStyle(
                        color: Color.fromARGB(255, 241, 188, 28),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const Text(
                    ':',
                    style: TextStyle(
                        color: Color.fromARGB(255, 241, 188, 28),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    weather.current.gustKph.toString(),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 241, 188, 28),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Pressure',
                    style: TextStyle(
                        color: Color.fromARGB(255, 241, 188, 28),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const Text(
                    ':',
                    style: TextStyle(
                        color: Color.fromARGB(255, 241, 188, 28),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    weather.current.pressureIn.toString(),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 241, 188, 28),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              )
            ],
          ),
        ),
      ));
    }
  }
}
