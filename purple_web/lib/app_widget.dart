import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'lib.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    DM.get<IAdaptativeSizer>().initialize(MediaQuery.of(context).size);
    return CalendarControllerProvider(
      controller: EventController(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: APP_NAME,
        theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: GoogleFonts.catamaran(
            color: AppColor.TEXT_COLOR,
          ).fontFamily,
          appBarTheme: AppBarTheme(
            centerTitle: false,
            backgroundColor: AppColor.PRIMARY,
            titleTextStyle: GoogleFonts.catamaran(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColor.INVERTED_TEXT_COLOR,
            ),
            actionsIconTheme: const IconThemeData(color: AppColor.PRIMARY),
            iconTheme: const IconThemeData(color: AppColor.PRIMARY),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              iconColor: MaterialStateProperty.all(AppColor.TEXT_COLOR),
              foregroundColor: MaterialStateProperty.all(AppColor.TEXT_COLOR),
              textStyle: MaterialStateProperty.all(
                GoogleFonts.catamaran(),
              ),
            ),
          ),
          iconTheme: const IconThemeData(
            color: AppColor.TEXT_COLOR,
          ),
          iconButtonTheme: IconButtonThemeData(
              style: ButtonStyle(
                  iconColor: MaterialStateProperty.all(AppColor.TEXT_COLOR),
                  foregroundColor:
                      MaterialStateProperty.all(AppColor.TEXT_COLOR),
                  textStyle: MaterialStateProperty.all(
                    GoogleFonts.catamaran(
                      color: AppColor.TEXT_COLOR,
                    ),
                  ))),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(AppColor.TEXT_COLOR),
              textStyle: MaterialStateProperty.all(
                GoogleFonts.catamaran(),
              ),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: GoogleFonts.catamaran(),
          ),
          cardTheme: const CardTheme(color: AppColor.BODY_COLOR),
          primaryColor: AppColor.PRIMARY,
          highlightColor: AppColor.SECONDARY,
          scaffoldBackgroundColor: AppColor.BG_COLOR,
        ),
        routerConfig: Modular.routerConfig,
        //scrollBehavior: const ScrollBehavior().copyWith(
        //  dragDevices: {
        //    PointerDeviceKind.trackpad,
        //    PointerDeviceKind.mouse,
        //    PointerDeviceKind.touch,
        //  },
        //),
      ),
    );
  }
}
