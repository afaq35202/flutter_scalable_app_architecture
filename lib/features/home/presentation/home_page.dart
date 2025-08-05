import 'package:dobby/features/home/presentation/pages/home_mobile.dart';
import 'package:dobby/features/home/presentation/sections/home/home_factory.dart';
import 'package:dobby/shared/widgets/layout/reusable_responsive.dart';
import 'package:flutter/material.dart';

import '../../../app/routing/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = Routes.home;

  @override
  Widget build(BuildContext context) {
    return ReusableResponsive(
      mobile: HomeMobile(sectionHome: getHomeSection.build(context)),
      tablet: HomeMobile(sectionHome: getHomeSection.build(context)),
      desktop: HomeMobile(sectionHome: getHomeSection.build(context)),
    );
  }
}
