import 'package:serfast0_1/core/class/crud.dart';
import 'package:serfast0_1/core/constant/linkapi.dart';

class ChangeUserEmailData {
  Crud crud = Crud();

  ChangeUserEmailData(this.crud);

  getData(String userID, String newEmail) async {
    var respons = await crud.postData(AppLink.linkofchangeuseremail, {
      "user_ID": userID,
      "new_Email": newEmail,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
