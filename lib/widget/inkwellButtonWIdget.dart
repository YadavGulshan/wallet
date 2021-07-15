import 'package:flutter/material.dart';

// Inwell Button for the buttons like login or logout stuff and so on.
class InWellButton extends StatelessWidget {
  const InWellButton({
    Key? key,
    required this.text,
    required this.onClicked,
    required this.height,
    required this.width,
    this.gradienColor = Colors.blue,
    this.borderradius = 20.0,
  }) : super(key: key);

  final String text;
  final VoidCallback onClicked;
  final Color gradienColor;
  final double height;
  final double width;
  final double borderradius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClicked,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderradius),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.blue, Colors.white],
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              text,
              style: const TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// Used in logged_in_widgets.dart
// Used in User_page.dart