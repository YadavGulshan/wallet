import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wallet/provider/google_sign_in.dart';
import 'package:wallet/widget/inkwellButtonWIdget.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  // Get The current user data from firebase.
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const Spacer(),

          // Avatar of current user.
          CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(user!.photoURL.toString()),
          ),

          const Spacer(),

          // User name of current user.
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
          InWellButton(
            backgroundcolor: Colors.red,
            text: "Log Out",
            height: MediaQuery.of(context).size.height / 20,
            width: MediaQuery.of(context).size.width / 4,
            onClicked: () {
              HapticFeedback.heavyImpact();
              final GoogleSignInProvider provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
