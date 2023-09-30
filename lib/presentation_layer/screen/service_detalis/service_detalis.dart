import 'package:clean_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:clean_app/presentation_layer/components/custombutten.dart';
import 'package:clean_app/presentation_layer/resources/color_manager.dart';
import 'package:clean_app/presentation_layer/resources/font_manager.dart';
import 'package:clean_app/presentation_layer/resources/styles_manager.dart';
import 'package:clean_app/presentation_layer/screen/account_screen/account_screen.dart';
import 'package:clean_app/presentation_layer/screen/apppointment_screen/apppointment_screen.dart';
import 'package:clean_app/presentation_layer/utlis/header_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceDetalisScreen extends StatelessWidget {
  const ServiceDetalisScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: 375,
        height: 99,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
        ),
        child: InfoWidget(
          builder: (context, deviceInfo) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomButton(
                  width: 140,
                  haigh: 60,
                  color: ColorManager.kPrimary,
                  text: "احجز الآن",
                  press: () {
                    Get.to(() => ApppointmentScreen());
                  },
                ),
                CustomButton(
                  width: 140,
                  haigh: 60,
                  color: ColorManager.white,
                  colorText: ColorManager.kPrimary,
                  text: "تواصل",
                  press: () {
                    Get.to(() => AccountScreen());
                  },
                ),
              ],
            );
          },
        ),
      ),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  width: double.infinity,
                  height: 334,
                  decoration: BoxDecoration(
                    // image: DecorationImage(
                    //   image: AssetImage("assets/images/doc.png"),
                    // ),
                    gradient: LinearGradient(
                      begin: Alignment(0.75, -0.67),
                      end: Alignment(-0.75, 0.67),
                      colors: [
                        Color(0xFFFF9000),
                        Color(0xFF9EBFDF),
                        Color(0xFFC8C8EA)
                      ],
                    ),
                  ),
                  child: Image.asset("assets/images/doc.png"),
                ),
                Transform.translate(
                  offset: Offset(0, -10),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    width: double.infinity,
                    height: deviceInfo.localHeight,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x11000000),
                          blurRadius: 20,
                          offset: Offset(0, -8),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "تنظيف شركات",
                              style: MangeStyles().getBoldStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s18,
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Icon(
                              Icons.share,
                              size: 35,
                            ),
                            Icon(
                              Icons.book,
                              size: 35,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              "حسن مسعود",
                              style: MangeStyles().getBoldStyle(
                                color: ColorManager.kPrimary,
                                fontSize: FontSize.s18,
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
                                      fontSize: 18,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '/اليوم ',
                                    style: TextStyle(
                                      color: Colors.black
                                          .withOpacity(0.5299999713897705),
                                      fontSize: 18,
                                      fontFamily: 'Cairo',
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
                        Align(
                          alignment: AlignmentDirectional(-0.99, 0.2),
                          child: Text(
                            '⭐ 4.9 (100 تقييم)',
                            style: MangeStyles().getBoldStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.s18,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 30,
                              color: ColorManager.kPrimary,
                            ),
                            Text(
                              'ابوظبي',
                              style: MangeStyles().getBoldStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s18,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        HeaderTitle(text: "نبذة عني "),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. At nullam vulputate consectetur eget. Morbi donec ulputate consectetur eget. Morbi donec قراءة المزيد ... ",
                          ),
                        ),
                        GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                2, // This defines the number of items in a row. Adjust as needed.
                            childAspectRatio:
                                1.4, // Adjust for your desired width/height ratio
                            crossAxisSpacing:
                                10, // Spacing between the items in a row
                            mainAxisSpacing: 10, // Spacing between the rows
                          ),
                          itemCount: 6,
                          itemBuilder: (BuildContext context, int index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                "assets/images/clean_examp.png",
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
