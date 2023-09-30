import 'package:clean_app/presentation_layer/resources/color_manager.dart';
import 'package:clean_app/presentation_layer/resources/font_manager.dart';
import 'package:clean_app/presentation_layer/resources/styles_manager.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appbarscreen(String title) {
  return AppBar(
    elevation: 0,
    backgroundColor: ColorManager.background,
    leading: BackButton(
      color: ColorManager.kPrimary,
    ),
    centerTitle: true,
    title: Text(
      title,
      style: MangeStyles().getBoldStyle(
        color: ColorManager.black,
        fontSize: FontSize.s18,
      ),
    ),
    toolbarHeight: 70,
  );
}

PreferredSizeWidget appbar({String? title, bool isBack = true}) {
  return AppBar(
    elevation: 0,
    backgroundColor: ColorManager.background,
    leading: isBack == true
        ? BackButton(
            color: ColorManager.black,
          )
        : SizedBox(),
    centerTitle: false,
    title: Transform.translate(
      offset: Offset(isBack == false ? -38 : 0, 0),
      child: Text(
        title ?? '',
        style: TextStyle(
          color: Color(0xFF212121),
          fontSize: 24,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w700,
          height: 1.20,
        ),
      ),
    ),
  );
}
