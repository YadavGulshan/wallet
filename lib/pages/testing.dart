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
  /// Current User data.
  final User? user = FirebaseAuth.instance.currentUser;

  /// Initial Page; i.e Homepage
  int _page = 0;

  // some defined colors.
  final Color white = Colors.white;
  final MaterialAccentColor blueAccent = Colors.blueAccent;

  // list of widget which we want when user clicks on the specific button on navbar.
  List<Widget> tabs = <Widget>[
    const home_page(),
    const Add_Coins(),
    const UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    /// Get height of the screen.
    final double height2 = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height2 / 16),
        child: AppBar(
          /// Automatically imply leading removes the back button from the appbar, if set to false.
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                heightFactor: 1,
                widthFactor: 1,
                child: CircleAvatar(
                  backgroundColor: blueAccent,
                  // Show the image of current user.
                  backgroundImage: NetworkImage(user!.photoURL.toString()),
                ),
              ),
            )
          ],
        ),
      ),
      body: tabs[_page],

      /// Our animated navigation bar.
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: white,
        animationDuration: const Duration(milliseconds: 300),
        color: blueAccent,
        height: height2 / 15,

        /// Things my Bottom Navig bar will be consisting...
        items: const <Widget>[
          Icon(Icons.home_outlined),
          Icon(Icons.add),
          Icon(Icons.account_circle_outlined),
        ],
        onTap: (int index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
