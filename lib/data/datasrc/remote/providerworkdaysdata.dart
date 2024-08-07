import 'package:serfast0_1/core/class/crud.dart';
import 'package:serfast0_1/core/constant/linkapi.dart';

class ProviderWorkDaysData {
  Crud crud = Crud();

  ProviderWorkDaysData(this.crud);

  getData(String catID, String serviceID, String providerID) async {
    var respons = await crud.postData(AppLink.linkofproviderworkdays, {
      "cat_ID": catID,
      "service_ID": serviceID,
      "provider_ID": providerID,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
