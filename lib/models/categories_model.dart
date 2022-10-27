import 'package:flutter/material.dart';

class CategoriesModel with ChangeNotifier{
  int? id;
  String? name;
  String? image;

  CategoriesModel({this.id, this.name, this.image});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
  static List<CategoriesModel> categriesFromSnapshot(List categriesSnapShot) {
    return categriesSnapShot.map((data) {
      return CategoriesModel.fromJson(data);
    }).toList();
  }
}
