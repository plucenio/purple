import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purple_web/lib.dart';

class PurpleLogotype extends StatelessWidget {
  const PurpleLogotype({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      APP_NAME.toLowerCase(),
      style: context.theme.textTheme.headlineLarge!.copyWith(
        fontFamily: GoogleFonts.hedvigLettersSans().fontFamily,
        fontWeight: FontWeight.bold,
        color: AppColor.PRIMARY,
      ),
    );
  }
}
