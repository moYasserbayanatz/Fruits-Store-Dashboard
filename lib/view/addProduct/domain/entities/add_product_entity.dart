import 'dart:io';

class AddProductEntity {
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
  AddProductEntity(

      {required this.name,
        required this.expirationsMonths,
        required this.numberOfCalories,
        required this.unitAmount,
        this.isOrganic = false,
      required this.description,
      required this.code,
      required this.price,
      required this.isFeatured,
      required this.image,
      this.imageUrl});


}
