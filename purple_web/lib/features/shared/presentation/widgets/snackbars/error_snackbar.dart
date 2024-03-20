import 'package:flutter/material.dart';

import '../../../../../lib.dart';

class ErrorSnackBar extends SnackBar {
  const ErrorSnackBar({super.key, required super.content})
      : super(backgroundColor: AppColor.ERROR_COLOR);
}
