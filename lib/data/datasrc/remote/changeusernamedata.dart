import 'package:serfast0_1/core/class/crud.dart';
import 'package:serfast0_1/core/constant/linkapi.dart';

class ChangeUserNameData {
  Crud crud = Crud();

  ChangeUserNameData(this.crud);

  getData(String userID, String newFirstName, String newLastName) async {
    var respons = await crud.postData(AppLink.linkofchangeusername, {
      "user_ID": userID,
      "new_FirsrName": newFirstName,
      "new_LastName": newLastName,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
