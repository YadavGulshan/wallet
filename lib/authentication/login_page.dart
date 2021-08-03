import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/pages/NavigationBar.dart';
import 'package:wallet/pages/SignUp_And_SignIn_Page.dart';
import 'package:wallet/provider/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Using ChangeNotifier to detect changes to the user's profile.
      // ignore: always_specify_types
      body: ChangeNotifierProvider(
        create: (BuildContext context) => GoogleSignInProvider(),

        /// StreamBuilder is a helper class that allows us to create a stream of
        /// values from a provider.
        child: StreamBuilder<User?>(
            // Notifies the stream about the state of user profile changes.
            stream: FirebaseAuth.instance.authStateChanges(),

            // The stream will emit the current user's profile when it is ready.
            builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) {
              // Initializing Provider for login.
              final GoogleSignInProvider provider =
                  Provider.of<GoogleSignInProvider>(context);

              // Until signIn process is not completed show the loading screen.
              if (provider.isSigningIn) {
                return buildloading();
              }
              // If the user is signed in, return the user's profile.
              else if (snapshot.hasData) {
                return const NavigationBar();
              }
              // If the user is not signed in, return the signUpWidget.
              return const StartUpScreen();
            }),
      ),
    );
  }
}

// Circular progress indicator, while the user is signing in.
Widget buildloading() => const Center(
      child: CircularProgressIndicator(
        color: Colors.green,
      ),
    );
