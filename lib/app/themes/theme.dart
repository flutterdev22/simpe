import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // scaffoldBackgroundColor: kPrimaryColor,
        // accentColor: kPrimaryColor,
        fontFamily: "DMSans",
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          // color: kPrimaryColor,
        ),
        // primaryColor: kappThemeColor,
        // canvasColor: kContainerBackgroundColor,
        textTheme: MyTheme.textTheme,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        // canvasColor: Colors.red,

        cardTheme: CardTheme(
            elevation: 4,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),

        bottomAppBarColor: Colors.white,

        // canvasColor: kappThemeColor,
        elevatedButtonTheme: elevatedButtons(context),
      );

  static ElevatedButtonThemeData elevatedButtons(BuildContext context) =>
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        // primary: kappThemeColor,
        shape: StadiumBorder(),
        textStyle: Theme.of(context).textTheme.headline1,
        fixedSize: Size(180, 45),
      ));

  static TextTheme textTheme = TextTheme(
    headline1: const TextStyle(
      fontSize: 32,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    headline2: TextStyle(
        fontSize: 21.sp,
        color: kYellowColor,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.1),
    headline3: TextStyle(
        fontSize: 12.sp,
        color: kGreyColor,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1),
    headline4: TextStyle(
        fontSize: 14.sp,
        color: kGreyColor,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1),
    headline5: const TextStyle(
        fontSize: 15,
        color: kFontGrey,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1),
    headline6: const TextStyle(
        fontSize: 12, fontWeight: FontWeight.w400, color: kGreyColor),
    subtitle1: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
    ),
    subtitle2: const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyText1: const TextStyle(
        fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.5),
    bodyText2: const TextStyle(
        fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    caption: const TextStyle(
        fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4),
    button: const TextStyle(
        fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1.25),
    overline: const TextStyle(
        fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  );
}
