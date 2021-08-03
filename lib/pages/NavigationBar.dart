import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet/pages/add_coins.dart';
import 'package:wallet/pages/home.dart';
import 'package:wallet/pages/user_page.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  /// Current User data.
  // final User? user = FirebaseAuth.instance.currentUser;

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
  List<Color> myColors = <Color>[
    const Color(0xff1ced8f),
    const Color(0xff63ECFF),
    const Color(0xffc634eb),

    // const Color(0xffd3f74f),
    // Colors.blueAccent,
  ];
  @override
  Widget build(BuildContext context) {
    /// Get height of the screen.
    final double height2 = MediaQuery.of(context).size.height;

    return Scaffold(
      // backgroundColor: Colors.black,
      backgroundColor: Colors.white,
      body: tabs[_page],

      /// Our animated navigation bar.
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 300),
        color: myColors[_page],
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
