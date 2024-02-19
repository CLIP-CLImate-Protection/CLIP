import 'package:frontend/backend/UserService/user_service.dart';
import 'package:frontend/service/user_service.dart';
import 'package:get/get.dart';

class MyPageController extends GetxController {
  static MyPageController get instance => Get.find<MyPageController>();

  Future<void> getMyInfo() async {
    Map<String, dynamic> jsonData = await getUserAllInfo(UserService.instance.uid);

    print(jsonData);
  }

  List<User> transformJson(List<Map<String, dynamic>> jsonList) {
    List<User> quests = [];

    for (var item in jsonList) {
      for (var key in item.keys) {
        var questData = item[key];
        var quest = Quest(
          questName: key,
          questDescription: questData['description'],
          reward: questData['point'],
          type: questData['type'],
        );
        quests.add(quest);
      }
    }
    for (var quest in quests) {
      print("=========");
      print(quest.questName);
      print(quest.questDescription);
      print(quest.reward);
      print(quest.type);
    }
    return quests;
  }
}
