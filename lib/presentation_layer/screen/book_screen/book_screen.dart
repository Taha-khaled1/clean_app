import 'package:clean_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:clean_app/presentation_layer/components/appbar1.dart';
import 'package:clean_app/presentation_layer/components/custombutten.dart';
import 'package:clean_app/presentation_layer/resources/color_manager.dart';
import 'package:clean_app/presentation_layer/resources/font_manager.dart';
import 'package:clean_app/presentation_layer/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: appbarscreen('الحجوزات'),
      body: Container(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: 350,
              height: 200,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x0A000000),
                    blurRadius: 48,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 105,
                        height: 110,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/clean_ex.png"),
                            fit: BoxFit.cover,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(-10, 15),
                        child: Column(
                          children: [
                            Text(
                              "سمر محمد",
                              style: MangeStyles().getBoldStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s16,
                              ),
                            ),
                            Text(
                              "تنظيف بيوت",
                              style: MangeStyles().getRegularStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s14,
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              '4.9 (120 تقييم)',
                              style: MangeStyles().getRegularStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s12,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '50د',
                              style: TextStyle(
                                color: Color(0xFFFF9000),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: '/اليوم ',
                              style: TextStyle(
                                color: Colors.black
                                    .withOpacity(0.5299999713897705),
                                fontSize: 13,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "التاريخ \n 02 Sep 2022, Fri",
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        "الوقت \n 12:00 AM",
                        textAlign: TextAlign.right,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 100,
                        height: 38,
                        decoration: ShapeDecoration(
                          color: Color(0xFFE3F4E9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text("جاري التنفيذ"),
                      )
                    ],
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
