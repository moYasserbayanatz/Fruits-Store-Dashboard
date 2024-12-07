import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_dashboard/core/services/storage_service.dart';

import '../../errors/failure.dart';
import '../../services/backend_points.dart';
import 'image_repo.dart';

class ImageRepoImpl implements ImageRepo{
final StorageService storageService;

  ImageRepoImpl(this.storageService);
  @override
  Future<Either<Failure, String>> uploadImage(File image)async {
   try {
     String url=await  storageService.uploadFile(image, BackgroundPoints.images);
     return right(url);
   }catch (e) {
     return left(ServerFailure(e.toString()));
   }
  }
}