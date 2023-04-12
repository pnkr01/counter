import 'dart:convert';

import 'package:counter/src/global.dart';
import 'package:counter/src/model/attendence_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

class Attendencepage extends StatefulWidget {
  const Attendencepage({super.key});

  @override
  State<Attendencepage> createState() => _AttendencepageState();
}

class _AttendencepageState extends State<Attendencepage> {
  List<AttendenceModal> attendence = [];
  List<Color> color = [
    Colors.red,
    Colors.blue,
    Colors.pink,
    Colors.teal,
    Colors.purple,
  ];
  bool isLoading = true;
  @override
  void initState() {
    fetchAttedenceId();
    super.initState();
  }

  fetchAttedenceId() async {
    var response = await https.post(
      Uri.parse(
          'http://115.240.101.71:8282/CampusPortalSOA/studentSemester/lov'),
      headers: {
        'Cookie': 'JSESSIONID=${sharedPreferences.getString('cookie')}',
      },
    );
    var decode = jsonDecode(response.body);
    String attendenceid = decode["studentdata"][0]["REGISTRATIONID"];
    fetchAttendence(attendenceid);
  }

  fetchAttendence(String atId) async {
    var response = await https.post(
      Uri.parse('http://115.240.101.71:8282/CampusPortalSOA/attendanceinfo'),
      body: json.encode({"registerationid": atId}),
      headers: {
        'Cookie': 'JSESSIONID=${sharedPreferences.getString('cookie')}',
      },
    );
    var decode = jsonDecode(response.body);
    int len = decode["griddata"].length;
    for (int e = 0; e < len; e++) {
      attendence.add(AttendenceModal(
        latt: decode["griddata"][e]["Latt"],
        patt: decode["griddata"][e]["Patt"],
        subject: decode["griddata"][e]["subject"],
        totalAttandence: decode["griddata"][e]["TotalAttandence"],
      ));
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Attendence'),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: attendence.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(
                    bottom: 5,
                    top: 10,
                    left: 10,
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                      color: color[index],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Total attendence : ',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            attendence[index].totalAttandence.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Total Lect : ',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            attendence[index].latt.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Total Pract : ',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            attendence[index].patt.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Subject : ',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              attendence[index].subject.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
