import 'package:serfast0_1/core/class/crud.dart';
import 'package:serfast0_1/core/constant/linkapi.dart';

class CategoryServicesData {
  Crud crud = Crud();
  CategoryServicesData(this.crud);

  getData(String catID) async {
    var respons =
        await crud.postData(AppLink.linkofcategoryservices, {'cat_ID': catID});
    return respons.fold((l) => l, (r) => r);
  }
}
