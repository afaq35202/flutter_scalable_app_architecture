import 'package:dobby/features/app_initializer/presentation/pages/app_initializer_mobile.dart';
import 'package:dobby/features/app_initializer/presentation/view_model/app_initializer_view_model.dart';
import 'package:dobby/shared/widgets/reusable_responsive.dart';
import 'package:flutter/material.dart';

import '../../../app/routing/routes.dart';

class AppInitializerPage extends StatelessWidget {
  final AppInitializerViewModel viewModel;

  const AppInitializerPage({super.key, required this.viewModel});

  static const routeName = Routes.appInitializer;

  @override
  Widget build(BuildContext context) {
    return ReusableResponsive(
      mobile: AppInitializerMobile(viewModel: viewModel),
      tablet: AppInitializerMobile(viewModel: viewModel),
      desktop: AppInitializerMobile(viewModel: viewModel),
    );
  }
}
