import 'dart:io';

import 'package:serfast0_1/core/class/crud.dart';
import 'package:serfast0_1/core/constant/linkapi.dart';

class TestData {
  Crud crud = Crud();

  TestData(this.crud);

  getData(String userID, File? file) async {
    var respons = await crud.postData(AppLink.linkoftest, {
      "user_ID": userID,
      "file": file,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
