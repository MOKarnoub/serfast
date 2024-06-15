import 'package:serfast0_1/core/class/crud.dart';
import 'package:serfast0_1/core/constant/linkapi.dart';

class LoginWithNumberData {
  Crud crud;

  LoginWithNumberData(this.crud);

  postData(String phoneNumber, String password) async {
    var respons = await crud.postData(AppLink.linkloginwithnumber, {
      "Number": phoneNumber,
      "Password": password,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
