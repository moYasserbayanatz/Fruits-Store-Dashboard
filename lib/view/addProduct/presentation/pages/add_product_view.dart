import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/repos/image_repo/image_repo.dart';
import '../../../../core/repos/product_repo/product_repo.dart';
import '../../../../core/services/get_it_services.dart';
import '../manager/add_product_cubit.dart';
import '../widgets/addProductViewBodyBlocConsumer.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
static const routeName = "add_product";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AddProductCubit(
        getIt.get<ImageRepo>(),
        getIt.get<ProductRepo>(),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          surfaceTintColor: Colors.black87,

          centerTitle: true,
          title: const Text('Add Product',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),),
        body: AddProductViewBodyBloc(),
      ),
    );
  }
}

