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
      // ignore: always_specify_types
      body: ChangeNotifierProvider(
        create: (BuildContext context) => GoogleSignInProvider(),
        // ignore: always_specify_types
        child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) {
              final GoogleSignInProvider provider =
                  Provider.of<GoogleSignInProvider>(context);
              if (provider.isSigningIn) {
                return buildloading();
              } else if (snapshot.hasData) {
                return LoggedInWidget();
              }
              return const SignUpWidget();
            }),
      ),
    );
  }
}

Widget buildloading() => const Center(
      child: CircularProgressIndicator(
        color: Colors.green,
      ),
    );
