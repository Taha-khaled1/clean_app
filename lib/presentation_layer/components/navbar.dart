import 'package:clean_app/presentation_layer/screen/account_screen/account_screen.dart';
import 'package:clean_app/presentation_layer/resources/color_manager.dart';
import 'package:clean_app/presentation_layer/screen/book_screen/book_screen.dart';
import 'package:clean_app/presentation_layer/screen/home_screen/home_screen.dart';
import 'package:clean_app/presentation_layer/screen/support_screen/support_problem_account_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

int pageIndex = 0;

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  static const List<Widget> _widgetOptions = <Widget>[
    SupportProblemScreen(),
    BookScreen(),
    HomeScreen(),
    AccountScreen(),
  ];
  double high = 30;
  double size = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 2,
        height: 60.0,
        items: <Widget>[
          Image.asset(
            'assets/icons/send.png',
            width: size,
            height: high,
            color: pageIndex == 0
                ? ColorManager.background
                : ColorManager.kPrimary2,
          ),
          Image.asset(
            'assets/icons/booking.png',
            width: 40,
            height: 40,
            color: pageIndex == 1
                ? ColorManager.background
                : ColorManager.kPrimary2,
          ),
          Image.asset(
            'assets/icons/home.png',
            width: size,
            height: high,
            color: pageIndex == 2
                ? ColorManager.background
                : ColorManager.kPrimary2,
          ),
          Image.asset(
            'assets/icons/user.png',
            width: size,
            height: high,
            color: pageIndex == 3
                ? ColorManager.background
                : ColorManager.kPrimary2,
          ),
        ],
        color: ColorManager.background,
        buttonBackgroundColor: ColorManager.kPrimary,
        backgroundColor: ColorManager.background,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(seconds: 1),
        onTap: (index) {
          setState(() {
            pageIndex = index;
            print('$pageIndex : $index');
          });
        },
        letIndexChange: (index) => true,
      ),
      body: Center(
        child: _widgetOptions.elementAt(pageIndex),
      ),
    );
  }
}

class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen'),
      ),
      body: Center(
        child: Text('Screen'),
      ),
    );
  }
}
