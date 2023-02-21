// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:medical_app/screens/home.dart';

class ScheduleScreen extends StatelessWidget {
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
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 246, 246, 249),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, bottom: 10, top: 10),
              child: const Text(
                "Schedule",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  height: height * 0.08,
                  width: width * 0.30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 63, 22, 186),
                  ),
                  // onPressed: () {},
                  child: Center(
                      child: Text(
                    'Upcoming',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.05,
                    ),
                  )),
                ),
                Container(
                  padding: EdgeInsets.all(2),
                  height: height * 0.08,
                  width: width * 0.30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 225, 224, 227)),
                  // onPressed: () {},
                  child: Center(
                      child: Text(
                    'Completed',
                    style: TextStyle(
                      color: Color.fromARGB(255, 108, 106, 112),
                      fontSize: width * 0.05,
                    ),
                  )),
                ),
                Container(
                  padding: EdgeInsets.all(2),
                  height: height * 0.08,
                  width: width * 0.30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 225, 224, 227)),
                  // onPressed: () {},
                  child: Center(
                      child: Text(
                    'Cancelled',
                    style: TextStyle(
                        color: Color.fromARGB(255, 108, 106, 112),
                        fontSize: width * 0.05),
                  )),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        bottom: 5,
                        top: 10,
                      ),
                      child: Text(
                        "Nearest Visit",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    _buildVisitCard(
                      context: context,
                      doctorName: 'Dr. Smith',
                      specialty: 'Cardiology',
                      date: 'Feb 23, 2023',
                      time: '10:00 AM',
                      status: 'Confirmed',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        bottom: 5,
                        top: 10,
                      ),
                      child: Text(
                        "Future Visits",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    _buildVisitCard(
                      context: context,
                      doctorName: 'Dr. Johnson',
                      specialty: 'Dentistry',
                      date: 'Mar 05, 2023',
                      time: '2:30 PM',
                      status: 'Confirmed',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        bottom: 5,
                        top: 10,
                      ),
                      child: Text(
                        "Past Visits",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    _buildVisitCard(
                      context: context,
                      doctorName: 'Dr. Brown',
                      specialty: 'Ophthalmology',
                      date: 'Mar 15, 2023',
                      time: '9:00 AM',
                      status: 'Confirmed',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 75,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 35, 35, 112),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.5),
            //     spreadRadius: 5,
            //     blurRadius: 7,
            //     offset: const Offset(0, 3), // changes position of shadow
            //   ),
            // ],
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
                currentIndex: 2,
                unselectedItemColor: Color.fromARGB(255, 165, 167, 186),
                onTap: (value) {
                  if (value == 2) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScheduleScreen()));
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }
                },
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
                    icon: Icon(Icons.calendar_month),
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

  Widget _buildVisitCard({
    required context,
    required String doctorName,
    required String specialty,
    required String date,
    required String time,
    required String status,
  }) {
    // height as the height of the screen considering safearea
    final height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    // width of the screen considering the safearea
    final width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.left -
        MediaQuery.of(context).padding.right;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            // ListTile(
            //   leading: CircleAvatar(
            //     backgroundImage: AssetImage('assets/images/avatar.png'),
            //   ),
            //   title: Text("doctorName"),
            //   subtitle: Text("specialty"),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctorName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        specialty,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  children: [
                    SizedBox(width: width * 0.03),
                    Icon(
                      Icons.calendar_today,
                      color: Colors.grey,
                    ),
                    Text(date),
                    Spacer(),
                    Icon(Icons.access_time, color: Colors.grey),
                    Text(time),
                    Spacer(),
                    SizedBox(width: width * 0.03),

                    // if condition here
                  ],
                ),
              ),
            ),
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 18,
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              status,
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 1,
                fontSize: 16,
              ),
            ),

            ButtonBar(
              children: [
                Container(
                  height: height * 0.08,
                  width: width * 0.35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 230, 228, 234),
                  ),
                  // onPressed: () {},
                  child: const Center(
                      child: Text(
                    'Cancel',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )),
                ),
                Container(
                  padding: EdgeInsets.all(2),
                  height: height * 0.08,
                  width: width * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 63, 22, 186),
                  ),
                  // onPressed: () {},
                  child: const Center(
                      child: Text(
                    'Reschedule',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
