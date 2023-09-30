import 'package:flutter/foundation.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'application_layer/app/myapp.dart';

late SharedPreferences sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  if (sharedPreferences.getString("lang") == null) {
    sharedPreferences.setString("lang", 'ar');
  }
  sharedPreferences.setString("lang", 'ar');
  // final id = sharedPreferences.getInt('id');
  // final name = sharedPreferences.getString('name');
  // final email = sharedPreferences.getString('email');
  // final phone = sharedPreferences.getString('phone');

  // final token = sharedPreferences.setString('token',
  //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovLzc3bHMuYWUvYXBpL2xvZ2luIiwiaWF0IjoxNjg4Mjc2Njc1LCJleHAiOjE2ODgyODAyNzUsIm5iZiI6MTY4ODI3NjY3NSwianRpIjoiOE1ja1lwMnVqR1NlcnFiSiIsInN1YiI6IjIiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.IVqP1kW1COocbOM_pSvSLXtI-1hRhrWGIAvrYvSzxHg');

  // print('id: $id');
  // print('name: $name');
  // print('email: $email');
  // print('phone: $phone');
  // print('token: $token');
  // runApp(
  //   MyApp(),
  // );
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );

  // runApp(
  //   MyApp(),
  // );
}
