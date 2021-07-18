import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Paading of the container.
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // height and width of our container.
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          // Rounded corners.
          borderRadius: BorderRadius.circular(20),

          // Gradient
          gradient: const LinearGradient(
            // From where to where the color changes.
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

            // Array of colors.
            colors: <Color>[
              Color(0xff924ff7),
              Color(0xfff74fa9),
              Color(0xfff7684f),
              Color(0xffd3f74f),
            ],
          ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const Text(
                    "Balance:",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  // Total balance.
                  Text(
                    "9999999",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
