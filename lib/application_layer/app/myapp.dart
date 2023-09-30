import 'package:clean_app/application_layer/service/localizetion/changelangue.dart';
import 'package:clean_app/application_layer/service/localizetion/translate.dart';
import 'package:clean_app/presentation_layer/resources/routes_pages.dart';
import 'package:clean_app/presentation_layer/resources/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      locale: controller.language,
      theme: getApplicationTheme(),
      // home: TestScreen(),
      getPages: getPage,
    );
  }
}
