import 'package:clean_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:clean_app/presentation_layer/components/appbar1.dart';
import 'package:clean_app/presentation_layer/components/custombutten.dart';
import 'package:clean_app/presentation_layer/resources/color_manager.dart';
import 'package:clean_app/presentation_layer/resources/font_manager.dart';
import 'package:clean_app/presentation_layer/resources/styles_manager.dart';
import 'package:clean_app/presentation_layer/utlis/header_title.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SaveServiceScreen extends StatefulWidget {
  const SaveServiceScreen({
    super.key,
  });

  @override
  State<SaveServiceScreen> createState() => _SaveServiceScreenState();
}

class _SaveServiceScreenState extends State<SaveServiceScreen> {
  Time _time = Time(hour: 11, minute: 30, second: 20);
  bool iosStyle = true;
  String data = '';
  Time? isnewTime;
  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime;
      print(newTime);
    });
  }

  var paymentIntent = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarscreen('حجز الخدمه'),
      backgroundColor: ColorManager.background,
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Text(
                  "حدد اليوم والتاريخ ",
                  style: MangeStyles().getBoldStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s18,
                  ),
                ),
              ),
              SfDateRangePicker(
                selectionColor: ColorManager.kPrimary,
                todayHighlightColor: ColorManager.kPrimary2,
                onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
                  data = dateRangePickerSelectionChangedArgs.value
                      .toString()
                      .substring(0, 10);
                  print("object : $data");
                  print(
                    dateRangePickerSelectionChangedArgs.value
                        .toString()
                        .substring(0, 10),
                  );
                },
                selectionMode: DateRangePickerSelectionMode.single,
                initialSelectedRange: PickerDateRange(
                  DateTime.now().subtract(
                    const Duration(days: 4),
                  ),
                  DateTime.now().add(
                    const Duration(days: 3),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Text(
                  'اختر الوقت المناسب',
                  style: MangeStyles().getBoldStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s18,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    showPicker(
                      context: context,
                      value: _time,
                      onChange: onTimeChanged,
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: deviceInfo.localWidth * 0.05),
                  width: deviceInfo.localWidth * 0.9,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(2, 4),
                        color: Colors.grey[400]!,
                      ),
                      BoxShadow(
                        offset: Offset(-2, -3),
                        color: Colors.grey[400]!,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: ColorManager.kPrimary2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Text(
                          'الوقت المحدد',
                          style: MangeStyles().getBoldStyle(
                            color: ColorManager.kPrimary2,
                            fontSize: FontSize.s18,
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Text(
                          '${_time.hour}:${_time.minute}',
                          style: MangeStyles().getBoldStyle(
                            color: ColorManager.kPrimary2,
                            fontSize: FontSize.s18,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: ColorManager.kPrimary2,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              HeaderTitle(
                  text: "اضافة اي تعليمات وتفاصيل تريد ان يعرفها الموظف ؟"),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.27),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: deviceInfo.localWidth * 0.05),
                child: CustomButton(
                  width: 185,
                  haigh: 60,
                  color: ColorManager.kPrimary,
                  text: 'الاستمرار لعملية الدفع',
                  press: () async {},
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
