import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wallet/pages/userPages/Account_info.dart';
import 'package:wallet/pages/userPages/Invite_a_Friend.dart';
import 'package:wallet/pages/userPages/Notifications_Settings.dart';
import 'package:wallet/pages/userPages/aboutUsPage.dart';
import 'package:wallet/provider/google_sign_in.dart';
import 'package:wallet/widget/container_widget_for_list.dart';
import 'package:wallet/widget/inkwellButtonWIdget.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  // Get The current user data from firebase.
  final User? user = FirebaseAuth.instance.currentUser;

  // Pages to be routed to.
  List<Widget> pagesToRoute = <Widget>[
    const AccountInfo(),
    const NotificationSetting(),
    const InviteFriend(),
    const AboutUs(),
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          // Used spacer so that user profile image wont stick to the top of the screen.
          const Spacer(),
          const Spacer(),
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
          // List view
          const MyConatianer(
            mytext: "Account Info",
            routeToPage: AccountInfo(),
          ),
          const MyConatianer(
            mytext: "Notification Settings",
            routeToPage: NotificationSetting(),
          ),
          const MyConatianer(
            mytext: "Invite a Friend",
            routeToPage: InviteFriend(),
          ),
          const MyConatianer(
            mytext: "About Us",
            routeToPage: AboutUs(),
          ),

          const Spacer(),

          // Log Out button.
          InWellButton(
            backgroundcolor: Colors.redAccent,
            text: "Log Out",
            height: MediaQuery.of(context).size.height / 20,
            width: MediaQuery.of(context).size.width / 4,
            onClicked: () {
              // Haptic feedback so that, the user knows that something happened.
              HapticFeedback.heavyImpact();

              // Log out from the current user.
              final GoogleSignInProvider provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
          ),

          // Spacer so that button won't stick to the bottom of the screen.
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }
}
