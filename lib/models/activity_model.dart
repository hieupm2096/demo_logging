/// activity : "Configure two-factor authentication on your accounts"
/// type : "busywork"
/// participants : 1
/// price : 0
/// link : "https://en.wikipedia.org/wiki/Multi-factor_authentication"
/// key : "1572120"
/// accessibility : 0

class ActivityModel {
  ActivityModel({
    this.activity,
    this.type,
    this.participants,
    this.price,
    this.link,
    this.key,
    this.accessibility,
  });

  ActivityModel.fromJson(dynamic json) {
    activity = json['activity'];
    type = json['type'];
    participants = json['participants'];
    price = json['price'];
    link = json['link'];
    key = json['key'];
    accessibility = json['accessibility'];
  }
  String? activity;
  String? type;
  int? participants;
  int? price;
  String? link;
  String? key;
  int? accessibility;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['activity'] = activity;
    map['type'] = type;
    map['participants'] = participants;
    map['price'] = price;
    map['link'] = link;
    map['key'] = key;
    map['accessibility'] = accessibility;
    return map;
  }
}
