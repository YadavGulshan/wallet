import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

class ListCoin extends StatefulWidget {
  const ListCoin({
    // Constructor parameters
    Key? key,
    required this.coinName,
    required this.subName,
    required this.iconLinks,
    required this.prices,
    required this.amountController,
  }) : super(key: key);

  // Since our widget is constant, we use final to prevent
  // any future changes to the coin name or amount.
  final List<dynamic> coinName;
  final List<dynamic> subName;
  final List<dynamic> iconLinks;
  final List<dynamic> prices;

  final TextEditingController amountController;
  @override
  State<ListCoin> createState() => _ListCoinState();
}

class _ListCoinState extends State<ListCoin> {
  String priceUrl = "https://x.wazirx.com/wazirx-falcon/api/v2.0/crypto_rates";

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // No. of coins.
      itemCount: widget.coinName.length,

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
                title: Text(widget.coinName[index].toString()),
                content: TextFormField(
                  // Amount controller.
                  // controller: amountController,
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
                    // height: 50,
                    child: Row(
                      children: <Widget>[
                        // Coin Logo.
                        Image.network(
                          widget.iconLinks[index]
                              .toString()
                              .replaceAll("<SIZE>", "84")
                              .replaceAll("old", ""),
                          height: 40,
                          width: 40,
                          fit: BoxFit.contain,
                          color: Colors.green,
                          errorBuilder: (BuildContext context, Object error,
                              StackTrace? stackTrace) {
                            return Image.asset(
                              "assets/images/google.jpg",
                              height: 40,
                              width: 40,
                            );
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: <Widget>[
                            const Spacer(),

                            // Coin Name.
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width: 200,
                                child: Text(
                                  widget.coinName[index].toString(),
                                  style: const TextStyle(fontSize: 19),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  // style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                            ),
                            const Spacer(),

                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.subName[index].toString(),
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Coin price.
                  const Text("Work in Progress.",
                      style: TextStyle(fontSize: 20)),
                  // TODO: Change this to a stateful widget. And change the price on by using constant network calls.
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
