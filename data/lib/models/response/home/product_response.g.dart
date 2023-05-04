part of 'product_response.dart';

ProductResponse _$ProductResponseFromJson(List<dynamic> data) =>
    ProductResponse(
        listProduct: data
            .map((e) => DataProduct.fromMap(e as Map<String, dynamic>))
            .toList());
