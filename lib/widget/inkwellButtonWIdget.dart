import 'package:flutter/material.dart';

class InWellButton extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  const InWellButton({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        child: Container(
          height: MediaQuery.of(context).size.height / 20,
          width: MediaQuery.of(context).size.height / 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                text,
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.green,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onTap: onClicked,
      );
}
