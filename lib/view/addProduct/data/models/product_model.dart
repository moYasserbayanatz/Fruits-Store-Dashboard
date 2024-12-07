import 'dart:io';

import 'package:fruits_dashboard/view/addProduct/domain/entities/add_product_entity.dart';


class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final int sellingCount;
  ProductModel(
      {required this.name,
        required this.code,
        required this.description,
        required this.expirationsMonths,
        required this.numberOfCalories,
        required this.unitAmount,
        this.sellingCount = 0,
        required this.isOrganic,
        required this.price,

        required this.image,
        required this.isFeatured,
        this.imageUrl});

  factory ProductModel.fromEntity(AddProductEntity addProductInputEntity) {
    return ProductModel(

        name: addProductInputEntity.name,
        code: addProductInputEntity.code,
        description: addProductInputEntity.description,
        price: addProductInputEntity.price,
        isOrganic: addProductInputEntity.isOrganic,
        expirationsMonths: addProductInputEntity.expirationsMonths,
        numberOfCalories: addProductInputEntity.numberOfCalories,
        unitAmount: addProductInputEntity.unitAmount,
        image: addProductInputEntity.image,

        isFeatured: addProductInputEntity.isFeatured,
        imageUrl: addProductInputEntity.imageUrl);
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'sellingCount': sellingCount,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonths': expirationsMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
    };
  }
}