import 'package:flutter/material.dart';

class InWellButton extends StatelessWidget {
  const InWellButton({
    Key? key,
    required this.text,
    required this.onClicked,
    this.backgroundcolor = Colors.blue,
    required this.height,
    required this.width,
  }) : super(key: key);
  final String text;
  final VoidCallback onClicked;
  final Color backgroundcolor;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClicked,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundcolor,
          borderRadius: BorderRadius.circular(20),
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