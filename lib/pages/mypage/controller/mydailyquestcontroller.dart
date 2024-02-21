import 'package:frontend/backend/UserService/user_service.dart';
import 'package:frontend/service/user_service.dart';
import 'package:get/get.dart';

class MyDailyQuestController extends GetxController {
  // Future<List<String>> getUserCompletedQuests() async {
  //   return ['퀘스트 1', '퀘스트 2', '퀘스트 3']; // 더미 데이터
  // }

  static MyDailyQuestController get instance => Get.put(MyDailyQuestController());
  Future<List<String>> getQuestDateList() async {
    List<Map<String, dynamic>> jsonData = await getUserQuestData(UserService.instance.uid);
    List<String> quests = [];
    for (var item in jsonData) {
      for (var date in item.values) {
        quests.add(date);
      }
    }
    return quests;
  }

  RxList<String> dailyQuestList = <String>[].obs;
  RxList<String> mainQuestList = <String>[].obs;
  Map<String, dynamic> quests = {};

  Future<void> separateQuest() async {
    for (var item in quests.keys) {
      if (item == 'daily') {
        print('daily퀘스트 추가: $item');
        dailyQuestList.add(quests[item]);
      } else if (item == 'main') {
        mainQuestList.add(quests[item]);
      }
    }
    mainQuestList.refresh();
    dailyQuestList.refresh();
    print('separateQuest');
    print('daily: $dailyQuestList');
    print('main: $mainQuestList');
  }

  Future<void> getDateQuestList(String date) async {
    List<Map<String, dynamic>> jsonData = await getUserQuestList(UserService.instance.uid, date);
    for (var item in jsonData) {
      for (var key in item.keys) {
        quests[key] = item[key];
      }
    }
    quests['date'] = date;
    print('front');
    print(quests);
    print(quests['date']);
  }
}
