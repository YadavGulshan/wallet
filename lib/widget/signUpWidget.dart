import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wallet/widget/google_Sign_In_Button_Widget.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => buildSignUp(context);
  Widget buildSignUp(BuildContext context) => SafeArea(
        child: Column(
          children: <Widget>[
            const Spacer(),

            // Using a SVG file, so that it can be used irrespective of device size.
            SvgPicture.asset(
              "assets/images/light_house.svg",
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
            ),
            const Spacer(),

            // Alligning Welcome text at center, though it can also be achieved using Center widget.
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  "Welcome",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            const Spacer(),
            const Spacer(),
            const Spacer(),
            const GoogleSignInButtonWidget(),
            const Spacer(),

            // Some recognition for me :)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text("Made With "),
                FaIcon(
                  FontAwesomeIcons.heart,
                  color: Colors.red,
                ),
                Text(" in India by Gulshan"),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      );
}
