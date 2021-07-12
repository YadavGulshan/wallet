import 'package:flutter/material.dart';

class InWellButton extends StatelessWidget {
  const InWellButton({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);
  final String text;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onClicked,
        child: Container(
          height: MediaQuery.of(context).size.height / 20,
          width: MediaQuery.of(context).size.height / 4,
          decoration: BoxDecoration(
            color: Colors.blue,
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
