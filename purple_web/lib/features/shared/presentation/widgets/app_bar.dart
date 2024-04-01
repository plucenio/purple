import 'package:flutter/material.dart';

import '../../../../lib.dart';

class PurpleAppBar extends AppBar {
  final Widget? logo;

  PurpleAppBar({
    super.key,
    this.logo,
    super.actions,
  }) : super(
          title: logo ?? const PurpleLogo(),
          toolbarHeight: 90.0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[
                  Colors.purple,
                  Colors.blue,
                ])),
          ),
        );
}
