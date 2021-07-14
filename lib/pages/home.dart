import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: camel_case_types
class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  _home_pageState createState() => _home_pageState();
}

// ignore: camel_case_types
class _home_pageState extends State<home_page> {
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    // Height of the screen
    final double height = MediaQuery.of(context).size.height;
    final Color blueAccent = Colors.blueAccent;
    // scaffold the app with the standard app bar and nav bar
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height / 16),
        child: AppBar(
          title: Text(
            "Hello, ${user!.displayName.toString()}",
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,

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
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.purple,
                ),
              ),
            ),
            const Spacer(),
            Text(
              "Work in Progess",
              style: Theme.of(context).textTheme.headline5,
            ),
            const Spacer(),
            const Spacer(),
            const Spacer(),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
