import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparentColor,

    // canvasColor: AppColors.primaryColor
    //todo: This is a big problem if we write the canvasColor because if we use the BottomNavigationBar in another screen and
    //todo: we don't give him backgroundColor automatically change the color to the canvasColor ,
    //todo: example: Drawer,BottomNavigationBar,ModalBottomSheet this Includes the canvasColor ,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.blackColor,
      selectedLabelStyle: TextStyle(color: AppColors.whiteColor),
    ),
  );
}
