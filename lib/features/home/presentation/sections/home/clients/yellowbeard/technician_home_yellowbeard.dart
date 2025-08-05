import 'package:flutter/material.dart';
import '../../base/home_section.dart';
import '../../roles/technician_home.dart';

class TechnicianHomeYellowbeard extends TechnicianHome {
  TechnicianHomeYellowbeard(super.home);

  @override
  Widget build(BuildContext context) {
    final base = super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        base,
        const SizedBox(height: 10),
        const Text('⚓ Yellowbeard Bonus Feature'),
      ],
    );
  }
}
