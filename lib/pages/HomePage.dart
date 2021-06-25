import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/provider/google_sign_in.dart';
import 'package:wallet/widget/logged_in_widget.dart';
import 'package:wallet/widget/signUpWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final provider = Provider.of<GoogleSignInProvider>(context);
              if (provider.isSigningIn) {
                return buildloading();
              } else if (snapshot.hasData) {
                return LoggedInWidget();
              }
              return SignUpWidget();
            }),
      ),
    );
  }
}

Widget buildloading() => Center(
      child: CircularProgressIndicator(
        color: Colors.green,
      ),
    );
