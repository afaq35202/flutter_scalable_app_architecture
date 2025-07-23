import 'package:flutter/material.dart';

// Do not import this file directly. Use `export_scaffold.dart` instead.
class ReusableAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ReusableAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}
