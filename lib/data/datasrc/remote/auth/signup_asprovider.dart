import 'package:serfast0_1/core/class/crud.dart';
import 'package:serfast0_1/core/constant/linkapi.dart';

class SignupAsProviderData {
  Crud crud;

  SignupAsProviderData(this.crud);

  postData(
      String categoryName1,
      String categoryName2,
      String categoryName3,
      String serviceName1,
      String serviceName2,
      String servicename3,
      String userID,
      String about,
      String lat,
      String long) async {
    var respons = await crud.postData(AppLink.linksginupasprovider, {
      "Category_name1": categoryName1,
      "Category_name2": categoryName2,
      "Category_name3": categoryName3,
      "service_name1": serviceName1,
      "service_name2": serviceName2,
      "service_name3": servicename3,
      "ID": userID,
      "about": about,
      "longitude": long,
      "latitude": lat,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
