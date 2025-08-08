import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final Widget? child;
  final String? text;
  final void Function()? onPressed;

  const ReusableButton({
    super.key,
    this.child,
    this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child ?? Text(text ?? ''),
    );
  }
}
