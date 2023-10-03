import 'package:flutter/material.dart';
import 'package:my_weather/UI/ui2.dart';
import 'package:my_weather/apiFunction.dart';
import 'package:my_weather/dateFunction.dart';
import 'package:provider/provider.dart';
import 'package:my_weather/textEcontoller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Ui1 extends StatefulWidget {
  const Ui1({super.key});

  @override
  State<Ui1> createState() => _Ui1State();
}

class _Ui1State extends State<Ui1> {
  @override
  void initState() {
    super.initState();
    Provider.of<ApiClass>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final RefreshController refreshController =
        RefreshController(initialRefresh: false);

    void onRefresh() {
      Provider.of<ApiClass>(context, listen: false).fetchData();
      refreshController.refreshCompleted();
    }

    void onLoading() {
      refreshController.loadComplete();
    }

    final weatherprovider = Provider.of<ApiClass>(context);
    final weather = weatherprovider.weatherdata;

    // String cdate1 = DateFormat("EEEEE, MMMM, dd").format();

    if (weather == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
          body: SmartRefresher(
        onRefresh: onRefresh,
        onLoading: onLoading,
        controller: refreshController,
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 241, 188, 28),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 25),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: searchController,
                    )),
                    IconButton(
                        onPressed: () {
                          Provider.of<ApiClass>(context, listen: false)
                              .fetchData();
                        },
                        icon: const Icon(Icons.search)),
                    IconButton(
                      onPressed: () {
                        searchController.clear();
                        Provider.of<ApiClass>(context, listen: false)
                            .fetchData();
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          foregroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 241, 188, 28))),
                      icon: const Icon(Icons.gps_fixed),
                    )
                  ],
                ),
              ),
              Provider.of<ApiClass>(context, listen: true).isLoading == true
                  ? const CircularProgressIndicator()
                  : Column(
                      children: [
                        searchController.text.isEmpty
                            ? Center(
                                child: Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: Text(
                                  weather.location.name.toString(),
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ))
                            : Center(
                                child: Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text(
                                  weather.location.name,
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        Padding(
                          padding: const EdgeInsets.only(top: 13, bottom: 13),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(35)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 9, right: 9, top: 4, bottom: 4),
                              child: Text(
                                date!,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 241, 188, 28)),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          weather.current.condition.text,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            ' ${weather.current.tempC.toString()}°C',
                            style: const TextStyle(
                                fontSize: 60, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Column(
                            children: [
                              const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Daily Summary',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold))),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    'Now it feels like ${weather.current.feelslikeC.toString()} , actually ${weather.current.tempC.toString()}.',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'It feels ${weather.current.condition.text}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 25),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Icon(
                                        Icons.dehaze,
                                        color:
                                            Color.fromARGB(255, 241, 188, 28),
                                      ),
                                      Text(
                                        '${weather.current.windKph.toString()} kph',
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 241, 188, 28),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        'Wind',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color.fromARGB(
                                                255, 241, 188, 28)),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Icon(
                                        Icons.water_drop_outlined,
                                        color:
                                            Color.fromARGB(255, 241, 188, 28),
                                      ),
                                      Text(
                                        '${weather.current.humidity.toString()} %',
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 241, 188, 28),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text('Humidity',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color.fromARGB(
                                                  255, 241, 188, 28)))
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Icon(
                                        Icons.remove_red_eye_outlined,
                                        color:
                                            Color.fromARGB(255, 241, 188, 28),
                                      ),
                                      Text(
                                        '${weather.current.visKm.toString()} km',
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 241, 188, 28),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text('Visibility',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color.fromARGB(
                                                  255, 241, 188, 28)))
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ],
                    ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return const Ui2();
                      }));
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        foregroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 241, 188, 28))),
                    child: const Text('view more...')),
              ),
            ],
          ),
        ),
      ));
    }
  }
}
