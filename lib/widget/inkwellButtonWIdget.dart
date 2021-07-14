import 'package:flutter/material.dart';

// Inwell Button for the buttons like login or logout stuff and so on.
class InWellButton extends StatelessWidget {
  const InWellButton({
    Key? key,
    required this.text,
    required this.onClicked,
    required this.height,
    required this.width,
    this.backgroundcolor = Colors.blue,
    this.borderradius = 20.0,
  }) : super(key: key);

  final String text;
  final VoidCallback onClicked;
  final Color backgroundcolor;
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
          color: backgroundcolor,
          borderRadius: BorderRadius.circular(borderradius),
        ),
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