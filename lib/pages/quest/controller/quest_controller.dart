import 'package:frontend/fastAPI/models/Quest.dart';
import 'package:get/get.dart';

class QuestMainController extends GetxController {
  static QuestMainController get instance => Get.find<QuestMainController>();

  Future<void> getMainQuestList() async {
    List<Map<String, dynamic>> fakeJsonData = [
      {"questName": "잔반 남기지 않기", "questquestDescription": "Oh my god! Where are we?", "reward": 10, "type": "main"},
      {"questName": "환경 관련 책/영상/다큐 등 보고 감상평 남기기", "questquestDescription": "I have no idea, but we need to find water and shelter fast!", "reward": 10},
      {"questName": "환경 관련 포스팅하기", "questquestDescription": "But I can't see anything but sand here!", "reward": 10},
      {"questName": "전기차 타기", "questquestDescription": "Let's start walking in that direction. Maybe we'll find something.", "reward": 10},
      {
        "questName": "라벨 떼고 분리수거",
        "questDescription": "Oh my god! Where are we?Oh my god! Where are we?Oh my god! Where are we?Oh my god! Where are we?",
        "reward": 10
      },
      {"questName": "물티슈대신 손수건, 행주 사용하기", "questDescription": "I have no idea, but we need to find water and shelter fast!", "reward": 10},
      {"questName": "친환경 인증제품 구매하기", "questDescription": "Oh my god! Where are we?", "reward": 10},
      {"questName": "친환경 비누 사용하기 ", "questDescription": "I have no idea, but we need to find water and shelter fast!", "reward": 10},
      {"questName": "충전식 건전지 사용하기", "questDescription": "Oh my god! Where are we?", "reward": 10},
      {"questName": "다 쓴 건전지는 폐건전지함에 넣기", "questDescription": "I have no idea", "reward": 10},
      {"questName": "자전거 타기", "questDescription": "Oh my god! Where are we? gggggggg okay let's take a look.", "reward": 10},
      {"questName": "여름/ 겨울철 적정온도 맞추기", "questDescription": "hello!", "reward": 10},
      {"questName": "중고 거래하기", "questDescription": "Oh my god! Where are we?", "reward": 10},
      {"questName": "나무 심기", "questDescription": "I have no idea, but we need to find water and shelter fast!", "reward": 10},
      {"questName": "재생에너지 축제 참여하기", "questDescription": "I have no idea, but we need to find water and shelter fast!", "reward": 10},
    ];

    List<Quest> fakeTalkings = fakeJsonData.map((jsonData) => Quest.fromJson(jsonData)).toList();
    questList.value = fakeTalkings;
    questList.refresh();
  }

  Future<void> getDailyQuestList() async {
    dailyQuestList.value = getDailyQuestList() as List<Quest>;
    dailyQuestList.refresh();
  }

  RxList<Quest> questList = <Quest>[].obs;
  RxList<Quest> dailyQuestList = <Quest>[].obs;

  RxList<Quest> grassDoneQuestList = <Quest>[].obs;

  Future<void> getGrassDoneQugestList() async {
    List<Map<String, dynamic>> fakeJsonData = [
      {"questName": "잔반 남기지 않기", "questquestDescription": "Oh my god! Where are we?", "reward": 10, "type": "main"},
      {
        "questName": "환경 관련 책/영상/다큐 등 보고 감상평 남기기",
        "questquestDescription": "I have no idea, but we need to find water and shelter fast!",
        "reward": 10,
        "type": "daily"
      },
      {"questName": "환경 관련 포스팅하기", "questquestDescription": "But I can't see anything but sand here!", "reward": 10, "type": "event"},
      {"questName": "친환경 인증제품 구매하기", "questDescription": "Oh my god! Where are we?", "reward": 10, "type": "main"},
      {"questName": "친환경 비누 사용하기 ", "questDescription": "I have no idea, but we need to find water and shelter fast!", "reward": 10, "type": "event"},
    ];

    List<Quest> fakeTalkings = fakeJsonData.map((jsonData) => Quest.fromJson(jsonData)).toList();
    grassDoneQuestList.value = fakeTalkings;
    grassDoneQuestList.refresh();
  }
}
