import 'package:flutter/material.dart';
import '../base/home_section.dart';
import '../base/home_decorator.dart';

class SupervisorHome extends HomeDecorator {
  SupervisorHome(super.home);

  @override
  Widget build(BuildContext context) {
    final base = home.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        base,
        const Text('Supervisor Dashboard'),
        const SizedBox(height: 8),
        ElevatedButton(onPressed: () {}, child: const Text('View Reports')),
      ],
    );
  }
}
