import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Widget child;
  final Function()? onPressed;
  final double? elevation;
  const CustomButton({
    super.key,
    required this.child,
    this.onPressed,
    this.elevation,
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
        elevation: MaterialStateProperty.all<double>(widget.elevation ?? 0),
      ),
      child: Center(
        child: widget.child,
      ),
    );
  }
}
