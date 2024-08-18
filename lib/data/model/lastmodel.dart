class Orderdd {
  int? orderId;
  int? locationId;
  String? date;
  String? status;
  String? feedback;
  int? userId;
  String? firstName;
  String? lastName;
  int? rate;
  String? serviceName;
  int? price;

  Orderdd(
      {this.orderId,
      this.locationId,
      this.date,
      this.status,
      this.feedback,
      this.userId,
      this.firstName,
      this.lastName,
      this.rate,
      this.serviceName,
      this.price});

  Orderdd.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    locationId = json['location_id'];
    date = json['date'];
    status = json['status'];
    feedback = json['feedback'];
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    rate = json['rate'];
    serviceName = json['service_name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['location_id'] = this.locationId;
    data['date'] = this.date;
    data['status'] = this.status;
    data['feedback'] = this.feedback;
    data['user_id'] = this.userId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['rate'] = this.rate;
    data['service_name'] = this.serviceName;
    data['price'] = this.price;
    return data;
  }
}
