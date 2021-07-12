import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class Testingpage extends StatefulWidget {
  const Testingpage({Key? key}) : super(key: key);

  @override
  _TestingpageState createState() => _TestingpageState();
}

class _TestingpageState extends State<Testingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
          child: Text(
        "hello!",
        style: Theme.of(context).textTheme.headline2,
      )),
    );
  }
}
