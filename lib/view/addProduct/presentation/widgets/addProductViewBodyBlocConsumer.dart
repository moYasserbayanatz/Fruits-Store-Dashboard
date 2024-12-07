import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dashboard/core/widgets/custom_progress_hud.dart';
import 'package:fruits_dashboard/core/widgets/show_success.dart';
import 'package:fruits_dashboard/view/addProduct/presentation/manager/add_product_cubit.dart';

import 'add_product_view_body.dart';

class AddProductViewBodyBloc extends StatelessWidget {
  const AddProductViewBodyBloc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
        listener: (BuildContext context, AddProductState state) {
          if (state  is AddProductSuccess) {
            showSuccess(context, 'Product Added Successfully');
          }
        },
        builder: (BuildContext context, AddProductState state) {
          return CustomProgressHud(isLoading: state is AddProductLoading,
          child: AddProductViewBody());
        });
  }
}
