import 'package:flutter/material.dart';
import 'package:fruits_dashboard/view/addProduct/presentation/pages/add_product_view.dart';
import 'package:fruits_dashboard/view/dashboard_view/dashboard_view.dart';


Route<dynamic> onGenerateRoutes(RouteSettings settings)
{
  switch (settings.name)
      {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (context) => const DashboardView(),);

    case AddProductView.routeName:
      return MaterialPageRoute(builder: (context) => const AddProductView(),);
    default:
      return MaterialPageRoute(builder: (context) =>const Scaffold());

  }
}