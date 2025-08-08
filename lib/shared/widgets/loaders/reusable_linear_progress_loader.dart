import 'package:flutter/material.dart';

import '../../../app/theming/dimens/rounded_dimensions.dart';

class ReusableLinearProgressLoader extends StatelessWidget {
  final double? width;
  final double? height;

  const ReusableLinearProgressLoader({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: LinearProgressIndicator(
        borderRadius: BorderRadius.circular(
          DimensionsRounded.smallRoundness,
        ),
      ),
    );
  }
}
