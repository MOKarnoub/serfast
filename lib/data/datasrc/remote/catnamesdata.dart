import 'package:serfast0_1/core/class/crud.dart';
import 'package:serfast0_1/core/constant/linkapi.dart';

class CatNamesData {
  Crud crud = Crud();

  CatNamesData(this.crud);

  getData() async {
    var respons = await crud.postData(AppLink.linkofcatnames, {});
    return respons.fold((l) => l, (r) => r);
  }
}
