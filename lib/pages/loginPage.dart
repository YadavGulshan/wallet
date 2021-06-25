import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/provider/google_sign_in.dart';
import 'package:wallet/widget/signUpWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: SignUpWidget(),
      ),
    );
  }
}
