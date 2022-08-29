import 'package:flutter/material.dart';
import 'package:pattern_insert_delete/theme_data/app_color.dart';
import 'package:pattern_insert_delete/theme_data/app_font.dart';
import 'package:sizer/sizer.dart';

class AppTextStyle {
  // final BuildContext context;
  //
  // TextStyles(this.context);
  //
  // TextStyle getPageTitleStyle() {
  //   return Theme.of(context).textTheme.headline6!.copyWith(
  //       fontSize: 24,
  //       color: AppColor.black,
  //       fontWeight: FontWeight.w500);
  // }
  TextStyle ButtonStyle() {
    return TextStyle(
        color: AppColor.black,
        fontFamily: AppFont.pacifico_regular,
        fontSize: 18.sp);
  }
}
