class ProviderModel {
  int? providerId;
  String? firstName;
  String? lastName;
  int? rate;
  String? location;
  String? services;
  int? number;
  String? aboutProvider;
  String? workTime;
  String? providerEmail;
  String? providerImage;

  ProviderModel(
      {this.providerId,
      this.firstName,
      this.lastName,
      this.rate,
      this.location,
      this.services,
      this.number,
      this.aboutProvider,
      this.workTime,
      this.providerEmail,
      this.providerImage});

  ProviderModel.fromJson(Map<String, dynamic> json) {
    providerId = json['provider_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    rate = json['rate'];
    location = json['location'];
    services = json['services'];
    number = json['number'];
    aboutProvider = json['aboutProvider'];
    workTime = json['workTime'];
    providerEmail = json['providerEmail'];
    providerImage = json['providerImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['provider_id'] = providerId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['rate'] = rate;
    data['location'] = location;
    data['services'] = services;
    data['number'] = number;
    data['aboutProvider'] = aboutProvider;
    data['workTime'] = workTime;
    data['providerEmail'] = providerEmail;
    data['providerImage'] = providerImage;
    return data;
  }
}