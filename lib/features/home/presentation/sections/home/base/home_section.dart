import 'package:flutter/material.dart';

abstract class HomeSection {
  Widget build(BuildContext context);
}

class DefaultHome implements HomeSection {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [Text('Welcome to the App'), SizedBox(height: 10)],
    );
  }
}
