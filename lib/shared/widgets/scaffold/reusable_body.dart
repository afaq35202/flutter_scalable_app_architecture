import 'package:flutter/material.dart';

// Do not import this file directly. Use `export_scaffold.dart` instead.
class ReusableBody extends StatelessWidget {
  final Widget child;
  const ReusableBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
