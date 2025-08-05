import 'package:flutter/material.dart';
import '../base/home_section.dart';
import '../base/home_decorator.dart';

class TechnicianHome extends HomeDecorator {
  TechnicianHome(super.home);

  @override
  Widget build(BuildContext context) {
    final base = home.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        base,
        const Text('Technician Tools'),
        const SizedBox(height: 8),
        ElevatedButton(onPressed: () {}, child: const Text('Repair Job')),
      ],
    );
  }
}
