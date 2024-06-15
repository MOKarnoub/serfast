import 'package:serfast0_1/core/class/crud.dart';
import 'package:serfast0_1/core/constant/linkapi.dart';

class ChangePasswordData {
  Crud crud = Crud();

  ChangePasswordData(this.crud);

  getData(String userID, String newPassword) async {
    var respons = await crud.postData(AppLink.linkofchangepassword,
        {"user_ID": userID, "new_Password": newPassword});
    return respons.fold((l) => l, (r) => r);
  }
}
