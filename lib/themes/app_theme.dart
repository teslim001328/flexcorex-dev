import 'package:flutter/material.dart';
import 'package:flexcorex/themes/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.deepTeal,
    scaffoldBackgroundColor: AppColors.offWhite,
    cardColor: Colors.white,
    textTheme: TextTheme(
      bodyText2: TextStyle(color: AppColors.matteBlack),
      subtitle1: TextStyle(color: AppColors.darkEmeraldGreen),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkEmeraldGreen,
    scaffoldBackgroundColor: AppColors.richCharcoalGray,
    cardColor: AppColors.richCharcoalGray,
    textTheme: TextTheme(
      bodyText2: TextStyle(color: AppColors.offWhite),
      subtitle1: TextStyle(color: AppColors.champagneGold),
    ),
  );
}
