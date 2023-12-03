import 'package:carousel_slider/carousel_slider.dart';
import 'package:clean_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:clean_app/presentation_layer/components/customtextfild.dart';
import 'package:clean_app/presentation_layer/resources/color_manager.dart';
import 'package:clean_app/presentation_layer/resources/font_manager.dart';
import 'package:clean_app/presentation_layer/resources/styles_manager.dart';
import 'package:clean_app/presentation_layer/screen/filtter_screen/filtter_screen.dart';
import 'package:clean_app/presentation_layer/screen/home_screen/widget/Titelmore.dart';
import 'package:clean_app/presentation_layer/screen/notfiction_screen/notfiction_screen.dart';
import 'package:clean_app/presentation_layer/screen/service_detalis/service_detalis.dart';
import 'package:clean_app/presentation_layer/utlis/header_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controlller/home_controlller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeController homecon = Get.put(HomeController());
    return Scaffold(
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return homecon.isload
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: deviceInfo.localWidth,
                        height: 225,
                        decoration: ShapeDecoration(
                          color: Color(0xFFFF9000),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage:
                                      AssetImage("assets/images/Rectangle.png"),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'احمد علي',
                                  style: MangeStyles().getBoldStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s16,
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.to(() => NotficationScreen());
                                  },
                                  icon: Icon(
                                    Icons.notifications_none_outlined,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'ابوظبي',
                                    style: MangeStyles().getBoldStyle(
                                      color: ColorManager.black,
                                      fontSize: FontSize.s16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: deviceInfo.localWidth * 0.8,
                                    child: CustomTextfeild(
                                      valid: (p0) {},
                                      onsaved: (p0) {},
                                      titel: " ",
                                      width: deviceInfo.localWidth * 0.0,
                                      height: 56,
                                      suffixIcon: Icons.search,
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => FiltterScreen());
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(right: 10),
                                      width: 50,
                                      height: 50,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: Image.asset(
                                          "assets/images/Filter.png"),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      HeaderTitle(text: 'العروض اليومية'),
                      Container(
                        // margin: EdgeInsets.symmetric(horizontal: 12),
                        width: MediaQuery.of(context).size.width * 1,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: CarouselSlider(
                          items: controller.ximageoffer,
                          options: CarouselOptions(
                            height: 450,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.95,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.2,
                            // onPageChanged: callbackFunction,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        // child: Carousel(
                        //   images: [
                        //     NetworkImage(
                        //         'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
                        //     NetworkImage(
                        //         'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
                        //     ExactAssetImage("assets/images/REO.png")
                        //   ],
                        // ),
                      ),
                      Titelmore(text1: "الخدمات ", text2: ""),
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: homecon.servicesModels?.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              width: 120,
                              height: 102,
                              decoration: ShapeDecoration(
                                color: Color.fromARGB(255, 220, 232, 239),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundImage: NetworkImage(
                                      homecon.servicesModels?.data![index]
                                              .icon ??
                                          "",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    homecon.servicesModels?.data![index]
                                            .title ??
                                        "",
                                    style: MangeStyles().getBoldStyle(
                                      color: ColorManager.kPrimary2,
                                      fontSize: FontSize.s14,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Titelmore(text1: " الأكثر تقييما  ", text2: ""),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => ServiceDetalisScreen());
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              width: 400,
                              height: 135,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x11000000),
                                    blurRadius: 20,
                                    offset: Offset(0, 6),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 105,
                                    height: 110,
                                    decoration: ShapeDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/clean_ex.png"),
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
                                            color: Colors.black.withOpacity(
                                                0.5299999713897705),
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
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
