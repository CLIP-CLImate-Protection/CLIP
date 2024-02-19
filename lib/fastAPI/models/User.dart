class User {
  String? userName;
  String? level;
  String? region;
  int? point;
  int? totalLank;
  int? weeklyLank;
  String? profileImage;
  int? totalQuest;

  User({this.userName, this.level, this.region, this.point, this.totalLank, this.weeklyLank, this.profileImage, this.totalQuest});

  User.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    level = json['level'];
    region = json['region'];
    point = json['point'];
    totalLank = json['totalLank'];
    weeklyLank = json['weeklyLank'];
    profileImage = json['profileImage'];
    totalQuest = json['totalQuest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['level'] = level;
    data['region'] = region;
    data['point'] = point;
    data['totalLank'] = totalLank;
    data['weeklyLank'] = weeklyLank;
    data['profileImage'] = profileImage;
    data['totalQuest'] = totalQuest;
    return data;
  }
}
