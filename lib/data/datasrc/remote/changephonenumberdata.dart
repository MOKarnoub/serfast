import 'package:serfast0_1/core/class/crud.dart';
import 'package:serfast0_1/core/constant/linkapi.dart';

class ChangeUserPhoneNumberData {
  Crud crud = Crud();

  ChangeUserPhoneNumberData(this.crud);

  getData(String userID, String newPhoneNumber) async {
    var respons = await crud.postData(AppLink.linkofchangeuserphonenumber, {
      "user_ID": userID,
      "new_PhoneNumber": newPhoneNumber,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
