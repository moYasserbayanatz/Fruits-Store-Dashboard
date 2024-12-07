import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruits_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruits_dashboard/view/addProduct/domain/entities/add_product_entity.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imageRepo, this.productRepo)
      : super(AddProductInitial());
  final ImageRepo imageRepo;
  final ProductRepo productRepo;

  void addProduct(AddProductEntity addProductEntity) async {
    emit(AddProductLoading());
    var result = await imageRepo.uploadImage(addProductEntity.image!);
    result.fold((l) {
      emit(AddProductError(l.message));
    }, (url) async {
      addProductEntity.imageUrl = url;
      var finalResult = await productRepo.addProduct(addProductEntity);

      finalResult.fold((l) {
        emit(AddProductError(l.message));
      }, (r) {
        emit(AddProductSuccess());
      });
    });
  }
}
