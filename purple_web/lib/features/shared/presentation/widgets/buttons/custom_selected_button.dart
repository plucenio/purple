import 'package:flutter/material.dart';

import '../../../../../lib.dart';

class CustomSelectedButton extends CustomButton {
  final bool isSelected;

  const CustomSelectedButton({
    super.key,
    required super.child,
    this.isSelected = false,
    super.onPressed,
  }) : super(
          color: isSelected ? AppColor.SECONDARY : null,
        );

  @override
  State<CustomButton> createState() => CustomButtonState();
}
