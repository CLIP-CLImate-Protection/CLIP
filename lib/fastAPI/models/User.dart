class User {
  String? nickname;
  int? level;
  String? address;
  int? point;
  int? totalLank;
  int? weeklyLank;
  String? profileUrl;
  int? totalQuest;
  List<String>? friend;

  User({this.nickname, this.level, this.address, this.point, this.totalLank, this.weeklyLank, this.profileUrl, this.totalQuest, this.friend});

  User.fromJson(Map<String, dynamic> json) {
    point = json['point'];
    level = json['level'];
    address = json['address'];
    nickname = json['nickname'];
    totalLank = json['totalLank'];
    weeklyLank = json['weeklyLank'];
    profileUrl = json['profileUrl'];
    totalQuest = json['totalQuest'];
    if (json['friend'] != null) {
      friend = List<String>.from(json['friend']);
    }
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
    data['friend'] = friend;
    return data;
  }
}
