import 'package:dartz/dartz.dart';
import 'package:fruits_dashboard/core/services/backend_points.dart';
import 'package:fruits_dashboard/core/services/database_services.dart';
import 'package:fruits_dashboard/view/addProduct/data/models/product_model.dart';

import '../../errors/failure.dart';
import 'product_repo.dart';
import '../../../view/addProduct/domain/entities/add_product_entity.dart';

class ProductRepoImpl implements ProductRepo {
  final DataBaseService dataBaseService;
  ProductRepoImpl(this.dataBaseService);
  @override
  Future<Either<Failure, String>> addProduct(
      AddProductEntity addProductEntity) async {
    try {
      await dataBaseService.addData(
        collectionName: BackgroundPoints.productsCollection,
        data: ProductModel.fromEntity(addProductEntity).toJson(),
      );
      return Right('product added successfully');
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
