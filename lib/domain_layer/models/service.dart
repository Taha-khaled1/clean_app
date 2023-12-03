class ServicesModels {
  bool? success;
  int? code;
  String? direct;
  String? message;
  List<ServiceHome>? data;

  ServicesModels(
      {this.success, this.code, this.direct, this.message, this.data});

  ServicesModels.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    direct = json['direct'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ServiceHome>[];
      json['data'].forEach((v) {
        data!.add(new ServiceHome.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['direct'] = this.direct;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceHome {
  int? id;
  String? title;
  String? description;
  String? icon;
  int? pricePerHour;
  int? order;
  int? minHours;

  ServiceHome(
      {this.id,
      this.title,
      this.icon,
      this.description,
      this.pricePerHour,
      this.order,
      this.minHours});

  ServiceHome.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    pricePerHour = json['price_per_hour'];
    order = json['order'];
    icon = json['icon'];
    minHours = json['min_hours'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['icon'] = this.icon;
    data['description'] = this.description;
    data['price_per_hour'] = this.pricePerHour;
    data['order'] = this.order;
    data['min_hours'] = this.minHours;
    return data;
  }
}
