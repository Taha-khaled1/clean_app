import 'package:clean_app/application_layer/utils/valid.dart';
import 'package:clean_app/main.dart';
import 'package:clean_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:clean_app/presentation_layer/components/appbar1.dart';
import 'package:clean_app/presentation_layer/components/custombutten.dart';
import 'package:clean_app/presentation_layer/components/customtextfild.dart';
import 'package:clean_app/presentation_layer/handlingView/handlingview.dart';
import 'package:clean_app/presentation_layer/resources/color_manager.dart';
import 'package:clean_app/presentation_layer/resources/font_manager.dart';
import 'package:clean_app/presentation_layer/resources/strings_manager.dart';
import 'package:clean_app/presentation_layer/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:clean_app/presentation_layer/screen/support_screen/support_controller/support_controller.dart';

class SupportProblemScreen extends StatelessWidget {
  const SupportProblemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SupportController controller = Get.put(SupportController());
    return Scaffold(
      appBar: appbarscreen("الدعم الفني"),
      backgroundColor: ColorManager.background,
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return Form(
            key: controller.formkeysigin,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: deviceInfo.localWidth * 0.04,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: sharedPreferences.getString('lang') == 'en'
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Text(
                        AppStrings.name.tr,
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.kPrimary,
                          fontSize: FontSize.s20,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextfeild(
                      valid: (p0) {
                        return validInput(p0.toString(), 2, 100, 'name');
                      },
                      onsaved: (p0) {
                        return controller.name = p0!;
                      },
                      titel: AppStrings.name.tr,
                      width: 0,
                      height: 70,
                      isenabledBorder: false,
                    ),
                    const SizedBox(height: 15),
                    Align(
                      alignment: sharedPreferences.getString('lang') == 'en'
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Text(
                        AppStrings.email.tr,
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.kPrimary,
                          fontSize: FontSize.s20,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextfeild(
                      valid: (p0) {
                        return validInput(p0.toString(), 5, 100, 'email');
                      },
                      onsaved: (p0) {
                        return controller.email = p0!;
                      },
                      titel: AppStrings.email.tr,
                      width: 0,
                      height: 70,
                      isenabledBorder: false,
                    ),
                    const SizedBox(height: 15),
                    Align(
                      alignment: sharedPreferences.getString('lang') == 'en'
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Text(
                        AppStrings.phone.tr,
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.kPrimary,
                          fontSize: FontSize.s20,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextfeild(
                      valid: (p0) {
                        return validInput(p0.toString(), 5, 100, 'phone');
                      },
                      onsaved: (p0) {
                        return controller.phone = p0!;
                      },
                      titel: AppStrings.phone.tr,
                      width: 0,
                      height: 70,
                      isenabledBorder: false,
                    ),
                    const SizedBox(height: 15),
                    Align(
                      alignment: sharedPreferences.getString('lang') == 'en'
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Text(
                        AppStrings.message.tr,
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.kPrimary,
                          fontSize: FontSize.s20,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      style: TextStyle(color: Colors.grey),
                      maxLines: 5,
                      validator: (value) {
                        return validInput(value.toString(), 10, 400, 'massge');
                      },
                      onSaved: (newValue) {
                        controller.message = newValue!;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.2),
                        hintText: '...',
                        hintStyle: MangeStyles().getLightStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s16,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    GetBuilder<SupportController>(
                      builder: (controller) {
                        return HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: CustomButton(
                            width: deviceInfo.localWidth * 0.95,
                            haigh: 60,
                            color: ColorManager.kPrimary,
                            text: AppStrings.save,
                            press: () {
                              controller.contactUs(context);
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final String iconData;
  final Color? color1;
  final Color? color2;
  final double? size;
  final double? sizedsvg;
  const CircleButton({
    Key? key,
    required this.onTap,
    required this.iconData,
    this.color1,
    this.color2,
    this.size,
    this.sizedsvg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sized = 70.0;

    return InkResponse(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: size ?? sized,
        height: size ?? sized,
        decoration: BoxDecoration(
          color: color1,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconData,
          color: color2,
          width: sizedsvg ?? 35,
        ),
      ),
    );
  }
}
