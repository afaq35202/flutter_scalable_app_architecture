import 'package:dobby/core/extensions/string_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/scaffold/export_scaffold.dart';
import '../viewmodel/home_viewmodel.dart';

class HomeMobile extends StatelessWidget {

  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ReusableScaffold(appBar: ReusableAppBar(),body: ReusableBody(child: Column(
      children: [
        Text("info".tr)
      ],
    )),);
  }
}
