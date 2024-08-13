import 'package:serfast0_1/core/class/crud.dart';
import 'package:serfast0_1/core/constant/linkapi.dart';

class SignupAsProviderData {
  Crud crud;

  SignupAsProviderData(this.crud);

  postData(String location, String userID) async {
    var respons = await crud.postData(AppLink.linksginupasprovider, {
      "Locations": location,
      "ID": userID,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
