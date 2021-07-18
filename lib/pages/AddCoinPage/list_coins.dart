import 'package:flutter/material.dart';

class ListCoin extends StatelessWidget {
  const ListCoin({
    // Constructor parameters
    Key? key,
    required this.coinName,
    required this.amountController,
  }) : super(key: key);

  // Since our widget is constant, we use final to prevent
  // any future changes to the coin name or amount.
  final List<String> coinName;
  final TextEditingController amountController;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // No. of coins.
      itemCount: coinName.length,

      // Item to display.
      itemBuilder: (BuildContext context, int index) {
        // Structure of the item.
        return InkWell(
          splashColor: const Color(0xff03fcdb),
          onTap: () {
            // Show dialog when the user tap on the item.
            showDialog<String>(
              context: context,

              // Alert message.
              builder: (BuildContext context) => AlertDialog(
                title: Text(coinName[index]),
                content: TextFormField(
                  // Amount controller.
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
                          // Coin Logo.
                          Image.asset(
                            "assets/images/google.jpg",
                            height: 50,
                            width: 40,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: <Widget>[
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
                        ],
                      ),
                    ),

                    // Coin price.
                    const Text("99999", style: TextStyle(fontSize: 20)),
                    // TODO: Change this to a stateful widget. And change the price on by using constant network calls.
                  ],
                )),
          ),
        );
      },
    );
  }
}
