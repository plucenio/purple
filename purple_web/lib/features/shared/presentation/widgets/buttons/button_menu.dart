import 'package:flutter/material.dart';
import '../../../../../lib.dart';

class ButtonMenu extends StatefulWidget {
  final String? text;
  final String tooltipMessage;
  final Icon icon;
  final Function()? onPressed;
  const ButtonMenu({
    super.key,
    this.text,
    required this.icon,
    required this.tooltipMessage,
    this.onPressed,
  });

  @override
  State<ButtonMenu> createState() => ButtonMenuState();
}

class ButtonMenuState extends State<ButtonMenu> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      child: Tooltip(
        message: widget.tooltipMessage,
        waitDuration: const Duration(milliseconds: 750),
        child: widget.text == null
            ? IconButton(onPressed: widget.onPressed, icon: widget.icon)
            : TextButton.icon(
                icon: widget.icon,
                onPressed: widget.onPressed,
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        0,
                      ),
                    ),
                  ),
                ),
                label: Text(
                  widget.text!,
                  style: context.theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
      ),
    );
  }
}
