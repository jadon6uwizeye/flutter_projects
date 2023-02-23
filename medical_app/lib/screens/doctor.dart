// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medical_app/helpers/http_request.dart';
import 'package:medical_app/screens/schedule.dart';

class DoctorDetailsScreen extends StatefulWidget {
  final String id;
  const DoctorDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  Future<dynamic> _doctor = Future.value([{}]);

// initiate state
  @override
  void initState() {
    super.initState();
    _fetch_doctor(widget.id);
  }

  _fetch_doctor(id) async {
    // fetch doctor from the api like this https://medicalbackend-production-3b22.up.railway.app/account/user_details/?id=425dc92b-1ace-4f07-b596-5b422d68b1f3
    // and return the json response
    var res = await sendHttpRequest(
      Uri.parse(
          "https://medicalbackend-production-3b22.up.railway.app/account/user_details/?id=$id"),
    );
    print(res.body);

    if (res.statusCode == 200) {
      setState(() {
        _doctor = json.decode(res.body);
      });
    } else {
      print("failed");
    }
  }

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
    return FutureBuilder<List<String>>(
        future: _fetch_doctor(widget.id),
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: Container(
                padding: EdgeInsets.only(top: height * 0.03),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 63, 22, 186),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 16, bottom: 24, top: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: width / 6,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 28.0),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/avatar.png'),
                                  radius: 32,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Text(
                                _doctor['full_name'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Text(
                                _doctor['specialist'],
                                style: TextStyle(
                                  color: Color.fromARGB(255, 202, 200, 205),
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 30),
                                    height: height * 0.06,
                                    width: width * 0.1,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color:
                                            Color.fromARGB(255, 164, 152, 176)),
                                    child: Icon(
                                      Icons.call,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    height: height * 0.06,
                                    width: width * 0.1,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color:
                                            Color.fromARGB(255, 164, 152, 176)),
                                    child: Icon(
                                      Icons.call,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 245, 245, 249),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(height: 10),
                              const Text(
                                'About Doctor',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                _doctor['about'],
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'sans serrif',
                                    // fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 18),
                              Row(
                                children: [
                                  Text(
                                    'Reviews',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Icon(Icons.star,
                                      color: Color.fromARGB(255, 230, 138, 18)),
                                  SizedBox(width: 8),
                                  Text(
                                    _doctor['doctor_rate'].toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    '(124)',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  // add se all button text
                                ],
                              ),
                              const SizedBox(height: 8),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Container(
                                      width: width * 0.7,
                                      padding: EdgeInsets.all(16),
                                      margin: EdgeInsets.only(right: 16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 18,
                                                backgroundImage: AssetImage(
                                                    'assets/images/avatar.png'),
                                              ),
                                              SizedBox(width: 12),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: const [
                                                  Text(
                                                    "Joana perkins",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    "1 day ago",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 14),
                                          Text(
                                            "Thanks to Dr. Viola Dunn! she is proffesional,competent doctor, ...",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.7,
                                      padding: EdgeInsets.all(16),
                                      margin: EdgeInsets.only(right: 16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 18,
                                                backgroundImage: AssetImage(
                                                    'assets/images/avatar.png'),
                                              ),
                                              SizedBox(width: 12),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: const [
                                                  Text(
                                                    "Joana perkins",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    "1 day ago",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 14),
                                          Text(
                                            "Thanks to Dr. Viola Dunn! she is proffesional,competent doctor, ...",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.6,
                                      padding: EdgeInsets.all(16),
                                      margin: EdgeInsets.only(right: 16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 18,
                                                backgroundImage: AssetImage(
                                                    'assets/images/avatar.png'),
                                              ),
                                              SizedBox(width: 12),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: const [
                                                  Text(
                                                    "Joana perkins",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    "1 day ago",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 14),
                                          Text(
                                            "Having no clue what specialist you need to consult with? No problem! Just point out your symptoms.",
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.6,
                                      padding: EdgeInsets.all(16),
                                      margin: EdgeInsets.only(right: 16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 18,
                                                backgroundImage: AssetImage(
                                                    'assets/images/avatar.png'),
                                              ),
                                              SizedBox(width: 12),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: const [
                                                  Text(
                                                    "Joana perkins",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    "1 day ago",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 14),
                                          Text(
                                            "Having no clue what specialist you need to consult with? No problem! Just point out your symptoms.",
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 18),
                              const Text(
                                'Location',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Container(
                                    width: width * 0.1,
                                    height: height * 0.06,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color:
                                            Color.fromARGB(255, 224, 219, 229)),
                                    child: Icon(
                                      Icons.location_on,
                                      // size: 14,
                                      color: Color.fromARGB(255, 77, 26, 172),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.05,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Lotus Medical Center',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        '123 Main Street, Suite 200 New York, NY 10001',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Consultation Price',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color:
                                            Color.fromARGB(255, 135, 134, 134)),
                                  ),
                                  SizedBox(height: 8),
                                  Text("\$52",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      )),
                                ],
                              ),
                              // book appointment button
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ScheduleScreen()));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  height: height * 0.07,
                                  width: width * 1,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromARGB(255, 63, 22, 186)),
                                  child: Center(
                                    child: Text(
                                      "Book Appointment",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
