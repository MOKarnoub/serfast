import 'package:serfast0_1/core/class/crud.dart';
import 'package:serfast0_1/core/constant/linkapi.dart';

class LoginWithEmailData {
  Crud crud;

  LoginWithEmailData(this.crud);

  postData(String email, String password) async {
    var respons = await crud.postData(AppLink.linkloginwithemail, {
      "Email": email,
      "Password": password,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
