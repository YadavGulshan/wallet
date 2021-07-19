import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff210729),
      body: Column(
        children: [
          const Spacer(),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: const RiveAnimation.asset(
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
            child: Container(
              // padding: const EdgeInsets.all(80),
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue.shade200,
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
