// import 'package:awesome/advanced/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/screens/home.dart';
import 'package:medical_app/screens/login.dart';

// import 'map/map.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 242, 244),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Navigator.push(
      //     //     context,
      //     //     MaterialPageRoute(
      //     //       builder: (context) => const MapScreen(),
      //     //     ));
      //   },
      //   child: const Icon(Icons.map),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.android,
                  size: 100, color: Color.fromARGB(255, 63, 22, 186)),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Create Account",
                style: GoogleFonts.bebasNeue(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 17, 18, 23),
                ),
              ),
              const SizedBox(height: 5),
              const Text("Fill the form and Join The platform"),
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
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Full names",
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
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Address",
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
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Email",
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
                child: const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "password",
                      labelStyle:
                          TextStyle(fontSize: 12, fontFamily: 'Sans Serif'),
                    )),
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
                child: const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Confirm password",
                      labelStyle:
                          TextStyle(fontSize: 12, fontFamily: 'Sans Serif'),
                    )),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const Responsive(),
                  //   ),
                  // );
                },
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
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
                        "Sign up",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "already have an account?",
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
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: const Text("Login",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 63, 22, 186),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sans Serif')))
            ],
          ),
        ),
      ),
    );
  }
}
