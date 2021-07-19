import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'UserPage/list_comp.dart';
import 'components/wallet_card.dart';

// ignore: camel_case_types
class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  _home_pageState createState() => _home_pageState();
}

// ignore: camel_case_types
class _home_pageState extends State<home_page> {
  TextEditingController textcontroller = TextEditingController();
  List<String> TestString = <String>[
    "OBODSO",
    "OBODSO",
    "OBODSO",
    "OBODSO",
    "OBODSO",
    "OBODSO",
    "OBODSO",
    "OBODSO",
    "OBODSO",
    "OBODSO",
    "OBODSO",
    "OBODSO",
    "OBODSO",
    "OBODSO",
  ];
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    // Height of the screen
    final double height = MediaQuery.of(context).size.height;
    // scaffold the app with the standard app bar and nav bar
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height / 16),
        child: AppBar(
          title: Text(
            "Hello",
            // "Hello, ${user!.displayName.toString()}",
            style: Theme.of(context).textTheme.headline6,
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,

          /// Automatically imply leading removes the back button from the appbar, if set to false.
          automaticallyImplyLeading: false,
          actions: const <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                heightFactor: 1,
                widthFactor: 1,
                child: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  // Show the image of current user.
                  // backgroundImage: NetworkImage(user!.photoURL.toString()),
                  backgroundImage: NetworkImage("assets/images/google.jpg"),
                ),
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: Container(
          // color: const Color(0xff1ced8f),
          padding: const EdgeInsets.all(8.0),
          // color: Colors.black,
          child: Stack(children: <Widget>[
            Column(
              children: <Widget>[
                const WalletCard(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                InkWell(
                  onTap: () async {
                    HapticFeedback.heavyImpact();
                    await launch("https://bufferoverflow.me");
                  },
                  child: const Text(
                    "BufferOverflow.me",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            DraggableScrollableSheet(
                initialChildSize: 0.6,
                minChildSize: 0.5,
                builder: (BuildContext context,
                    ScrollController myScrollController) {
                  return Container(
                      // color: Colors.black,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: BoughtCoins(
                        scrollController: myScrollController,
                        amountController: textcontroller,
                        coinName: TestString,
                      ));
                }),
          ]),
        ),
      ),
    );
  }
}
