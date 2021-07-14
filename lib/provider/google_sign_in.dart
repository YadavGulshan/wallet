import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool _isSigningIn = false;
  bool get isSigningIn => _isSigningIn;

  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  // ignore: always_specify_types
  Future login() async {
    // When user clicks the sign-in button, the login function is executed.
    // Therefore the isSigningIn flag is set to true.
    isSigningIn = true;

    // The login function is asynchronous.
    final GoogleSignInAccount? user = await googleSignIn.signIn();

    // If user does not have a Google account, the sign-in button is disabled.
    if (user == null) {
      isSigningIn = false;
      return;
    }
    // If Google Account exists, the user is signed in.
    else {
      final GoogleSignInAuthentication googleAuth = await user.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // The credential is used to sign in the user.
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Sign in is complete.
      isSigningIn = false;
    }
  }

  // logout is a function that is executed when the user clicks the sign-out button.
  void logout() {
    googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
