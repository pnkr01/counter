import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
          child: Text(
        'Sending Data',
        style: TextStyle(fontSize: 45,color: Colors.pink,fontWeight: FontWeight.w900,),
      )),
    );
  }
}
