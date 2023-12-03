import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_app/application_layer/utils/handling.dart';
import 'package:clean_app/application_layer/utils/statusrequst.dart';
import 'package:clean_app/data_layer/repository_imp/home.dart';
import 'package:clean_app/domain_layer/models/banners.dart';
import 'package:clean_app/domain_layer/models/service.dart';
import 'package:clean_app/presentation_layer/screen/home_screen/widget/BannerWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late bool isload;
  List<Widget> ximageoffer = [];

  BannerModel? bannerModel;
  ServicesModels? servicesModels;
  late StatusRequest statusRequest;
  getHomeRes() async {
    try {
      statusRequest = StatusRequest.loading;
      var response = await getBannnerRespon();
      var responseService = await getServicRespon();
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        print('----------------------------------');
        bannerModel = await BannerModel.fromJson(response);
        servicesModels = await ServicesModels.fromJson(responseService);
        for (int i = 0; i < (bannerModel!.data?.length ?? 0); i++)
          ximageoffer.add(
            BannerWidget(
              image: bannerModel!.data?[i].bannerImage ?? "",
            ),
          );
        return StatusRequest.success;
      } else {
        return StatusRequest.failure;
      }
    } catch (e) {
      return statusRequest = StatusRequest.erorr;
    }
  }

  @override
  void onInit() async {
    isload = true;
    update();
    await getHomeRes();

    isload = false;
    update();
    super.onInit();
  }
}
