import 'package:flutter/material.dart';

import 'widgets/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
static const String routeName = "dashboard_view";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const DashboardViewBody(),
    );
  }
}
