import 'package:json_annotation/json_annotation.dart';

/// This allows the `CoinsData` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'coinsdata.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class CoinsData {
  CoinsData(this.name, this.type, this.icon);

  String name;
  String type;
  String icon;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$CoinsDataFromJson()` constructor.
  /// The constructor is named after the source class, in this case, CoinsData.

  factory CoinsData.fromJson(Map<String, dynamic> json) =>
      _$CoinsDataFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$CoinsDataToJson`.

  Map<String, dynamic> toJson() => _$CoinsDataToJson(this);

  // With this setup, the source code generator generates code for encoding and
  // decoding the name, Type and icon fields from JSON.

}
