import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet/authentication/login_page.dart';
import 'package:wallet/pages/userPages/Invite_a_Friend.dart';
import 'package:wallet/pages/userPages/aboutUsPage.dart';

// ignore: always_specify_types
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // brightness: Brightness.dark,
        textTheme: GoogleFonts.aclonicaTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const LoginPage(),
      routes: <String, WidgetBuilder>{
        "/aboutus": (BuildContext context) => const AboutUs(),
        "/Invite": (BuildContext context) => const InviteFriend(),
      },
    );
  }
}
