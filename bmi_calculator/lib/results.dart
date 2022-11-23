// screen to displaye the results

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:html';

import 'package:flutter/material.dart';

import 'main.dart';

class Results extends StatelessWidget {
  const Results({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as List;
    final bmiResult = data[0];
    final resultText = data[1];
    final interpretation = data[2];

    return Scaffold(
      backgroundColor: Color.fromRGBO(15, 17, 32, 1),
      body: SafeArea(
          child: Column(children: [
        Container(
          color: Color.fromARGB(255, 24, 28, 51),
          padding: EdgeInsets.only(left: 20),
          height: MediaQuery.of(context).size.height * 0.1,
          child: Row(
            children: [
              Icon(
                Icons.menu,
                color: Colors.white,
              ),
              SizedBox(
                width: 40,
              ),
              Text(
                'BMI Calculator',
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            color: Color.fromARGB(255, 21, 24, 44),
            child: Column(
              children: [
                Text(
                  'Your Result',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      color: Color.fromARGB(255, 31, 36, 62),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            resultText.toString().toUpperCase(),
                            style: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 114, 162, 106),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            bmiResult.ceilToDouble().toString(),
                            style: TextStyle(
                              fontSize: 80,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 60,
                              right: 60,
                              top: 10,
                            ),
                            child: Text(
                              'Normal BMI range:',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 148, 147, 147),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 60,
                              right: 60,
                              top: 5,
                            ),
                            child: Text(
                              '18,5 - 25 kg/m2',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 50, right: 50, top: 10, bottom: 20),
                            child: Text(
                              interpretation.toString(),
                              style: TextStyle(
                                fontSize: 22,
                                color: Color.fromARGB(255, 255, 255, 255),
                                // text between the text
                                height: 1.5,
                              ),
                            ),
                          ),
                          Container(
                            color: Color.fromARGB(255, 26, 20, 46),
                            padding: EdgeInsets.all(20),
                            width: double.infinity / 5,
                            child: Center(
                              child: Text(
                                'Save Result',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ])),
      bottomNavigationBar: TextButton(
        child: BottomAppBar(
          color: Color.fromARGB(255, 203, 25, 13),
          child: Container(
            padding: EdgeInsets.all(10),
            height: 60.0,
            child: Center(
              child: Text(
                'Re -Calculate your BMI',
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
          // specify the next screen to go to after click
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeApp()));
        },
      ),
    );
  }
}
