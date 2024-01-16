// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  List<Category> categories;

  CategoryModel({
    required this.categories,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
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
  ELEMENT_1,
  ELEMENT_2,
  ELEMENT_3
}

final subcategoryValues = EnumValues({
  "element 1 ": Subcategory.ELEMENT_1,
  "element 2": Subcategory.ELEMENT_2,
  "element 3": Subcategory.ELEMENT_3
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
