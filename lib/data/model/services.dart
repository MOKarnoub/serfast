class ServicesModel {
  int? serviceId;
  String? serviceName;
  int? servicePrice;

  ServicesModel({this.serviceId, this.serviceName});

  ServicesModel.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    serviceName = json['service_name'];
    servicePrice = json['service_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['service_id'] = serviceId;
    data['service_name'] = serviceName;
    data['service_price'] = servicePrice;
    return data;
  }
}
