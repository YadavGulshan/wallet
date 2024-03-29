import 'package:flutter/material.dart';

class ListCoin extends StatelessWidget {
  const ListCoin({
    Key? key,
    required this.coinName,
    required this.amountController,
    //  this.scrollController = ScrollController(),
  }) : super(key: key);

  final List<String> coinName;
  final TextEditingController amountController;
  // final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // Scroll Controller.
      // controller: scrollController,

      // No. of coins.
      itemCount: coinName.length,

      // Item to display.
      itemBuilder: (BuildContext context, int index) {
        // Structure of the item.
        return InkWell(
          splashColor: const Color(0xff03fcdb),
          onTap: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text(coinName[index]),
                content: TextFormField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                // padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                height: MediaQuery.of(context).size.height / 10,
                width: MediaQuery.of(context).size.width,
                child:
                    // CoinName and price
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // ignore: always_specify_types
                  children: [
                    // Logo and name here
                    SizedBox(
                      height: 50,
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            "assets/images/google.jpg",
                            height: 50,
                            width: 40,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              // Coin Name.
                              Text(
                                coinName[index],
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              const Spacer(),
                              // SubName
                              const Text(
                                "GMY",
                                style: TextStyle(fontSize: 10),
                              ),
                              const Spacer(),
                            ],
                          ),

                          // Price
                        ],
                      ),
                    ),
                    const Text("99999", style: TextStyle(fontSize: 20)),
                  ],
                )),
          ),
        );
      },
    );
  }
}
