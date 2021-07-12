import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class Testingpage extends StatefulWidget {
  const Testingpage({Key? key}) : super(key: key);

  @override
  _TestingpageState createState() => _TestingpageState();
}

class _TestingpageState extends State<Testingpage> {
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                heightFactor: 1,
                widthFactor: 1,
                child: CircleAvatar(
                  backgroundColor: Colors.lightBlue,
                  backgroundImage: NetworkImage(user!.photoURL.toString()),
                ),
              ),
            )
          ],
        ),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: InkWell(
              onTap: () {
                HapticFeedback.heavyImpact();
              },
              child: SvgPicture.asset(
                "assets/images/penguin.svg",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
