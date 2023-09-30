import 'package:clean_app/presentation_layer/components/appbar1.dart';
import 'package:clean_app/presentation_layer/components/navbar.dart';
import 'package:clean_app/presentation_layer/resources/color_manager.dart';
import 'package:clean_app/presentation_layer/resources/font_manager.dart';
import 'package:clean_app/presentation_layer/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class NotficationScreen extends StatelessWidget {
  const NotficationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: appbarscreen('الاشعارات'),
      body: Container(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              height: 100,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 35,
                    backgroundImage: AssetImage('assets/images/clean_ex.png'),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      Text(
                        ' خصم 50%',
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s18,
                        ),
                      ),
                      SizedBox(height: 1),
                      Text(
                        'افحص التافصيل',
                        style: MangeStyles().getBoldStyle(
                          color: Colors.grey,
                          fontSize: FontSize.s18,
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
