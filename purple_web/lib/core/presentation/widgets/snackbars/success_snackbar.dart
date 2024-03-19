import 'package:flutter/material.dart';

import '../../../../lib.dart';

class SuccessSnackBar extends SnackBar {
  const SuccessSnackBar({super.key, required super.content})
      : super(backgroundColor: AppColor.SUCCESS_COLOR);
}
