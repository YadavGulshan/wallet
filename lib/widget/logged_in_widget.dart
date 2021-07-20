// Not using for now

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wallet/pages/NavigationBar.dart';
import 'package:wallet/provider/google_sign_in.dart';
import 'inkwellButtonWIdget.dart';

class LoggedInWidget extends StatefulWidget {
  @override
  _LoggedInWidgetState createState() => _LoggedInWidgetState();
}

class _LoggedInWidgetState extends State<LoggedInWidget> {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.blue,
              backgroundImage: NetworkImage(user!.photoURL.toString()),
            ),
            const Spacer(),
            Text(
              "Hello ${user!.displayName}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              user!.email.toString(),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w100,
              ),
            ),
            const Spacer(
              flex: 3,
            ),
            InkWell(
              child: Container(
                height: MediaQuery.of(context).size.height / 20,
                width: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Text(
                      "Log Out",
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                HapticFeedback.heavyImpact();
                final GoogleSignInProvider provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
            ),
            const Spacer(),
            InWellButton(
              height: MediaQuery.of(context).size.height / 20,
              width: MediaQuery.of(context).size.height / 4,
              text: "NextPage",
              onClicked: () {
                Navigator.of(context)
                    // ignore: always_specify_types
                    .push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const NavigationBar()));
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
