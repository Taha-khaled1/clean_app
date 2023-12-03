import 'package:clean_app/application_layer/utils/handling.dart';
import 'package:clean_app/data_layer/database/connectdatabase.dart';
import 'package:clean_app/presentation_layer/components/show_dialog.dart';
import 'package:clean_app/presentation_layer/resources/msnge_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clean_app/application_layer/utils/statusrequst.dart';
import 'package:quickalert/models/quickalert_type.dart';

class SupportController extends GetxController {
  final GlobalKey<FormState> formkeysigin = GlobalKey();
  late String name, message, email, phone;
  StatusRequest statusRequest = StatusRequest.none;
  contactUs(BuildContext context) async {
    if (formkeysigin.currentState!.validate()) {
      formkeysigin.currentState!.save();
      statusRequest = StatusRequest.loading;
      update();

      var respon = await contactUsRespon(
        name,
        phone,
        message,
      );
      statusRequest = handlingData(respon);
      try {
        if (StatusRequest.success == statusRequest) {
          if (respon['code'].toString() == '200') {
            showDilog(context, 'تم ارسال الرساله الخاصه بك\nبنجاح');
          } else {
            showDilog(
              context,
              'لم يتم ارسال الرساله',
              type: QuickAlertType.info,
            );
          }
        } else {
          showDilog(
            context,
            'يوجد مشكله ما',
            type: QuickAlertType.error,
          );
        }
      } catch (e) {
        print('catch $e');
        showDilog(
          context,
          'يوجد مشكله ما',
          type: QuickAlertType.error,
        );
      }
    }

    update();
  }
}

contactUsRespon(name, phone, message) async {
  Curd curd = Curd();
  var respons = await curd.postrequest(
    APiMange.contact,
    {
      'name': name,
      // 'email': email,
      'phone': phone,
      'message': message,
      // "subject": "subject",
    },
    encode: false,
    myheadersres: Curd().myheaders3,
  );
  print(respons);
  return respons;
}
