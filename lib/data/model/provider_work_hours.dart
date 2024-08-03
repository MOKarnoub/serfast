class ProviderWorkHoursModel {
  int? hour;

  ProviderWorkHoursModel({this.hour});

  ProviderWorkHoursModel.fromJson(Map<String, dynamic> json) {
    hour = json['hour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hour'] = this.hour;
    return data;
  }
}
