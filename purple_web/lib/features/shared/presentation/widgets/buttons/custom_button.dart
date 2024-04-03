import 'package:flutter/material.dart';

import '../../../../../lib.dart';

class CustomButton extends StatefulWidget {
  final Widget child;
  final Function()? onPressed;
  final Color? color;
  const CustomButton({
    super.key,
    required this.child,
    this.onPressed,
    this.color,
  });

  @override
  State<CustomButton> createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            8,
          ))),
          backgroundColor: MaterialStateProperty.all(
            widget.color ?? AppColor.BG_COLOR,
          )),
      child: Center(
        child: widget.child,
      ),
    );
  }
}
