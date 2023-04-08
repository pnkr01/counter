import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final TextEditingController regdNo = TextEditingController();
  final TextEditingController password = TextEditingController();
  tryLoggingThisUser() async {
    var response = await https.post(
        Uri.parse('http://115.240.101.71:8282/CampusPortalSOA/login'),
        body: json.encode({
          "username": regdNo.text,
          "password": password.text,
          "MemberType": "S"
        }));
    var decoded = jsonDecode(response.body);
    print(decoded);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(decoded["message"])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: regdNo,
              decoration:
                  const InputDecoration(hintText: 'Enter registration number'),
            ),
            TextField(
              obscureText: true,
              controller: password,
              decoration: const InputDecoration(hintText: 'Enter password'),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    tryLoggingThisUser();
                  },
                  child: const Text('Sign In')),
            )
          ],
        ),
      ),
    );
  }
}
