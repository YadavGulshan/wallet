import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wallet/provider/google_sign_in.dart';

class GoogleSignInButtonWidget extends StatelessWidget {
  const GoogleSignInButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: InkWell(
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
              FaIcon(
                FontAwesomeIcons.google,
                color: Colors.white,
              ),
              Text(
                "Sign In with Google",
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
          // haptic feedback to let user know that something happened under the hood.
          HapticFeedback.heavyImpact();

          // Executing SignIn provider.
          final GoogleSignInProvider provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);

          // Logging in.
          provider.login();
        },
      ),
    );
  }
}
