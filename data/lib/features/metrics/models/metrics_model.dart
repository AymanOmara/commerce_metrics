class MetricsModel {
  String? id;
  bool? isActive;
  String? price;
  String? company;
  String? picture;
  String? buyer;
  String? registered;
  List<String>? tags;
  String? orderStatus;

  MetricsModel({
    this.id,
    this.isActive,
    this.price,
    this.company,
    this.picture,
    this.buyer,
    this.tags,
    this.registered,
    this.orderStatus,
  });

  factory MetricsModel.fromJson(Map<String, dynamic> json) {
    return MetricsModel(
      id: json['id'],
      isActive: json['isActive'],
      price: json['price'],
      company: json['company'],
      picture: json['picture'],
      buyer: json['buyer'],
      tags: json['tags'],
      registered: json['registered'],
      orderStatus: json['status'],
    );
  }
}
