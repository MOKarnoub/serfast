import 'package:serfast0_1/core/class/crud.dart';
import 'package:serfast0_1/core/constant/linkapi.dart';

class ShowAllProivdersData {
  Crud crud = Crud();

  ShowAllProivdersData(this.crud);

  getData(String catID, String serviceID) async {
    var respons = await crud.postData(AppLink.linkofshowallproviders, {
      "cat_ID": catID,
      "service_ID": serviceID,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
