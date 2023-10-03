import 'package:flutter/material.dart';
import 'package:my_weather/animatedSplash.dart';
import 'package:my_weather/apiFunction.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ApiClass(), child: const WeatherClass()));
}

class WeatherClass extends StatelessWidget {
  const WeatherClass({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home:const  SplashScreen());
  }
}
