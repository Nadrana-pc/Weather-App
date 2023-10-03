
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:my_weather/UI/ui1.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: FlutterSplashScreen.gif(
            backgroundColor: Colors.white,
            gifPath: "assets/weather_giff.gif",
            gifWidth: double.infinity,
            gifHeight: double.infinity,
            defaultNextScreen: const Ui1(),
            duration: const Duration(milliseconds: 3000),
          ),
        ),
      ),
    );
  }
}
