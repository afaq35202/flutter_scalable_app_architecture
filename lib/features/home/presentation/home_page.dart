import 'package:dobby/features/home/presentation/pages/home_mobile.dart';
import 'package:dobby/features/home/presentation/widgets/roles_based_sections/sections_home_exports.dart';
import 'package:dobby/shared/widgets/reusable_responsive.dart';
import 'package:flutter/material.dart';

import '../../../app/routing/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = Routes.home;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReusableResponsive(
      mobile: HomeMobile(sectionHome: SectionSupervisorHome()),
      tablet: HomeMobile(sectionHome: SectionSupervisorHome()),
      desktop: HomeMobile(sectionHome: SectionSupervisorHome()),
    );
  }
}
