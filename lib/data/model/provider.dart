class ProviderModel {
  int? providerId;
  String? firstName;
  String? lastName;
  int? rate;
  String? location;
  String? services;
  int? number;
  String? aboutProvider;
  List<WorkTime>? workTime;
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
    if (json['workTime'] != null) {
      workTime = <WorkTime>[];
      json['workTime'].forEach((v) {
        workTime!.add(new WorkTime.fromJson(v));
      });
    }
    providerEmail = json['providerEmail'];
    providerImage = json['providerImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['provider_id'] = this.providerId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['rate'] = this.rate;
    data['location'] = this.location;
    data['services'] = this.services;
    data['number'] = this.number;
    data['aboutProvider'] = this.aboutProvider;
    if (this.workTime != null) {
      data['workTime'] = this.workTime!.map((v) => v.toJson()).toList();
    }
    data['providerEmail'] = this.providerEmail;
    data['providerImage'] = this.providerImage;
    return data;
  }
}

class WorkTime {
  int? providerID;
  List<DayList>? dayList;

  WorkTime({this.providerID, this.dayList});

  WorkTime.fromJson(Map<String, dynamic> json) {
    providerID = json['provider_ID'];
    if (json['day_list'] != null) {
      dayList = <DayList>[];
      json['day_list'].forEach((v) {
        dayList!.add(new DayList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['provider_ID'] = this.providerID;
    if (this.dayList != null) {
      data['day_list'] = this.dayList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DayList {
  String? day;
  List<int>? hour;

  DayList({this.day, this.hour});

  DayList.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    hour = json['hour'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['hour'] = this.hour;
    return data;
  }
}
