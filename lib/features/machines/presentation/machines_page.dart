import 'package:dobby/features/machines/presentation/pages/machines_mobile.dart';
import 'package:dobby/shared/widgets/layout/reusable_responsive.dart';
import 'package:flutter/material.dart';

import '../../../app/routing/routes.dart';

class MachinesPage extends StatelessWidget {
  const MachinesPage({super.key});

  static const routeName = Routes.machinesListing;

  @override
  Widget build(BuildContext context) {
    return ReusableResponsive(
      mobile: MachinesMobile(),
      tablet: MachinesMobile(),
      desktop: MachinesMobile(),
    );
  }
}
