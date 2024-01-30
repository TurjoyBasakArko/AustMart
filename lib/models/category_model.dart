import 'package:meta/meta.dart';
import 'dart:convert';

Cata cataFromJson(String str) => Cata.fromJson(json.decode(str));

String cataToJson(Cata data) => json.encode(data.toJson());

class Cata {
  List<Category> categories;

  Cata({
    required this.categories,
  });

  factory Cata.fromJson(Map<String, dynamic> json) => Cata(
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class Category {
  String name;
  List<Subcategory> subcategory;

  Category({
    required this.name,
    required this.subcategory,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    name: json["name"],
    subcategory: List<Subcategory>.from(json["subcategory"].map((x) => subcategoryValues.map[x])),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "subcategory": List<dynamic>.from(subcategory.map((x) => subcategoryValues.reverse[x])),
  };
}

enum Subcategory {
  CSE
}

final subcategoryValues = EnumValues({
  "cse": Subcategory.CSE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
