import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class User_profile extends StatefulWidget {
  const User_profile({Key? key}) : super(key: key);

  @override
  _User_profileState createState() => _User_profileState();
}

class _User_profileState extends State<User_profile> {
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const Spacer(),
          CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(user!.photoURL.toString()),
          ),
          const Spacer(),
          Text(
            user!.displayName.toString(),
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.headline5,
              // fontWeight: FontWeight.bold,
              // fontSize: 20,
            ),
          ),
          const Spacer(),
          const Spacer(),
          const Spacer(),
          const Spacer(),
          const Spacer(),
          const Spacer(),
          const Spacer(),
          const Spacer(),
          const Spacer(),
          const Spacer(),
          const Spacer(),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }
}
