import 'package:yellowrock/shared/widgets/scaffold/reusable_app_bar.dart';
import 'package:yellowrock/shared/widgets/scaffold/reusable_body.dart';
import 'package:flutter/material.dart';

// Do not import this file directly. Use `export_scaffold.dart` instead.
class ReusableScaffold extends StatelessWidget {
  final ReusableAppBar? appBar;
  final ReusableBody? body;

  const ReusableScaffold({super.key, this.appBar, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar, body: body);
  }
}
