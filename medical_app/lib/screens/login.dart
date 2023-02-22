// import 'package:awesome/advanced/responsive.dart';
// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/helpers/http_request.dart';
import 'package:medical_app/screens/home.dart';
import 'package:medical_app/screens/signup.dart';
import 'package:medical_app/widgets/loader.dart';
import 'package:medical_app/widgets/toast.dart';

// import 'map/map.dart';

TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

login(BuildContext context) async {
  showLoader(context);
  try {
    var auth = await sendHttpRequest(
        Uri.parse(
            'https://medicalbackend-production-3b22.up.railway.app/login/'),
        method: 'post',
        data: {
          "username": username.text,
          "password": password.text,
        });

    if (auth.statusCode == 200) {
      Navigator.of(context).pop();
      showToast(context, "Logged In successfully");
      Navigator.of(context).pushNamed('/home');
    } else {
      Navigator.of(context).pop();
      showToast(context, "${auth.body}");
    }
  } catch (err) {
    Navigator.of(context).pop();
    showToast(context, "${err}");
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 242, 244),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: height * 0.08,
              left: width * 0.05,
              right: width * 0.05,
              bottom: height * 0.05),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.android,
                    size: 100, color: Color.fromARGB(255, 63, 22, 186)),
                const SizedBox(
                  height: 80,
                ),
                Text(
                  "HELLO AGAIN",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 17, 18, 23),
                  ),
                ),
                const SizedBox(height: 5),
                const Text("Welcome back you've been missed"),
                const SizedBox(height: 35),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: username,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: "Username",
                      // filled: true,
                      // fillColor: Color.fromARGB(255, 254, 254, 255),
                      labelStyle:
                          TextStyle(fontSize: 12, fontFamily: 'Sans Serif'),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: TextField(
                      controller: password,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: "password",
                        labelStyle:
                            TextStyle(fontSize: 12, fontFamily: 'Sans Serif'),
                      )),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  onPressed: () {
                    login(context);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const HomeScreen()));
                  },
                  child: Container(
                    height: 40,
                    width: 260,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 63, 22, 186),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Center(
                      child: Text(
                        "Sign in",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sans Serif'),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    child: const Text("Sign up",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 63, 22, 186),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Sans Serif')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
