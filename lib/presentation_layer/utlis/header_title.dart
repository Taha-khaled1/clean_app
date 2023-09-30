import 'package:clean_app/presentation_layer/resources/color_manager.dart';
import 'package:clean_app/presentation_layer/resources/font_manager.dart';
import 'package:clean_app/presentation_layer/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-0.85, 0.2),
      child: Text(
        text,
        style: MangeStyles().getBoldStyle(
          color: ColorManager.black,
          fontSize: FontSize.s16,
        ),
      ),
    );
  }
}
