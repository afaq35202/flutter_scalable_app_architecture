import 'package:dobby/features/home/presentation/pages/home_mobile.dart';
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
    print("here is home");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReusableResponsive(
      mobile: HomeMobile(),
      tablet: HomeMobile(),
      desktop: HomeMobile(),
    );
  }
}
