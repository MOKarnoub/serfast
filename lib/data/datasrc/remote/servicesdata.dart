import 'package:serfast0_1/core/class/crud.dart';
import 'package:serfast0_1/core/constant/linkapi.dart';

class ServData {
  Crud crud = Crud();

  ServData(this.crud);

  getData(String catID) async {
    var respons =
        await crud.postData(AppLink.linkofservices, {"cat_ID": catID});
    return respons.fold((l) => l, (r) => r);
  }
}
