// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bmi_calculator/results.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _MyAppState();
}

class _MyAppState extends State<HomeApp> {
  double height = 170;
  double weight = 60;
  double age = 20;
  String gender = 'M';

  double bmiResult = 0.0;

  double calculateBMI(double height, double weight) {
    height = height / 100;
    return (weight / (height * height));
  }

  String resultText = '';

  String getResults(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'Normal';
    } else if (bmi >= 25 && bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  String interpretation = '';

  String getInterpretation(bmiResult) {
    if (bmiResult < 18.5) {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    } else if (bmiResult >= 18.5 && bmiResult < 25) {
      return 'You have a normal body weight. Good job!';
    } else if (bmiResult >= 25 && bmiResult < 30) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else {
      return 'You have a very high body weight. You should see a doctor.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(15, 17, 32, 1),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Container(
                  color: Color.fromARGB(255, 21, 24, 44),
                  padding: EdgeInsets.all(20),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          child: Container(
                            // set width according to screen size considering padding, margin and safe area
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 21, 24, 44),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // male Icon
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.male,
                                  color: gender == 'M'
                                      ? Colors.white
                                      : Color.fromARGB(255, 143, 142, 142),
                                  size: 60,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Male',
                                    style: TextStyle(
                                      color: gender == 'M'
                                          ? Colors.white
                                          : Color.fromARGB(255, 143, 142, 142),
                                      fontSize: 20,
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              gender = 'M';
                            });
                          }),
                      TextButton(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width / 2.5,
                          height: MediaQuery.of(context).size.height / 3.5,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 21, 24, 44),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.female,
                                color: gender == 'F'
                                    ? Colors.white
                                    : Color.fromARGB(255, 143, 142, 142),
                                size: 60,
                              ),
                              SizedBox(height: 10),
                              Text('Female',
                                  style: TextStyle(
                                      color: gender == 'F'
                                          ? Colors.white
                                          : Color.fromARGB(255, 143, 142, 142),
                                      fontSize: 20))
                            ],
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            gender = 'F';
                          });
                        },
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 19, 23, 41),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Text(
                            'Height',
                            style: TextStyle(
                              color: Color.fromARGB(255, 143, 142, 142),
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                height.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                ),
                              ),
                              Text(
                                'cm',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 143, 142, 142),
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Slider(
                            // vaalue is height rounded to 2 decimal places
                            value: height.roundToDouble(),
                            min: 0,
                            max: 300,
                            activeColor: Colors.white,
                            inactiveColor: Color.fromARGB(255, 143, 142, 142),
                            onChanged: (double newValue) {
                              setState(() {
                                // update the height with the new value to the mearest two decimal places
                                height = newValue.roundToDouble();
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 4.5,
                        // width: MediaQuery.of(context).size.width / 1.8,
                        padding: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 21, 24, 44),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Weight',
                              style: TextStyle(
                                color: Color.fromARGB(255, 143, 142, 142),
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              weight.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 21, 24, 44),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextButton(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 30, 35, 66),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.remove,
                                          color: Color.fromARGB(
                                              255, 182, 182, 182),
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                TextButton(
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 30, 35, 66),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Color.fromARGB(255, 182, 182, 182),
                                      size: 20,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 4.5,
                        // width: MediaQuery.of(context).size.width / 1.8,
                        padding: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 21, 24, 44),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Age',
                              style: TextStyle(
                                color: Color.fromARGB(255, 143, 142, 142),
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              age.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 21, 24, 44),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextButton(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 30, 35, 66),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.remove,
                                          color: Color.fromARGB(
                                              255, 182, 182, 182),
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                TextButton(
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 30, 35, 66),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Color.fromARGB(255, 158, 158, 158),
                                      size: 20,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // bootom bar
        bottomNavigationBar: TextButton(
          child: BottomAppBar(
            color: Color.fromARGB(255, 203, 25, 13),
            child: SizedBox(
              height: 50.0,
              child: Center(
                child: Text(
                  'Calculate BMI',
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Results(),
                settings: RouteSettings(
                  arguments: [
                    bmiResult = calculateBMI(height, weight),
                    getResults(bmiResult),
                    getInterpretation(bmiResult),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
