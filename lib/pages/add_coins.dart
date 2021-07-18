// ignore_for_file: always_specify_types, duplicate_ignore

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/retry.dart';
import 'package:wallet/pages/AddCoinPage/list_coins.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class AddCoinPage extends StatefulWidget {
  const AddCoinPage({Key? key}) : super(key: key);

  @override
  _AddCoinPageState createState() => _AddCoinPageState();
}

// ignore: camel_case_types
class _AddCoinPageState extends State<AddCoinPage> {
  String url = "https://x.wazirx.com/api/v2/global_configs";

  // String priceUrl = "https://x.wazirx.com/wazirx-falcon/api/v2.0/crypto_rates";
  // Coin names.
  late List<dynamic> coinName = [];
  late List<dynamic> subName = [];
  late List<dynamic> iconLinks = [];
  // late List<dynamic> price = [];

  final TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getJsonData(); // Method.
    // getPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Add Coins', style: TextStyle(color: Colors.black)),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(5),
        //     child: SvgPicture.network(
        //         "https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/svg/icon/btc.svg"),
        //   ),
        // ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(
            const Duration(
              milliseconds: 50000,
            ),
          ); // Lol change this!
          return HapticFeedback.heavyImpact();
        },
        child: ListCoin(
          coinName: coinName,
          subName: subName,
          iconLinks: iconLinks,
          // prices: price,
          amountController: _amountController,
        ),
      ),
    );
  }

  Future<String> getJsonData() async {
    final response = await http.get(Uri.parse(url));
    debugPrint(response.body);
    setState(() {
      final converDataToJson = json.decode(response.body);
      for (var i = 0; i < 224; i++) {
        if (converDataToJson["currencies"][i]["category"] == "crypto") {
          coinName.add(converDataToJson["currencies"][i]["name"]);
          subName.add(converDataToJson["currencies"][i]["type"]);
          iconLinks.add(converDataToJson["currencies"][i]["icon"]);
        }
      }
    });
    debugPrint(coinName.toString());
    return "Sucess";
  }

  // Future<int> getPrice() async {
  //   final response = await http.get(Uri.parse(priceUrl));
  //   debugPrint("Price here");
  //   debugPrint(response.body);
  //   // debugPrint("Subname length" + subName.length.toString());  //0
  //   final pricesDataTOJson = jsonDecode(response.body);
  //   setState(() {
  //     for (var i = 0; i < subName.length; i++) {
  //       price.add(pricesDataTOJson[subName.toString()]["inr"]);
  //     }
  //   });
  //   debugPrint("Extracted prices");
  //   debugPrint(price.toString());
  //   return 0;
  // }
}
