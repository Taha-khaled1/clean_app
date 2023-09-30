import 'package:clean_app/presentation_layer/resources/color_manager.dart';
import 'package:clean_app/presentation_layer/resources/styles_manager.dart';
import 'package:flutter/material.dart';

import '../resources/font_manager.dart';

class CustomTextfeild extends StatelessWidget {
  final String titel;
  final bool? obsecuer;
  final IconData? icon;
  final IconData? suffixIcon;
  final void Function()? iconontap;
  final String? Function(String?)? onsaved;
  final String? Function(String?)? valid;
  final double width, height;
  final TextDirection? textDirection;
  final String? inialvalue;
  final BorderStyle? isBoarder;
  final int? maxLines;
  final Color? fillColor;
  final bool? isenabledBorder;
  final bool readOnly;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final String? text;
  const CustomTextfeild({
    super.key,
    this.iconontap,
    this.obsecuer,
    this.icon,
    required this.valid,
    required this.onsaved,
    required this.titel,
    required this.width,
    required this.height,
    this.textDirection,
    this.inialvalue,
    this.isBoarder,
    this.maxLines,
    this.fillColor,
    this.isenabledBorder = true,
    this.readOnly = false,
    this.onTap,
    this.text,
    this.suffixIcon,
    this.onChanged,
  });
// 70 122
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width),
      child: Column(
        children: [
          if (text != null)
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                text!,
                style: MangeStyles().getBoldStyle(
                  color: ColorManager.kPrimary,
                  fontSize: FontSize.s20,
                ),
              ),
            ),
          SizedBox(
            height: 55,
            child: TextFormField(
              onChanged: onChanged,
              onTap: onTap,
              readOnly: readOnly,
              // maxLines: maxLines,
              initialValue: inialvalue,
              textDirection: textDirection,
              obscureText: obsecuer == null ? false : obsecuer!,
              onSaved: onsaved,
              validator: valid,
              decoration: InputDecoration(
                prefixIcon: icon != null
                    ? IconButton(
                        onPressed: iconontap,
                        icon: Icon(icon),
                      )
                    : null,
                suffixIcon: suffixIcon != null
                    ? IconButton(
                        onPressed: iconontap,
                        icon: Icon(
                          icon,
                          color: Colors.black,
                        ),
                      )
                    : null,
                enabledBorder: isenabledBorder == true
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                          width: 1.2,
                          style: isBoarder ?? BorderStyle.solid,
                          color: ColorManager.grey2,
                        ), //<-- SEE HERE
                      )
                    : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                          width: 0,
                          // style: BorderStyle.none,
                          color: ColorManager.grey2,
                        ), //<-- SEE HERE
                      ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    width: 1.2,
                    // style: BorderStyle.none,
                    color: ColorManager.grey2,
                  ), //<-- SEE HERE
                ),

                //  enabled: true,
                filled: true,
                fillColor: fillColor ?? ColorManager.textfieldColor,
                hintText: titel,
                hintStyle: MangeStyles().getLightStyle(
                  color: ColorManager.black,
                  fontSize: FontSize.s16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
