import 'package:clean_app/application_layer/utils/handling.dart';
import 'package:clean_app/application_layer/utils/statusrequst.dart';
import 'package:clean_app/data_layer/repository_imp/home.dart';
import 'package:clean_app/domain_layer/models/single_service.dart';
import 'package:clean_app/main.dart';
import 'package:get/get.dart';

class ServiceDetalisController extends GetxController {
  SingleServiceModel? singleService;
  late StatusRequest statusRequest;
  late bool isload;
  getServiceDetalis(String id) async {
    try {
      statusRequest = StatusRequest.loading;
      var response = await getSingleServicesRespon(id);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        print('----------------------------------');
        singleService = await SingleServiceModel.fromJson(response);

        statusRequest = StatusRequest.success;
      } else {
        statusRequest = StatusRequest.failure;
      }
    } catch (e) {
      statusRequest = StatusRequest.erorr;
    }
  }

  @override
  void onInit() async {
    isload = true;
    update();
    await getServiceDetalis(sharedPreferences.getString("s_id")!);
    isload = false;
    update();
    super.onInit();
  }
}
