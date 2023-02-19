import 'package:flutter/material.dart';

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
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: height * 0.08,
                  width: width * 0.30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 71, 40, 173),
                  ),
                  // onPressed: () {},
                  child: Center(
                      child: Text(
                    'Upcoming',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
                ),
                Container(
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
                      fontSize: 18,
                    ),
                  )),
                ),
                Container(
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
                        fontSize: 18),
                  )),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildVisitCard(
                      doctorName: 'Dr. Smith',
                      specialty: 'Cardiology',
                      date: 'Feb 23, 2023',
                      time: '10:00 AM',
                      status: 'Confirmed',
                    ),
                    _buildVisitCard(
                      doctorName: 'Dr. Johnson',
                      specialty: 'Dentistry',
                      date: 'Mar 05, 2023',
                      time: '2:30 PM',
                      status: 'Confirmed',
                    ),
                    _buildVisitCard(
                      doctorName: 'Dr. Brown',
                      specialty: 'Ophthalmology',
                      date: 'Mar 15, 2023',
                      time: '9:00 AM',
                      status: 'Rescheduled',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVisitCard({
    required String doctorName,
    required String specialty,
    required String date,
    required String time,
    required String status,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(20),
      //     color: Colors.white,
      //     boxShadow: [
      //       BoxShadow(
      //         color: Color.fromARGB(255, 234, 234, 234).withOpacity(0.5),
      //         spreadRadius: 5,
      //         blurRadius: 7,
      //         offset: const Offset(0, 3), // changes position of shadow
      //       ),
      //     ]),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
              title: Text(doctorName),
              subtitle: Text(specialty),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.calendar_today),
                  SizedBox(width: 8),
                  Text(date),
                  SizedBox(width: 16),
                  Icon(Icons.access_time),
                  SizedBox(width: 8),
                  Text(time),
                  Spacer(),
                  Text(status),
                ],
              ),
            ),
            ButtonBar(
              children: [
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 230, 228, 234),
                  ),
                  // onPressed: () {},
                  child: Center(
                      child: Text(
                    'Cancel',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )),
                ),
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 71, 40, 173),
                  ),
                  // onPressed: () {},
                  child: Center(
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
