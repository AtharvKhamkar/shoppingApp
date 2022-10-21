import 'package:store_api_flutter_course/models/categories_model.dart';

class ProductModel {
  int? id;
  String? title;
  int? price;
  String? description;
  CategoriesModel? category;
  List<String>? images;

  ProductModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.images});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'] != null
        ? new CategoriesModel.fromJson(json['category'])
        : null;
    images = json['images'].cast<String>();
  }

  static List<ProductModel> productFromSnapshot(List productSnapShot) {
    return productSnapShot.map((data) {
       return ProductModel.fromJson(data);
    }).toList();
  }
}
