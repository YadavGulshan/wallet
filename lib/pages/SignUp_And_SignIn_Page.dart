// ignore_for_file: implementation_imports

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/painting/gradient.dart' as lineargradient;
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:wallet/pages/NavigationBar.dart';

class StartUpScreen extends StatelessWidget {
  const StartUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Backgroung color of our application.
      // backgroundColor: const Color(0xff210729),
      body: Container(
        // Gradient coloring
        decoration: const BoxDecoration(
          gradient: lineargradient.LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Color(0xff210729),
              Color(0xff210729),
              Color(0xff210729),
              Color(0xff210729),
              // Color(0xff210729),
              // Color(0xff210729),
              // Color(0xff210729),
              Color(0xff50defa),
              Color(0xffcaed79),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,

                // Our animating rive file.
                child: const RiveAnimation.asset(
                  // "assets/bear_avatar_remix (1).riv",
                  // "assets/bear1.riv",
                  "assets/bear_avatar_remix.riv",
                ),
              ),
              const Spacer(),
              const Spacer(),
              const Spacer(),
              const Spacer(),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20.0),

                // Container containing the signin and signUp buttons.
                child: Container(
                  // padding: const EdgeInsets.all(80),
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    // color: Colors.blue.shade200,
                    gradient: const lineargradient.LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          Color(0xffc634eb),
                          Color(0xff34bdeb),
                          // Color(0xff79e7ed),
                        ]),
                  ),
                  child: Center(
                      child: Column(
                    children: const <Widget>[
                      Spacer(),
                      InkwellButton(
                        text: "Login",
                        // ontap: ,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkwellButton(
                        text: "SignUp",
                      ),
                      Spacer()
                    ],
                  )),
                ),
              ),
              const Spacer(),
              const Spacer(),
              const Spacer(),
              const Spacer(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class InkwellButton extends StatelessWidget {
  const InkwellButton({
    Key? key,
    required this.text,
    this.color = Colors.white,
    // required this.ontap,
  }) : super(key: key);
  final String text;
  final Color color;
  // final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HapticFeedback.heavyImpact();

        // Route to home, bypassing the authentication.
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) => const NavigationBar()),
        );
        // ontap();
      },
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width / 3,

        // color: Colors.white,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.stylish(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
