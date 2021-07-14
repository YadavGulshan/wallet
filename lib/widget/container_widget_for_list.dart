import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyConatianer extends StatelessWidget {
  const MyConatianer({
    Key? key,
    required this.mytext,
    required this.routeToPage,
  }) : super(key: key);

  final String mytext;
  final Widget routeToPage;

  @override
  Widget build(BuildContext context) {
    // To make the tiles have a button like feature.
    return InkWell(
      onTap: () {
        // Haptic feedback for letting the user know that something happened.
        HapticFeedback.heavyImpact();

        // Routing to widgets.
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) => routeToPage),
        );
      },
      child: Container(
        // Padding is a good way to space out elements.
        padding: const EdgeInsets.all(10),
        child: ListTile(
          title: Row(
            // Spacing between the icon and the title.
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                mytext,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
