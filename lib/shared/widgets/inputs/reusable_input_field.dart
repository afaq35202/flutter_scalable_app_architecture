import 'package:flutter/material.dart';

class ReusableInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String? heading;

  const ReusableInputField({super.key, this.controller, this.heading});

  @override
  Widget build(BuildContext context) {
    final inputField = TextFormField(controller: controller);
    return heading != null
        ? Column(children: [Text(heading ?? ''), inputField])
        : inputField;
  }
}
