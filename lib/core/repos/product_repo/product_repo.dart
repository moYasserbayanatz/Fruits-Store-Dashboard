import 'package:dartz/dartz.dart';
import 'package:fruits_dashboard/view/addProduct/domain/entities/add_product_entity.dart';

import '../../errors/failure.dart';

abstract class ProductRepo{
  Future<Either<Failure, String>> addProduct(AddProductEntity addProductEntity);
}