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

  // List<Widget> sections = <Widget>[];

  // Widget buildrow(String YourString, int i) => InkWell(
  //       child: ListTile(
  //         title: Text(
  //           YourString.toString(),
  //         ),
  //       ),
  //       onTap: () {
  //         // Route to some page
  //         MaterialPageRoute(builder: (BuildContext context) => sections[i]);
  //       },
  //     );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HapticFeedback.heavyImpact();
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          title: Text(mytext),
        ),
      ),
    );
  }
}
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         HapticFeedback.heavyImpact();
//         MaterialPageRoute<dynamic>(
//             builder: (BuildContext context) => routeToPage);
//       },
//       splashColor: Colors.green,
//       child: ListTile(
//         title: Text(mytext),
//       ),
//     );
//   }
// }
