import 'package:dobby/features/app_initializer/presentation/pages/app_initializer_mobile.dart';
import 'package:dobby/shared/widgets/reusable_responsive.dart';
import 'package:flutter/material.dart';

import '../../../app/routing/routes.dart';

class AppInitializerPage extends StatelessWidget {

  const AppInitializerPage({super.key});

  static const routeName = Routes.appInitializer;

  @override
  Widget build(BuildContext context) {
    return ReusableResponsive(
      mobile: AppInitializerMobile(),
      tablet: AppInitializerMobile(),
      desktop: AppInitializerMobile(),
    );
  }
}
