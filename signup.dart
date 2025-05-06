import 'package:flutter/material.dart';

import '../services/auth.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(4, 245, 217, 236),
      body: Column(
        children: [
          const SizedBox(height: 60),
          Center(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "images/logo.webp",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 80),
                const Text(
                  "Feel Free To Enjoy",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Event Booking App",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue[400],
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 80),
                Text(
                  "Your gateway to concerts, meetups,\n and unforgettable moments !",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue[400],
                    fontSize: 20,
                  ),),
              ],
            ),
          ),

          SizedBox(height: 60),
          GestureDetector(
            onTap:(){
              AuthMethods().signInWithGoogle(context);
            },
            child: Container(
              height: 70,
              margin: EdgeInsets.only(right:40, left:40),
              decoration: BoxDecoration( color: Colors.blue[400],borderRadius: BorderRadius.circular(40)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("images/google.webp", height:30, width: 30),
                  SizedBox(width: 30),
                  Text(
                      "Sign Up With Google",
                      textAlign: TextAlign.center,
                      style:TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
