// ignore_for_file: always_specify_types, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet/pages/AddCoinPage/list_coins.dart';

// ignore: camel_case_types
class Add_Coins extends StatefulWidget {
  const Add_Coins({Key? key}) : super(key: key);

  @override
  _Add_CoinsState createState() => _Add_CoinsState();
}

// ignore: camel_case_types
class _Add_CoinsState extends State<Add_Coins> {
  // Coin names.
  final List<String> coinName = <String>[
    'ODOKNDOB',
    'ODOKNDOB',
    'ODOKNDOB',
    'ODOKNDOB',
    'ODOKNDOB',
    'ODOKNDOB',
    'ODOKNDOB',
    'ODOKNDOB',
    'ODOKNDOB',
    'ODOKNDOB',
    'ODOKNDOB',
    'ODOKNDOB',
    'ODOKNDOB',
    'ODOKNDOB',
    'ODOKNDOB',
    'ODOKNDOB',
    'ODOKNDOB',
    'ODOKNDOB',
    'ODOKNDOB',
    'ODOKNDOB',
  ];
  final List<int> colorCodes = <int>[600, 500, 100];
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Add Coins', style: TextStyle(color: Colors.black)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: SvgPicture.network(
                "https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/svg/icon/btc.svg"),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(
            Duration(
              milliseconds: 50000,
            ),
          ); // Lol change this!
          return HapticFeedback.heavyImpact();
        },
        child: ListCoin(
          coinName: coinName,
          amountController: _amountController,
        ),
      ),
    );
  }
}
