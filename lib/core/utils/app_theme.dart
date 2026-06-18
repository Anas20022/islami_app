import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    // scaffoldBackgroundColor: AppColors.transparentColor,
    //todo:We replaced this (scaffoldBackgroundColor) and put it in the home_screen because we have a lot of the screens the background is black
    scaffoldBackgroundColor: AppColors.blackColor,
    //todo:*********************************************************

    // canvasColor: AppColors.primaryColor
    //todo: This is a big problem if we write the canvasColor because if we use the BottomNavigationBar in another screen and
    //todo: we don't give him backgroundColor automatically change the color to the canvasColor ,
    //todo: example: Drawer,BottomNavigationBar,ModalBottomSheet this Includes the canvasColor ,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.blackColor,
      selectedLabelStyle: TextStyle(color: AppColors.whiteColor),
    ),
    //todo:*********************************************************

    //todo: this useful if the app have two mode of theme (dark mode and light mode) change the color of text automatic
    //todo: But if we have only one mode we can use the (app_style.dart)
    // textTheme: TextTheme(
    //   headlineSmall: TextStyle(
    //     fontSize: 16,
    //     color: AppColors.whiteColor,
    //     fontWeight: FontWeight.bold
    //   )
    // )
    //todo:    In the screen : if we need used the code:
    //todo:    Text("Most Recently", style: Theme.of(context).textTheme.headlineSmall),
    //todo:*********************************************************
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.blackColor,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
    ),
  );
}
