// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:medical_app/screens/home.dart';
import 'package:medical_app/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Med',
      initialRoute: '/',
      // theme
      theme: ThemeData(
        primarySwatch: MaterialColor(
          Color.fromARGB(255, 50, 18, 125).value,
          <int, Color>{
            50: Color.fromRGBO(50, 18, 125, 0.1),
            100: Color.fromRGBO(50, 18, 125, 0.2),
            200: Color.fromRGBO(50, 18, 125, 0.3),
            300: Color.fromRGBO(50, 18, 125, 0.4),
            400: Color.fromRGBO(50, 18, 125, 0.5),
            500: Color.fromRGBO(50, 18, 125, 0.6),
            600: Color.fromRGBO(50, 18, 125, 0.7),
            700: Color.fromRGBO(50, 18, 125, 0.8),
            800: Color.fromRGBO(50, 18, 125, 0.9),
            900: Color.fromRGBO(50, 18, 125, 1),
          },
        ),
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => LoginPage(),

        // '/folder1': (context) => Folder1Screen(),
        // '/folder2': (context) => Folder2Screen(),
      },
    );
  }
}
