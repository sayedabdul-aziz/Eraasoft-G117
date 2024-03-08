import 'package:flutter/material.dart';
import 'package:taskati_3_8/core/utils/app_colors.dart';

showErrorDialog(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: AppColors.red, content: Text(text)));
}
