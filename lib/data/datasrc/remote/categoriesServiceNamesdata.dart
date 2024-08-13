import 'package:serfast0_1/core/class/crud.dart';
import 'package:serfast0_1/core/constant/linkapi.dart';

class CategoriesServiceNames {
  Crud crud = Crud();

  CategoriesServiceNames(this.crud);

  getData() async {
    var respons = await crud.postData(AppLink.linkofcategorieserviceames, {});
    return respons.fold((l) => l, (r) => r);
  }
}
