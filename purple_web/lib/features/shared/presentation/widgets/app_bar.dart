import 'package:flutter/material.dart';

import '../../../../lib.dart';

class PurpleAppBar extends AppBar {
  PurpleAppBar({
    super.key,
    super.actions,
  }) : super(
          title: const Row(
            children: [
              PurpleLogo(
                size: 30,
              ),
              SizedBox(width: 10),
              PurpleLogotype(),
            ],
          ),
          toolbarHeight: 90.0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[
                  AppColor.BODY_COLOR,
                  AppColor.SECONDARY,
                  AppColor.PRIMARY,
                ])),
          ),
        );
}
