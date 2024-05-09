import 'package:meta/meta.dart';
import 'dart:convert';

class CatModel {
  final String length;
  final String origin;
  final String imageLink;
  final int familyFriendly;
  final double minWeight;
  final double maxWeight;
  final double minLifeExpectancy;
  final double maxLifeExpectancy;
  final String name;

  CatModel({
    required this.length,
    required this.origin,
    required this.imageLink,
    required this.familyFriendly,
    required this.minWeight,
    required this.maxWeight,
    required this.minLifeExpectancy,
    required this.maxLifeExpectancy,
    required this.name,
  });

  factory CatModel.fromRawJson(String str) =>
      CatModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CatModel.fromJson(Map<String, dynamic> json) => CatModel(
        length: json["length"],
        origin: json["origin"],
        imageLink: json["image_link"],
        familyFriendly: json["family_friendly"],
        minWeight: json["min_weight"],
        maxWeight: json["max_weight"],
        minLifeExpectancy: json["min_life_expectancy"],
        maxLifeExpectancy: json["max_life_expectancy"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "length": length,
        "origin": origin,
        "image_link": imageLink,
        "family_friendly": familyFriendly,
        "min_weight": minWeight,
        "max_weight": maxWeight,
        "min_life_expectancy": minLifeExpectancy,
        "max_life_expectancy": maxLifeExpectancy,
        "name": name,
      };
}
