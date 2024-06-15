import 'package:serfast0_1/core/class/crud.dart';
import 'package:serfast0_1/core/constant/linkapi.dart';

class SignupData {
  Crud crud;

  SignupData(this.crud);

  postData(String userfname, String userlname, String email, String password,
      String phoneNumber, String location) async {
    var respons = await crud.postData(AppLink.linksginup, {
      "FirstName": userfname,
      "LastName": userlname,
      "Email": email,
      "Password": password,
      "Number": phoneNumber,
      "Locations": location,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
