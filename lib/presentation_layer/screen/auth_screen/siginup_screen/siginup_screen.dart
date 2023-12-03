import 'package:clean_app/main.dart';
import 'package:clean_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:clean_app/presentation_layer/components/appbar1.dart';
import 'package:clean_app/presentation_layer/components/custombutten.dart';
import 'package:clean_app/presentation_layer/components/customtextfild.dart';
import 'package:clean_app/presentation_layer/components/navbar.dart';
import 'package:clean_app/presentation_layer/components/show_dialog.dart';
import 'package:clean_app/presentation_layer/resources/color_manager.dart';
import 'package:clean_app/presentation_layer/resources/font_manager.dart';
import 'package:clean_app/presentation_layer/resources/msnge_api.dart';
import 'package:clean_app/presentation_layer/resources/styles_manager.dart';
import 'package:clean_app/presentation_layer/screen/auth_screen/auth_widget/TextWithButtonTExt.dart';
import 'package:clean_app/presentation_layer/screen/auth_screen/login_screen/login_screen.dart';
import 'package:clean_app/presentation_layer/screen/auth_screen/siginup_screen/widget/AccpetPrivecy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quickalert/models/quickalert_type.dart';

class SiginupScreen extends StatefulWidget {
  const SiginupScreen({Key? key}) : super(key: key);

  @override
  State<SiginupScreen> createState() => _SiginupScreenState();
}

class _SiginupScreenState extends State<SiginupScreen> {
  final _formKey = GlobalKey<FormState>();

// 2. Create variables to hold the form data
  String? _name;
  String? _email;
  String? _phone;
  String? _password;
  String? _passwordConfirmation;
  bool isload = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarscreen(''),
      backgroundColor: ColorManager.background,
      body: Form(
        key: _formKey,
        child: InfoWidget(
          builder: (context, deviceInfo) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: deviceInfo.screenHeight * 0.06,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'انشاء حساب جديد',
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.kPrimary,
                          fontSize: FontSize.s20,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'أنشئ حساب جديد للاستفادة من خدماتنا ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF707070),
                          fontSize: 16,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextfeild(
                    valid: (value) {
                      if (value!.isEmpty) return 'Please enter a name';
                      return null;
                    },
                    onsaved: (value) {
                      _name = value;
                    },
                    titel: 'الاسم الكامل',
                    width: 15,
                    height: 100,
                    icon: Icons.person,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextfeild(
                    valid: (value) {
                      if (value!.isEmpty) return 'Please enter an phone';
                      // You can add more validation for email format
                      return null;
                    },
                    onsaved: (value) {
                      _phone = value;
                    },
                    titel: 'رقم الهاتف',
                    width: 15,
                    height: 100,
                    icon: Icons.phone,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextfeild(
                    valid: (value) {
                      if (value!.isEmpty) return 'Please enter an email';
                      // You can add more validation for email format
                      return null;
                    },
                    onsaved: (value) {
                      _email = value;
                    },
                    titel: 'البريد الاكتروني',
                    width: 15,
                    height: 100,
                    icon: Icons.email,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextfeild(
                    obsecuer: true,
                    valid: (value) {
                      if (value!.isEmpty) return 'Please enter a password';
                      return null;
                    },
                    onsaved: (value) {
                      _password = value;
                    },
                    onChanged: (value) {
                      _password = value;
                    },
                    titel: 'كلمة السر',
                    width: 15,
                    height: 100,
                    icon: Icons.lock,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextfeild(
                    obsecuer: true,
                    valid: (value) {
                      if (value != _password) return 'Passwords do not match';
                      return null;
                    },
                    onsaved: (value) {
                      _passwordConfirmation = value;
                    },
                    titel: 'تاكيد كلمة السر',
                    width: 15,
                    height: 100,
                    icon: Icons.lock,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  !isload
                      ? CustomButton(
                          width: deviceInfo.localWidth * 0.8,
                          haigh: 60,
                          color: ColorManager.kPrimary,
                          text: 'انشاء الحساب',
                          press: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              bool isRegistered = await registerUser(
                                name: _name!,
                                email: _email!,
                                phone: _phone!,
                                password: _password!,
                                passwordConfirmation: _passwordConfirmation!,
                              );
                              isload = false;
                              setState(() {});
                              if (isRegistered) {
                                print('Successfully registered!');
                                Get.offAll(() => Example());
                              } else {
                                isload = false;
                                setState(() {});
                                print('Failed to register.');
                                showDilog(
                                  context,
                                  "Failed to register.",
                                  type: QuickAlertType.error,
                                );
                              }
                            }
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
                  SizedBox(
                    height: 15,
                  ),
                  TextWithButtonTExt(
                    text1: 'امتلك  حساب؟',
                    text2: 'تسجيل الدخول',
                    onTap: () async {
                      Get.to(() => LoginScreen());
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

  Future<bool> registerUser({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    isload = true;
    setState(() {});

    final response = await http.post(
      Uri.parse(APiMange.register),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
        'password_confirmation': passwordConfirmation,
        "emirate_id": 1,
        "device_token": "Device Token From Firebase",
        "device_type": "ios"
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body)['data'];

      sharedPreferences.setInt('id', data['client']['id']);
      sharedPreferences.setString('name', data['client']['name'] ?? "");
      sharedPreferences.setString('email', data['client']['email']);
      sharedPreferences.setString('phone', data['client']['phone'] ?? "");
      sharedPreferences.setString(
          'profile_image', data['client']['profile_image'] ?? "");
      sharedPreferences.setString('token', data['access_token']);

      return true;
    } else {
      print('Registration failed with status: ${response.statusCode}.');
      print('Error body: ${response.body}.');

      return false;
    }
  }
}
