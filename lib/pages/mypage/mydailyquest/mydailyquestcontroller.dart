import 'package:frontend/backend/UserService/user_service.dart';
import 'package:frontend/service/user_service.dart';
import 'package:get/get.dart';

class MyDailyQuestController extends GetxController {
  // Future<List<String>> getUserCompletedQuests() async {
  //   return ['퀘스트 1', '퀘스트 2', '퀘스트 3']; // 더미 데이터
  // }

  static MyDailyQuestController get instance =>
      Get.put(MyDailyQuestController());
  Future<List<String>> getQuestDateList() async {
    List<Map<String, dynamic>> jsonData =
        await getUserQuestData(UserService.instance.uid);
    List<String> quests = [];
    for (var item in jsonData) {
      for (var date in item.values) {
        quests.add(date);
      }
    }
    return quests;
  }

  Future<void> getDateQuestList(String date) async {
    List<Map<String, dynamic>> jsonData =
        await getUserQuestList(UserService.instance.uid, date);
    Map<String, dynamic> quests = {};
    for (var item in jsonData) {
      for (var key in item.keys) {
        quests[key] = item[key];
      }
    }
    print('front');
    print(quests);
  }
}
