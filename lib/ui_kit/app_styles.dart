import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppStyles {
  static TextStyle quicksandW700White(double fontSize) {
    return TextStyle(
        fontFamily: 'Quicksand',
        height: 1,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: AppColors.white
    );
  }

  static TextStyle quicksandW600White(double fontSize) {
    return TextStyle(
      fontFamily: 'Quicksand',
      height: 1,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: AppColors.white
    );
  }

  static TextStyle quicksandW600Black(double fontSize) {
    return TextStyle(
        fontFamily: 'Quicksand',
        height: 1,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: AppColors.black
    );
  }

  static TextStyle quicksandW500White(double fontSize) {
    return TextStyle(
        fontFamily: 'Quicksand',
        height: 1,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: AppColors.white
    );
  }

  static TextStyle quicksandW400Gray(double fontSize) {
    return TextStyle(
        fontFamily: 'Quicksand',
        height: 1,
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: AppColors.gray
    );
  }
}