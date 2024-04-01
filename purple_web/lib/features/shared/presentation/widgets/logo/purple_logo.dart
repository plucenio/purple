import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purple_web/lib.dart';

class PurpleLogo extends StatelessWidget {
  const PurpleLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      APP_NAME.toLowerCase(),
      style: context.theme.textTheme.headlineLarge!.copyWith(
        //TODO: mudar a fonte e o logo.
        fontFamily: GoogleFonts.paprika().fontFamily,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
        shadows: [
          const Shadow(
              color: Colors.black38, offset: Offset(5, 0), blurRadius: 3)
        ],
      ),
    );
  }
}
