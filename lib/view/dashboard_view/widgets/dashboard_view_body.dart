import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_dashboard/view/addProduct/presentation/pages/add_product_view.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            title: 'Add Data',
              onPressed: () {
              Navigator.pushNamed(context, AddProductView.routeName);
              },
          )
        ],
      ),
    );
  }
}
