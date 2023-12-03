class SingleServiceModel {
  bool? success;
  int? code;
  Null? direct;
  String? message;
  Data? data;

  SingleServiceModel(
      {this.success, this.code, this.direct, this.message, this.data});

  SingleServiceModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    direct = json['direct'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['direct'] = this.direct;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? icon;
  String? title;
  String? description;
  int? pricePerHour;
  int? order;
  int? minHours;

  Data(
      {this.id,
      this.icon,
      this.title,
      this.description,
      this.pricePerHour,
      this.order,
      this.minHours});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    title = json['title'];
    description = json['description'];
    pricePerHour = json['price_per_hour'];
    order = json['order'];
    minHours = json['min_hours'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price_per_hour'] = this.pricePerHour;
    data['order'] = this.order;
    data['min_hours'] = this.minHours;
    return data;
  }
}
