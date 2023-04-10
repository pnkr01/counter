import 'dart:convert';

import 'package:counter/src/global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  late String name;
  late String regdNo;

  @override
  void initState() {
    fetchStudentInfo();
    super.initState();
  }

  // late Student student;

  fetchStudentInfo() async {
    try {
      var response = await https.post(
          Uri.parse('http://115.240.101.71:8282//CampusPortalSOA/studentinfo'),
          headers: {
            "Cookie": "JSESSIONID=${sharedPreferences.getString('cookie')}"
          });
      print(response.body);
      var decoded = jsonDecode(response.body);
      
      setState(() {
        name = decoded["detail"][0]["name"];
        regdNo = decoded["detail"][0]["enrollmentno"];
        isLoading = false;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Align(
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.red,
                    ),
                  ),
                  Text(name.toString()),
                  Text(regdNo.toString()),
                  // Text(student.email.toString()),
                  // Text(student.dob.toString()),
                ],
              ),
            ),
    );
  }
}
