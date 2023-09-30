import 'package:clean_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:clean_app/presentation_layer/components/appbar1.dart';
import 'package:clean_app/presentation_layer/components/custombutten.dart';
import 'package:clean_app/presentation_layer/components/customtextfild.dart';
import 'package:clean_app/presentation_layer/resources/color_manager.dart';
import 'package:clean_app/presentation_layer/screen/save_service_screen/save_service_screen.dart';
import 'package:clean_app/presentation_layer/utlis/header_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApppointmentScreen extends StatelessWidget {
  const ApppointmentScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(title: "تفاصيل الخدمة "),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                HeaderTitle(text: "الاسم بالكامل "),
                CustomTextfeild(
                  valid: (p0) {},
                  onsaved: (p0) {},
                  onChanged: (p0) {
                    // email = p0.toString();
                  },
                  titel: 'الاسم بالكامل ',
                  width: 15,
                  height: 100,
                  icon: Icons.email,
                ),
                SizedBox(
                  height: 10,
                ),
                HeaderTitle(text: "العنوان"),
                CustomTextfeild(
                  valid: (p0) {},
                  onsaved: (p0) {},
                  onChanged: (p0) {
                    // email = p0.toString();
                  },
                  titel: 'العنوان',
                  width: 15,
                  height: 100,
                  icon: Icons.email,
                ),
                SizedBox(
                  height: 10,
                ),
                HeaderTitle(text: "رقم الهاتف "),
                CustomTextfeild(
                  valid: (p0) {},
                  onsaved: (p0) {},
                  onChanged: (p0) {
                    // email = p0.toString();
                  },
                  titel: 'رقم الهاتف ',
                  width: 15,
                  height: 100,
                  icon: Icons.email,
                ),
                SizedBox(
                  height: 18,
                ),
                HeaderTitle(text: "التنظيف "),
                SizedBox(height: 80, child: RadioListTileExample()),
                SizedBox(height: 150, child: BeautifulChoiceWidget()),
                HeaderTitle(text: "كم موظف تحتاج ؟ "),
                EmployeeCounterWidget(),
                CustomButton(
                  width: 250,
                  haigh: 55,
                  color: ColorManager.kPrimary,
                  text: "استكمال الطلب ",
                  press: () {
                    Get.to(() => SaveServiceScreen());
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class RadioListTileExample extends StatefulWidget {
  @override
  _RadioListTileExampleState createState() => _RadioListTileExampleState();
}

class _RadioListTileExampleState extends State<RadioListTileExample> {
  int selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        children: [
          Expanded(
            child: RadioListTile(
              activeColor: ColorManager.kPrimary,
              title: Text('بمعدات تنظيف '),
              value: 1,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                });
              },
            ),
          ),
          Expanded(
            child: RadioListTile(
              activeColor: ColorManager.kPrimary,
              title: Text('بدون معدات تنظيف'),
              value: 2,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Choice {
  final int number;
  bool isSelected;

  Choice(this.number, {this.isSelected = false});
}

class BeautifulChoiceWidget extends StatefulWidget {
  @override
  _BeautifulChoiceWidgetState createState() => _BeautifulChoiceWidgetState();
}

class _BeautifulChoiceWidgetState extends State<BeautifulChoiceWidget> {
  List<Choice> choices = [
    Choice(1),
    Choice(2),
    Choice(3),
    Choice(4),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: choices.map((choice) {
          return GestureDetector(
            onTap: () {
              setState(() {
                choices.forEach((c) => c.isSelected = false);
                choice.isSelected = true;
              });
            },
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: choice.isSelected ? ColorManager.kPrimary : Colors.grey,
              ),
              child: Center(
                child: Text(
                  choice.number.toString(),
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class EmployeeCounterWidget extends StatefulWidget {
  @override
  _EmployeeCounterWidgetState createState() => _EmployeeCounterWidgetState();
}

class _EmployeeCounterWidgetState extends State<EmployeeCounterWidget> {
  int employeeCount = 0;

  void incrementEmployeeCount() {
    setState(() {
      employeeCount++;
    });
  }

  void decrementEmployeeCount() {
    if (employeeCount > 0) {
      setState(() {
        employeeCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("assets/images/customer.png"),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: incrementEmployeeCount,
          ),
          SizedBox(width: 16.0),
          Text(
            '$employeeCount',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(width: 16.0),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: decrementEmployeeCount,
          ),
        ],
      ),
    );
  }
}
