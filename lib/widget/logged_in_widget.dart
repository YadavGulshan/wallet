import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wallet/pages/testing.dart';
import 'package:wallet/provider/google_sign_in.dart';
import 'inkwellButtonWIdget.dart';

class LoggedInWidget extends StatefulWidget {
  @override
  _LoggedInWidgetState createState() => _LoggedInWidgetState();
}

class _LoggedInWidgetState extends State<LoggedInWidget> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          CircleAvatar(
            radius: 70,
            backgroundColor: Colors.green,
            backgroundImage: NetworkImage("${user!.photoURL}"),
          ),
          Spacer(),
          Text(
            "Hello ${user!.displayName}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "${user!.email}",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w100,
            ),
          ),
          Spacer(
            flex: 3,
          ),
          InkWell(
            child: Container(
              height: MediaQuery.of(context).size.height / 20,
              width: MediaQuery.of(context).size.height / 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onTap: () {
              HapticFeedback.heavyImpact();
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
          ),
          Spacer(
            flex: 3,
          ),
          InWellButton(
            text: "NextPage",
            onClicked: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Testingpage()));
            },
          ),
          Spacer(),
        ],
      ),
    );
  }
}
