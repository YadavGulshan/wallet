import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoggedInWidget extends StatelessWidget {
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
          Spacer()
        ],
      ),
    );
  }
}
