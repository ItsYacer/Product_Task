import 'package:flutter/foundation.dart';

class ProductModel {
  late String name;
  late String description;
  late String price;
  late String productId;
  late String dateTime;

  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.dateTime,
    this.productId = '',
  });

  ProductModel.formJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    price = json['price'];
    productId = json['productId'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'productId' :productId,
      'dateTime' :dateTime,
      'price': price,
    };
  }
}
