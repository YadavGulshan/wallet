import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet/authentication/login_page.dart';
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
    int _page = 0;
    final Color white = Colors.white;
    final MaterialAccentColor blueAccent = Colors.blueAccent;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    final List<Widget> tabs = [
      const HomePage(),
    ];
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
                  backgroundColor: blueAccent,
                  backgroundImage: NetworkImage(user!.photoURL.toString()),
                ),
              ),
            )
          ],
        ),
        body: tabs[_page],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: white,
          animationDuration: const Duration(milliseconds: 300),
          color: blueAccent,
          height: 55,
          items: const <Widget>[
            Icon(Icons.home),
            Icon(Icons.add),
            Icon(Icons.account_circle_outlined),
          ],
          onTap: (int index) {
            setState(() {
              _page = index;
            });
          },
        ),
      ),
    );
  }
}
