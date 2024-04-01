import 'package:flutter/material.dart';
import 'package:purple_web/lib.dart';

class PurpleLogo extends StatelessWidget {
  final double size;
  const PurpleLogo({
    super.key,
    this.size = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
              color: AppColor.SECONDARY.withOpacity(0.7),
              shape: BoxShape.circle),
        ),
        Container(
          transform: Matrix4.translationValues(size / 5, size / 5, 0),
          height: size,
          width: size,
          decoration: BoxDecoration(
              color: AppColor.PRIMARY.withOpacity(0.7), shape: BoxShape.circle),
        ),
      ],
    );
  }
}
