import 'package:flutter/material.dart';
import 'package:taskati_3_8/core/utils/app_colors.dart';

TextStyle getTitleStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
      color: color ?? AppColors.black,
      fontWeight: fontWeight ?? FontWeight.bold,
      fontSize: fontSize ?? 18);
}

TextStyle getBodyStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
      color: color ?? AppColors.black,
      fontWeight: fontWeight ?? FontWeight.w500,
      fontSize: fontSize ?? 16);
}

TextStyle getSmallStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
      color: color ?? AppColors.grey,
      fontWeight: fontWeight ?? FontWeight.normal,
      fontSize: fontSize ?? 14);
}
