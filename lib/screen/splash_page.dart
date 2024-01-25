import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3),
          () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
      },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 310,),
            Text("Spendo",style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 45,
            ),),
            const SizedBox(height: 25,),
            Container(
              height: 493,
              width: double.infinity,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text("Your Spending Companion",style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),textAlign: TextAlign.center,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
