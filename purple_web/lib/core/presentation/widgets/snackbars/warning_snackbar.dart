import 'package:flutter/material.dart';

import '../../../../lib.dart';

class WarningSnackBar extends SnackBar {
  const WarningSnackBar({super.key, required super.content})
      : super(backgroundColor: AppColor.WARNING_COLOR);
}
