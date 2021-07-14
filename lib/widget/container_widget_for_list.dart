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

  /// void _openMyPage() {
  ///   Navigator.push<void>(
  ///     context,
  ///     MaterialPageRoute<void>(
  ///       builder: (BuildContext context) => const MyPage(),
  ///     ),
  ///   );
  /// }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HapticFeedback.heavyImpact();

        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) => routeToPage),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          title: Text(mytext, style: const TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
