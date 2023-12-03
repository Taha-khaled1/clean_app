import 'package:clean_app/data_layer/database/connectdatabase.dart';
import 'package:clean_app/presentation_layer/resources/msnge_api.dart';

dynamic getServicRespon() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    APiMange.services,
    // myheadersres: curd.myheadersfail,
  );

  return respons;
}

dynamic getBannnerRespon() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    APiMange.banners,
    // myheadersres: curd.myheadersfail,
  );

  return respons;
}

dynamic getSingleServicesRespon(String id) async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    "${APiMange.singleServices}/$id",
  );

  return respons;
}

dynamic getEmiratesRespon() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    APiMange.emirates,
  );

  return respons;
}
