
import 'package:fruits_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruits_dashboard/core/repos/image_repo/image_repo_impl.dart';
import 'package:fruits_dashboard/core/repos/product_repo/product_repo_impl.dart';
import 'package:fruits_dashboard/core/services/storage_service.dart';
import 'package:fruits_dashboard/core/services/supabase_storage.dart';
import 'package:get_it/get_it.dart';

import '../repos/product_repo/product_repo.dart';
import 'database_services.dart';
import 'firestore_services.dart';

final getIt = GetIt.instance;

void setupGetIt () {
  getIt.registerSingleton<StorageService>(SupBaseService());

  getIt.registerSingleton<ImageRepo>(ImageRepoImpl(getIt.get<StorageService>()));
  getIt.registerSingleton<DataBaseService>(FireStoreService());

  getIt.registerSingleton<ProductRepo>(ProductRepoImpl(getIt.get<DataBaseService>()));

}
