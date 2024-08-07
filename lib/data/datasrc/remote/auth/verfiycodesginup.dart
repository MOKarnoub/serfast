import 'package:serfast0_1/core/class/crud.dart';
import 'package:serfast0_1/core/constant/linkapi.dart';

class VerfitCodeData {
  Crud crud;

  VerfitCodeData(this.crud);

  postData(String email, String verifycode) async {
    var respons = await crud.postData(AppLink.linkofverifycode, {
      "Email": email,
      "Verfiycode": verifycode,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
