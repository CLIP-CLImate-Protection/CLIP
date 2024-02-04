class Quest {
  String? questName;
  String? questDescription;
  int? reward;
  Enum? type;

  Quest({this.questName, this.questDescription, this.reward, this.type});

  Quest.fromJson(Map<String, dynamic> json) {
    questName = json['quest_name'];
    questDescription = json['quest_description'];
    reward = json['reward'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quest_name'] = questName;
    data['quest_description'] = questDescription;
    data['reward'] = reward;
    data['type'] = type;
    return data;
  }
}
