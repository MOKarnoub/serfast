import 'package:serfast0_1/data/model/provider.dart';

class CategoryServicesModel {
  int? serviceId;
  String? serviceName;
  int? servicePrice;
  List<ProviderModel>? providerList;

  CategoryServicesModel(
      {this.serviceId, this.serviceName, this.servicePrice, this.providerList});

  CategoryServicesModel.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    serviceName = json['service_name'];
    servicePrice = json['service_price'];
    if (json['provider_list'] != null) {
      providerList = <ProviderModel>[];
      json['provider_list'].forEach((v) {
        providerList!.add(ProviderModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['service_id'] = serviceId;
    data['service_name'] = serviceName;
    data['service_price'] = servicePrice;
    if (providerList != null) {
      data['provider_list'] = providerList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
