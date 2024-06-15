import 'package:serfast0_1/core/class/crud.dart';
import 'package:serfast0_1/core/constant/linkapi.dart';

class ProvData {
  Crud crud = Crud();

  ProvData(this.crud);

  getData(String catID) async {
    var respons =
        await crud.postData(AppLink.linkofproviders, {"cat_ID": catID});
    return respons.fold((l) => l, (r) => r);
  }
}
