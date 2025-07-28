import 'package:yellowrock/features/app_initializer/presentation/pages/app_initializer_mobile.dart';
import 'package:yellowrock/shared/widgets/reusable_responsive.dart';
import 'package:flutter/material.dart';


class AppInitializerPage extends StatelessWidget {
  const AppInitializerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ReusableResponsive(
      mobile: AppInitializerMobile(),
      tablet: AppInitializerMobile(),
      desktop: AppInitializerMobile(),
    );
  }
}
