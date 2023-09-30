import 'package:flutter_html/flutter_html.dart';
import 'package:clean_app/presentation_layer/components/appbar1.dart';
import 'package:clean_app/presentation_layer/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:clean_app/presentation_layer/resources/strings_manager.dart';
import 'package:get/get.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarscreen(AppStrings.about_us.tr),
      backgroundColor: ColorManager.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Column(
            children: <Widget>[
              Html(
                data: AppStrings.about_content.tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
