class LocationViewModel {
  int? locId;
  String? locationName;
  double? longitude;
  double? latitude;
  int? userId;
  String? buildingNumber;
  String? notes;

  LocationViewModel(
      {this.locId,
      this.locationName,
      this.longitude,
      this.latitude,
      this.userId,
      this.buildingNumber,
      this.notes});

  LocationViewModel.fromJson(Map<String, dynamic> json) {
    locId = json['loc_id'];
    locationName = json['location_name'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    userId = json['user_id'];
    buildingNumber = json['building_number'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loc_id'] = this.locId;
    data['location_name'] = this.locationName;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['user_id'] = this.userId;
    data['building_number'] = this.buildingNumber;
    data['notes'] = this.notes;
    return data;
  }
}
