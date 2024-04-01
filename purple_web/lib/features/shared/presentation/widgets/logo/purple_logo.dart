import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:purple_web/lib.dart';

class PurpleLogo extends StatelessWidget {
  final double size;
  final bool withBlur;
  const PurpleLogo({
    super.key,
    this.size = 100,
    this.withBlur = false,
  });

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: withBlur
          ? ImageFilter.blur(sigmaX: 2, sigmaY: 2)
          : ImageFilter.blur(),
      child: Stack(
        children: [
          Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
                color: AppColor.SECONDARY.withOpacity(0.6),
                shape: BoxShape.circle),
          ),
          Padding(
            padding: EdgeInsets.only(right: size / 6),
            child: Container(
              height: size,
              width: size,
              transform: Matrix4.translationValues(size / 7, size / 7, 0),
              decoration: BoxDecoration(
                  color: AppColor.PRIMARY.withOpacity(0.6),
                  shape: BoxShape.circle),
            ),
          ),
        ],
      ),
    );
  }
}
