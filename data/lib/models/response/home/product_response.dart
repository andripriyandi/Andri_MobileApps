import 'dart:convert';

import 'package:data/other/response_object.dart';

part 'product_response.g.dart';

class ProductResponse extends ResponseObject {
  List<DataProduct>? listProduct;
  ProductResponse({
    this.listProduct,
  });

  factory ProductResponse.fromJson(List<dynamic> json) =>
      _$ProductResponseFromJson(json);

  static get serializer => _$ProductResponseFromJson;
}

class DataProduct {
  String? foodCode;
  String? name;
  String? picture;
  String? price;
  String? pictureOri;
  String? createdAt;
  int? id;
  int? qty;
  int? totalAmount;

  DataProduct({
    this.foodCode,
    this.name,
    this.picture,
    this.price,
    this.pictureOri,
    this.createdAt,
    this.id,
    this.qty,
    this.totalAmount,
  });

  factory DataProduct.fromMap(Map<String, dynamic> map) {
    return DataProduct(
      foodCode: map['food_code'],
      name: map['name'],
      picture: map['picture'],
      price: map['price'],
      pictureOri: map['picture_ori'],
      createdAt: map['created_at'],
      id: map['id'],
      qty: 1,
    );
  }

  factory DataProduct.fromJson(String source) =>
      DataProduct.fromMap(json.decode(source));
}
