import 'package:flutter/material.dart';

class ThemeProvider {
  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyText1: TextStyle(fontSize: 16),
      bodyText2: TextStyle(fontSize: 16),
    ).apply(
      bodyColor: black,
      displayColor: black,
    ),

    colorScheme: const ColorScheme.light(
        primary: Colors.green), //DatePicker header color
    appBarTheme: appBarTheme,
  );

  //  Colors
  static const Color green = Color(0xff2CC84D);
  static const Color darkGreen = Color(0xff275029);
  static const Color green2 = Color(0xff61a25b);
  static const Color black = Color(0xff2B2D3A);
  static const Color grey = Color(0xff677798);
  static const Color lightGrey = Color(0xffF5F4F4);
  static const Color darkBlue = Color(0xff244875);
  static const Color beige = Color(0xffE2D3C5);
  static const Color lightBeige = Color(0xfff8f6f3);
  static const Color lightGrey2 = Color(0xfff0f1f5);
  static const Color red = Color(0xffFF103B);
  static const Color orange = Color(0xffF9A000);
  static const Color yellow = Color(0xffFFE70D);
  static const Color white = Color(0xffFFFFFF);
  static const Color grey2 = Color(0xff677798);

  //  Dimens
  static const double horizontalPadding = 16;
  static const double bottomBarPadding = 100;
  static const double verticalPadding = 40;
  static const double formFieldsPadding = 16;
  static const double cornerRadius16 = 16;
  static const double cornerRadius8 = 8;
  static const double cornerRadius100 = 100;
  static const double bottomPadding = 20;

//style

  static const TextStyle headerStyle =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w700);

  // Shadow
  static List<BoxShadow> shadow = [
    BoxShadow(
        color: ThemeProvider.grey.withOpacity(0.15),
        spreadRadius: 5,
        blurRadius: 10,
        offset: const Offset(0, 0)),
  ];

  static List<BoxShadow> shadow2 = [
    BoxShadow(
        color: ThemeProvider.grey.withOpacity(0.15),
        spreadRadius: 2,
        blurRadius: 10,
        offset: const Offset(0, 0)),
  ];

  static AppBarTheme get appBarTheme {
    return AppBarTheme(
        elevation: 0,
        centerTitle: true,
        color: Colors.transparent,
        iconTheme: const IconThemeData(
          color: black,
        ),
        toolbarTextStyle: const TextTheme(
                headline6: TextStyle(
                    color: black, fontWeight: FontWeight.bold, fontSize: 16))
            .bodyText2,
        titleTextStyle: const TextTheme(
                headline6: TextStyle(
                    color: black, fontWeight: FontWeight.bold, fontSize: 16))
            .headline6);
  }
}
