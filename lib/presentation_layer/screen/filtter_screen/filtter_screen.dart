import 'package:clean_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:clean_app/presentation_layer/components/appbar1.dart';
import 'package:clean_app/presentation_layer/components/custombutten.dart';
import 'package:clean_app/presentation_layer/resources/color_manager.dart';
import 'package:clean_app/presentation_layer/resources/font_manager.dart';
import 'package:clean_app/presentation_layer/resources/styles_manager.dart';
import 'package:clean_app/presentation_layer/utlis/header_title.dart';
import 'package:flutter/material.dart';

class FiltterScreen extends StatefulWidget {
  const FiltterScreen({Key? key}) : super(key: key);

  @override
  State<FiltterScreen> createState() => _FiltterScreenState();
}

class _FiltterScreenState extends State<FiltterScreen> {
  String dropdownvalue = 'ابوظبي';
  List<String> xservice = [
    "تنظيف سجاد ",
    "تلميع البلاط ",
    "شقق",
    "تعزيل مكاتب ",
  ];

  // List of items in our dropdown menu
  var items = [
    'ابوظبي',
    'دبي',
    'العين',
    'عجمان',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarscreen("فلتر"),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Wrap(
                  // crossAxisAlignment: WrapCrossAlignment.start,
                  // runAlignment: WrapAlignment.start,
                  // alignment: WrapAlignment.end,
                  // spacing: 15,
                  runSpacing: 20,
                  children: [
                    for (int i = 0; i < xservice.length; i++)
                      Container(
                        width: 120,
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: Color(0xFF007AFF).withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          shadows: [
                            BoxShadow(
                              color: Color(0x14001E3E),
                              blurRadius: 30,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Text(
                          xservice[i],
                          style: MangeStyles().getBoldStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s16,
                          ),
                        ),
                      )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                HeaderTitle(text: "الموظف"),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    ImageBox(image: "assets/images/woman.png", title: "انثي"),
                    SizedBox(
                      width: 20,
                    ),
                    ImageBox(image: "assets/images/man.png", title: "ذكر"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                HeaderTitle(text: "الموقع"),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: deviceInfo.localWidth * 0.9,
                  height: 55,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey[200],
                  ),
                  child: DropdownButton(
                    // Initial Value
                    value: dropdownvalue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                CustomButton(
                  width: 300,
                  haigh: 55,
                  color: ColorManager.kPrimary,
                  text: "تطبيق",
                  press: () {},
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class ImageBox extends StatelessWidget {
  const ImageBox({
    super.key,
    required this.image,
    required this.title,
  });
  final String image, title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 130,
      decoration: ShapeDecoration(
        color: Color(0xFF007AFF).withOpacity(0.2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        shadows: [
          BoxShadow(
            color: Color(0x14001E3E),
            blurRadius: 30,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 10,
            child: Text(
              title,
              style: MangeStyles().getBoldStyle(
                color: ColorManager.black,
                fontSize: FontSize.s16,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: Image.asset(
              image,
              height: 150,
            ),
          ),
        ],
      ),
    );
  }
}
