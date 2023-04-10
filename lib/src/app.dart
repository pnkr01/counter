import 'package:counter/src/global.dart';
import 'package:counter/src/pages/home/home.dart';
import 'package:counter/src/pages/splash.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: sharedPreferences.getBool('isLoggedIn') != null
          ? const HomePage()
          : const SplashScreen(),
    );
  }
}
