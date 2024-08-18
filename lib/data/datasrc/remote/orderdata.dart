import 'package:serfast0_1/core/class/crud.dart';
import 'package:serfast0_1/core/constant/linkapi.dart';

class OrderData {
  Crud crud = Crud();

  OrderData(this.crud);

  getDetailes(String userid) async {
    var respons = await crud.postData(AppLink.linkoforderdddd, {
      "user_id": userid,
    });
    return respons.fold((l) => l, (r) => r);
  }

  getData(
    String catID,
    String category_id,
    String service_ID,
    String provider_ID,
    String date,
    String user_id,
    String location_id,
  ) async {
    var respons = await crud.postData(AppLink.linkofsendorder, {
      "category_id": category_id,
      "service_ID": service_ID,
      "provider_ID": provider_ID,
      "date": date,
      "user_id": user_id,
      "location_id": location_id,
      "cat_ID": catID
    });
    return respons.fold((l) => l, (r) => r);
  }
}
