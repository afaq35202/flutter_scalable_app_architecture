import 'package:dobby/core/extensions/string_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/scaffold/export_scaffold.dart';
import '../widgets/roles_based_sections/section_base_home.dart';

class HomeMobile extends StatelessWidget {
  final SectionBaseHome sectionHome;

  const HomeMobile({super.key, required this.sectionHome});

  @override
  Widget build(BuildContext context) {
    return ReusableScaffold(
      appBar: ReusableAppBar(),
      body: ReusableBody(child: Column(children: [Text("info".tr)])),
    );
  }
}
