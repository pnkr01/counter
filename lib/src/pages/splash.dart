import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final TextEditingController regdNo = TextEditingController();
  final TextEditingController password = TextEditingController();
  // tryLoggingThisUser() async {
  //   var response = await https.post(
  //       Uri.parse('http://115.240.101.71:8282/CampusPortalSOA/login'),
  //       body: json.encode({
  //         "username": regdNo.text,
  //         "password": password.text,
  //         "MemberType": "S"
  //       }));
  //   var decoded = jsonDecode(response.body);
  //   print(decoded);

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            child: Column(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Access your account',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Enter Registraton Number",
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Sign In'),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text('sign in with'),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
