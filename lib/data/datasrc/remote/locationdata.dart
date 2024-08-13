import 'package:serfast0_1/core/class/crud.dart';
import 'package:serfast0_1/core/constant/linkapi.dart';

class AddLocationData {
  Crud crud;

  AddLocationData(this.crud);

  removeData(String locationid) async {
    var respons = await crud.postData(AppLink.linkofdeletelocation, {
      "location_id": locationid,
    });
    return respons.fold((l) => l, (r) => r);
  }

  getData(String userid) async {
    var respons = await crud.postData(AppLink.linkofshowlocation, {
      "user_id": userid,
    });
    return respons.fold((l) => l, (r) => r);
  }

  postData(String locationname, String longitude, String latitude,
      String userid, String buildingnumber, String notes) async {
    var respons = await crud.postData(AppLink.linkofaddlocation, {
      "location_name": locationname,
      "longitude": longitude,
      "latitude": latitude,
      "user_id": userid,
      "building_number": buildingnumber,
      "notes": notes,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
