import 'package:flutter/material.dart';

import '../../../../shared/widgets/scaffold/export_scaffold.dart';
import '../viewmodel/home_viewmodel.dart';

class HomeMobile extends StatelessWidget {
  final HomeViewModel viewModel;

  const HomeMobile({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ReusableScaffold(appBar: ReusableAppBar(), body: ReusableBody());
  }
}
