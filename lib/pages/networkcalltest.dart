// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// Future<Coin> FetchCoins() async {
//   final response =
//       await http.get(Uri.parse("https://x.wazirx.com/api/v2/global_configs"));

//   if (response.statusCode == 200) {
//     return Coin.fromJson(response.body);
//   } else {
//     throw Exception("Failed to load coins from the API");
//   }
// }

// class Coin {
//   Coin({
//     required this.name,
//     required this.subName,
//     required this.iconLink,
//   });
//   List<String> name;
//   List<String> subName;
//   List<String> iconLink;


//   // ignore: sort_constructors_first
//   factory Coin.fromJson(String json) {
//     for (var i = 0; i < 224; i++) {
//       name.add(json["currencies"][i]["name"]);
//     }

// }

// main(List<String> args) {
//   final coins = FetchCoins();
// }
