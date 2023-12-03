import 'dart:convert';

import 'package:clean_app/main.dart';
import 'package:clean_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:clean_app/presentation_layer/components/custombutten.dart';
import 'package:clean_app/presentation_layer/components/customtextfild.dart';
import 'package:clean_app/presentation_layer/components/navbar.dart';
import 'package:clean_app/presentation_layer/components/show_dialog.dart';
import 'package:clean_app/presentation_layer/resources/color_manager.dart';
import 'package:clean_app/presentation_layer/resources/font_manager.dart';
import 'package:clean_app/presentation_layer/resources/msnge_api.dart';
import 'package:clean_app/presentation_layer/resources/strings_manager.dart';
import 'package:clean_app/presentation_layer/resources/styles_manager.dart';
import 'package:clean_app/presentation_layer/screen/auth_screen/auth_widget/DoubleDivider.dart';
import 'package:clean_app/presentation_layer/screen/auth_screen/auth_widget/SocialIcon.dart';
import 'package:clean_app/presentation_layer/screen/auth_screen/auth_widget/TextWithButtonTExt.dart';
import 'package:clean_app/presentation_layer/screen/auth_screen/forgot%20_password_screen/forgot_password_screen.dart';
import 'package:clean_app/presentation_layer/screen/auth_screen/siginup_screen/siginup_screen.dart';
import 'package:clean_app/presentation_layer/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/quickalert.dart';

String phone = "";
String pass = "";

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoad = false;
  @override
  Widget build(BuildContext context) {
    Future<void> login(String phone, String password) async {
      isLoad = true;
      setState(() {});
      try {
        print('fffffffffffffffffffffffffffffffffffffffffff');
        // Make a post request with the email and password
        final response = await http.post(
          Uri.parse(APiMange.login),
          body: {
            'phone': phone,
            'password': pass,
            "device_token": "Device Token From Firebase"
          },
        );

        if (response.statusCode == 200) {
          final message = jsonDecode(response.body)['message'];
          print(response.body);
          if (message == 'Incorrect Data') {
            showDilog(
              context,
              AppStrings.invalid_credentials.tr,
              type: QuickAlertType.info,
              onConfirmBtnTap: () {
                Get.back();
              },
            );
          } else {
            final data = jsonDecode(response.body)['data'];

            sharedPreferences.setInt('id', data['client']['id']);
            sharedPreferences.setString('name', data['client']['name'] ?? "");
            sharedPreferences.setString('email', data['client']['email']);
            sharedPreferences.setString('phone', data['client']['phone'] ?? "");
            sharedPreferences.setString(
                'profile_image', data['client']['profile_image'] ?? "");
            sharedPreferences.setString('token', data['access_token']);
            Get.offAll(() => Example());
            print("==============================================");
          }
        } else {
          print('zzzzzzzzzzzzzzzzzzzzzzzzzz');
          showDilog(
            context,
            AppStrings.invalid_credentials.tr,
            type: QuickAlertType.info,
            onConfirmBtnTap: () {
              Get.back();
            },
          );
        }
      } catch (e) {
        print("error : $e");
        showDilog(
          context,
          AppStrings.invalid_credentials.tr,
          type: QuickAlertType.info,
          onConfirmBtnTap: () {
            Get.back();
          },
        );
      }
      isLoad = false;
      setState(() {});
    }

    return Scaffold(
      backgroundColor: ColorManager.background,
      body: Container(
        alignment: Alignment.center,
        child: InfoWidget(
          builder: (context, deviceInfo) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: deviceInfo.screenHeight * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      'تسجيل الدخول',
                      style: MangeStyles().getBoldStyle(
                        color: ColorManager.kPrimary,
                        fontSize: FontSize.s25,
                      ),
                    ),
                  ),
                  // CircleAvatar(
                  //   radius: 80,
                  //   backgroundColor: ColorManager.background,
                  //   backgroundImage:
                  //       AssetImage('assets/icons/logoa_animal (2).png'),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextfeild(
                    valid: (p0) {},
                    onsaved: (p0) {},
                    onChanged: (p0) {
                      phone = p0.toString();
                    },
                    titel: 'رقم الهاتف',
                    width: 15,
                    height: 100,
                    icon: Icons.email,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextfeild(
                    valid: (p0) {},
                    onsaved: (p0) {},
                    obsecuer: true,
                    onChanged: (p0) {
                      pass = p0.toString();
                    },
                    titel: 'كلمة السر',
                    width: 15,
                    height: 100,
                    icon: Icons.lock,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: deviceInfo.localWidth * 0.03,
                      ),
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => ForgotPassword_Screen());
                        },
                        child: Text(
                          'نسيت كلمة السر',
                          style: MangeStyles().getBoldStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  isLoad == true
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomButton(
                          width: deviceInfo.localWidth * 0.8,
                          haigh: 60,
                          color: ColorManager.kPrimary,
                          text: 'تسجيل الدخول',
                          press: () {
                            if (phone.isNotEmpty && pass.isNotEmpty) {
                              login(phone, pass);
                            }
                          },
                        ),
                  DoubleDivider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialIcon(image: 'assets/icons/facebook.png'),
                      SizedBox(
                        width: 25,
                      ),
                      SocialIcon(image: 'assets/icons/google.png'),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextWithButtonTExt(
                    text1: 'ليس لديك حساب؟',
                    text2: 'اشتراك',
                    onTap: () {
                      Get.to(() => SiginupScreen());
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
