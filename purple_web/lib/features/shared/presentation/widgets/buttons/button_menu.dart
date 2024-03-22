import 'package:flutter/material.dart';

import '../../../../../lib.dart';

class ButtonMenu extends StatefulWidget {
  final String text;
  final Function()? onPressed;
  const ButtonMenu({super.key, required this.text, this.onPressed});

  @override
  State<ButtonMenu> createState() => ButtonMenuState();
}

class ButtonMenuState extends State<ButtonMenu> {
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
          AppColor.PRIMARY,
        ),
      ),
      child: Center(
        child: Text(
          widget.text,
          style: context.theme.textTheme.bodyLarge!.copyWith(
            color: AppColor.INVERTED_TEXT_COLOR,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
