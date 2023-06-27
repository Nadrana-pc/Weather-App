import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:my_weather/apiFunction.dart';
import 'package:provider/provider.dart';
import 'UI/ui1.dart';

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
      home: Scaffold(
        body: Center(
          child: AnimatedSplashScreen(
              duration: 1500,
              splash: const Icon(Icons.sunny_snowing),
              splashTransition: SplashTransition.fadeTransition,
              nextScreen: Ui1()),
        ),
      ),
    );
  }
}
