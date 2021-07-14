import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: camel_case_types
class Add_Coins extends StatefulWidget {
  const Add_Coins({Key? key}) : super(key: key);

  @override
  _Add_CoinsState createState() => _Add_CoinsState();
}

// ignore: camel_case_types
class _Add_CoinsState extends State<Add_Coins> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const Spacer(),
          SvgPicture.asset(
            "assets/images/add.svg",
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
          ),
          const Spacer(),
          Text("Work in Progress",
              style: Theme.of(context).textTheme.headline6),
          const Spacer(),
          const Spacer(),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }
}
