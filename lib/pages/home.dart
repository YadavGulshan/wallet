import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'components/wallet_card.dart';

// ignore: camel_case_types
class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  _home_pageState createState() => _home_pageState();
}

// ignore: camel_case_types
class _home_pageState extends State<home_page> {
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    // Height of the screen
    final double height = MediaQuery.of(context).size.height;
    // scaffold the app with the standard app bar and nav bar
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height / 16),
        child: AppBar(
          title: Text(
            "Hello, ${user!.displayName.toString()}",
            style: Theme.of(context).textTheme.headline6,
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,

          /// Automatically imply leading removes the back button from the appbar, if set to false.
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                heightFactor: 1,
                widthFactor: 1,
                child: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  // Show the image of current user.
                  backgroundImage: NetworkImage(user!.photoURL.toString()),
                ),
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          // color: Colors.black,
          child: Stack(children: <Widget>[
            Column(
              children: <Widget>[
                const WalletCard(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 16,
                ),
                Text(
                  "BufferOverflow",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
            DraggableScrollableSheet(
                initialChildSize: 0.6,
                minChildSize: 0.5,
                builder: (BuildContext context,
                    ScrollController myScrollController) {
                  return ListView.builder(
                      controller: myScrollController,
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              // gradient: LinearGradient(
                              //   begin: Alignment.topLeft,
                              //   end: Alignment.bottomRight,
                              //   colors: <Color],
                              // ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: MediaQuery.of(context).size.height,
                                )
                              ],
                            ));
                      });
                }),
          ]),
        ),
      ),
    );
  }
}
