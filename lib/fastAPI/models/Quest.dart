class Quest {
  String? questName;
  String? questDescription;
  int? reward;
  String? type;
  String? questType;

  Quest({this.questName, this.questDescription, this.reward, this.type, this.questType});

  Quest.fromJson(Map<String, dynamic> json) {
    questName = json['questName'];
    questDescription = json['questDescription'];
    reward = json['reward'];
    type = json['type'];
    questType = json['questType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['questName'] = questName;
    data['questDescription'] = questDescription;
    data['reward'] = reward;
    data['type'] = type;
    data['questType'] = questType;
    return data;
  }
}
