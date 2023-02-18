import 'package:flutter/material.dart';
import 'package:medical_app/screens/home.dart';

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
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => HomeScreen(),
        // '/folder1': (context) => Folder1Screen(),
        // '/folder2': (context) => Folder2Screen(),
      },
    );
  }
}
