class ProviderWorkDaysModel {
  String? day;

  ProviderWorkDaysModel({this.day});

  ProviderWorkDaysModel.fromJson(Map<String, dynamic> json) {
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    return data;
  }
}
