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
    this.link,
    this.key,
  });

  ActivityModel.fromJson(dynamic json) {
    activity = json['activity'];
    type = json['type'];
    link = json['link'];
    key = json['key'];
  }
  String? activity;
  String? type;
  String? link;
  String? key;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['activity'] = activity;
    map['type'] = type;
    map['link'] = link;
    map['key'] = key;
    return map;
  }
}
