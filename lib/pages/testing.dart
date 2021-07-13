import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet/pages/add_coins.dart';
import 'package:wallet/pages/home.dart';
import 'package:wallet/pages/user_page.dart';

class Testingpage extends StatefulWidget {
  const Testingpage({Key? key}) : super(key: key);

  @override
  _TestingpageState createState() => _TestingpageState();
}

class _TestingpageState extends State<Testingpage> {
  final User? user = FirebaseAuth.instance.currentUser;

  int _page = 0;
  // Some basic stuff
  final Color white = Colors.white;
  final MaterialAccentColor blueAccent = Colors.blueAccent;

  List<Widget> tabs = <Widget>[
    const home_page(),
    const Add_Coins(),
    const UserProfile(),
  ];
  // final PageStorageBucket bucket = PageStorageBucket();
  // ignore: non_constant_identifier_names
  // Widget Screen = tabs[_page];
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
            // print("current index is $index");
            // print("current page is $_page");
          },
        ),
      ),
    );
  }
}
