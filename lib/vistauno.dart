
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:splash/iniciar_sesion.dart';

void main() {
  runApp(const vistauno());
}

class vistauno extends StatelessWidget {
  const vistauno({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      AnimatedSplashScreen(
      splash:Lottie.asset('imagenes/logoF.json'),
      nextScreen: listados(),
      duration: 4000,
      splashIconSize: 300,
      splashTransition: SplashTransition.rotationTransition,
    );
  }
}