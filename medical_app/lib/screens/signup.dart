// import 'package:awesome/advanced/responsive.dart';
// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app/helpers/http_request.dart';
import 'package:medical_app/screens/home.dart';
import 'package:medical_app/screens/login.dart';
import 'package:medical_app/widgets/loader.dart';
import 'package:medical_app/widgets/toast.dart';

// import 'map/map.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

TextEditingController FullNames = TextEditingController();
TextEditingController Email = TextEditingController();
TextEditingController Password = TextEditingController();
TextEditingController Password2 = TextEditingController();
TextEditingController Username = TextEditingController();
TextEditingController PhoneNumber = TextEditingController();
TextEditingController Specialist = TextEditingController();
TextEditingController About = TextEditingController();
TextEditingController MerchantName = TextEditingController();

signup(BuildContext context) async {
  showLoader(context);
  try {
    if (Password.text != Password2.text) {
      Navigator.of(context).pop();
      showToast(context, "Passwords do not match");
      return;
    }
    var auth = await sendHttpRequest(
        Uri.parse(
            'https://medicalbackend-production-3b22.up.railway.app/account/'),
        method: 'post',
        data: {
          "email": Email.text,
          "full_name": FullNames.text,
          "phone_number": PhoneNumber.text,
          "password": Password.text,
          "username": Username.text,
          "user_type": "VISITER",
          "specialist": "None",
          "about": "Normal user",
          "merchant_name": "None"
        });
    if (auth.statusCode == 201) {
      Navigator.of(context).pop();
      showToast(context, "Account created successfully Now login");
      Navigator.of(context).pushNamed('/');
    } else {
      Navigator.of(context).pop();
      print(auth.body);
      showToast(context, "${auth.body}");
    }
  } catch (err) {
    Navigator.of(context).pop();
    print(err);
    showToast(context, "$err");
  }
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 242, 244),
      body: SingleChildScrollView(
        child: Padding(
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
                  child: TextField(
                    controller: FullNames,
                    decoration: const InputDecoration(
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
                    controller: Email,
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
                  child: TextField(
                    controller: PhoneNumber,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Phone number",
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
                    controller: Username,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "username",
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
                      controller: Password,
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
                  child: TextField(
                      controller: Password2,
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
                      signup(context);
                      // Navigator.push(
                      // context,
                      // MaterialPageRoute(
                      //     builder: (context) => const LoginPage())
                      // );
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
      ),
    );
  }
}
