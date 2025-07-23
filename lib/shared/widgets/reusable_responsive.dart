import 'package:flutter/material.dart';

class ReusableResponsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  final bool paddingReq;

  const ReusableResponsive({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    this.paddingReq = true,
  });

  // screen sizes
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1000 &&
      MediaQuery.of(context).size.width >= 600;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1000;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1000) {
            return desktop;
          } else if (constraints.maxWidth >= 600) {
            return tablet;
          } else {
            return mobile;
          }
        },
      ),
    );
  }
}
