import 'package:json_annotation/json_annotation.dart';

/// This allows the `CoinsPrice` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'coinPrice.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class CoinsPrice {
  CoinsPrice(this.name, this.price);

  String name;
  String price;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$CoinsPriceFromJson()` constructor.
  /// The constructor is named after the source class, in this case, CoinsPrice.

  factory CoinsPrice.fromJson(Map<String, dynamic> json) =>
      _$CoinsPriceFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$CoinsPriceToJson`.

  Map<String, dynamic> toJson() => _$CoinsPriceToJson(this);

  // With this setup, the source code generator generates code for encoding and
  // decoding the name, Type and icon fields from JSON.

}
