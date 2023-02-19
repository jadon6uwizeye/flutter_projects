// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:medical_app/commons/doctors.dart';
import 'package:medical_app/screens/schedule.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // height as the height of the screen considering safearea
    final height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    // width of the screen considering the safearea
    final width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.left -
        MediaQuery.of(context).padding.right;
    return SafeArea(
      // ignore: sort_child_properties_last
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            color: Color.fromARGB(255, 250, 250, 248),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Elsie Adkins 👋',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CircleAvatar(
                    radius: 30,
                    child: Image(
                      image: const AssetImage("assets/images/avatar.png"),
                      width: width * 0.2,
                      height: height * 0.2,
                    ),
                  )
                  // CircleAvatar(
                  //   radius: 30,
                  //   backgroundImage: AssetImage('assets/images/avatar.png',
                  //   // configure the sizes
                  //   ),
                  // ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      width: width * 0.4,
                      height: height * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 70, 93, 224),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.health_and_safety_sharp,
                            color: Colors.white,
                            // change the size
                            size: 50,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          const Text(
                            'Clinic Visit',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          const Text(
                            'Make an appointment',
                            style: TextStyle(
                              color: Color.fromRGBO(210, 210, 219, 1),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      width: width * 0.4,
                      height: height * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.home_outlined,
                            color: Color.fromARGB(255, 71, 91, 205),
                            // change the size
                            size: 50,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          const Text(
                            'Home Visit',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          const Text(
                            'Call a doctor home',
                            style: TextStyle(
                              color: Color.fromRGBO(210, 210, 219, 1),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Text(
                "What are your Symptoms ?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              // a row of small containers of emoji
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      width: width * 0.4,
                      height: height * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 237, 241, 255),
                      ),
                      child: const Text(
                        '🤒  Temperature',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.02),
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      width: width * 0.3,
                      height: height * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 237, 241, 255),
                      ),
                      child: const Text(
                        '🤧  Snuffle',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.02),
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      width: width * 0.4,
                      height: height * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 237, 241, 255),
                      ),
                      child: const Text(
                        '🤕 headeache',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.02),
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      width: width * 0.4,
                      height: height * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 237, 241, 255),
                      ),
                      child: const Text(
                        '🤒  Temperature',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.02),
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      width: width * 0.4,
                      height: height * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 237, 241, 255),
                      ),
                      child: const Text(
                        '🤮  Vomiting',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Text(
                "Popular doctors",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SingleChildScrollView(
                  // a column with two columns in a row with cards
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            // two cards with image avatar name, specialty and star rating
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                CardComponent(
                                    title: "Dr. Chriss frazzier",
                                    subtitle: "Therapist",
                                    image:
                                        AssetImage('assets/images/avatar.png'),
                                    rating: 5),
                                SizedBox(
                                  width: width * 0.05,
                                ),
                                CardComponent(
                                    title: "Dr. Chriss John",
                                    subtitle: "pediatrician",
                                    image:
                                        AssetImage('assets/images/avatar.png'),
                                    rating: 5),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                CardComponent(
                                    title: "Dr. john Doe",
                                    subtitle: "Gyncologist",
                                    image:
                                        AssetImage('assets/images/avatar.png'),
                                    rating: 5),
                                SizedBox(
                                  width: width * 0.05,
                                ),
                                CardComponent(
                                    title: "John Stones",
                                    subtitle: "doctor",
                                    image:
                                        AssetImage('assets/images/avatar.png'),
                                    rating: 5),
                              ],
                            ),
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                CardComponent(
                                    title: "Dr. Chriss frazzier",
                                    subtitle: "Specialist",
                                    image:
                                        AssetImage('assets/images/avatar.png'),
                                    rating: 5),
                                SizedBox(
                                  width: width * 0.05,
                                ),
                                CardComponent(
                                    title: "Dr. Chriss frazzier",
                                    subtitle: "Pediatrician",
                                    image:
                                        AssetImage('assets/images/avatar.png'),
                                    rating: 5),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ))
            ]),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Material(
            elevation: 0.0,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(20),
            )),
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (value) => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScheduleScreen())),
                // ignore: prefer_const_literals_to_create_immutables
                items: [
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.message),
                    label: 'Messages',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_month_outlined),
                    label: 'Schedule',
                  ),
                  const BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
