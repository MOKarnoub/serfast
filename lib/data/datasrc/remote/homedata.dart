import 'package:serfast0_1/core/class/crud.dart';
import 'package:serfast0_1/core/constant/linkapi.dart';

class HomeData {
  Crud crud = Crud();

  HomeData(this.crud);

  getData() async {
    var respons = await crud.postData(AppLink.linkofcategories, {});
    return respons.fold((l) => l, (r) => r);
  }
}
