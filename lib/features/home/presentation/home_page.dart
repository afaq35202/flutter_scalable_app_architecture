import 'package:dobby/features/home/presentation/pages/home_mobile.dart';
import 'package:dobby/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:dobby/shared/widgets/reusable_responsive.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final HomeViewModel viewModel;

  const HomePage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ReusableResponsive(
      mobile: HomeMobile(viewModel: viewModel),
      tablet: HomeMobile(viewModel: viewModel),
      desktop: HomeMobile(viewModel: viewModel),
    );
  }
}
