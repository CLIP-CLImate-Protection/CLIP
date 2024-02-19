class User {
  String? nickname;
  String? level;
  String? address;
  int? point;
  int? totalLank;
  int? weeklyLank;
  String? profileUrl;
  int? totalQuest;

  User({this.nickname, this.level, this.address, this.point, this.totalLank, this.weeklyLank, this.profileUrl, this.totalQuest});

  User.fromJson(Map<String, dynamic> json) {
    nickname = json['nickname'];
    level = json['level'];
    address = json['address'];
    point = json['point'];
    totalLank = json['totalLank'];
    weeklyLank = json['weeklyLank'];
    profileUrl = json['profileUrl'];
    totalQuest = json['totalQuest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nickname'] = nickname;
    data['level'] = level;
    data['address'] = address;
    data['point'] = point;
    data['totalLank'] = totalLank;
    data['weeklyLank'] = weeklyLank;
    data['profileUrl'] = profileUrl;
    data['totalQuest'] = totalQuest;
    return data;
  }
}
