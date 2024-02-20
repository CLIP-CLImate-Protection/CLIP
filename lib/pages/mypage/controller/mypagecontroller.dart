import 'package:frontend/backend/UserService/user_service.dart';
import 'package:frontend/fastAPI/models/User.dart';
import 'package:frontend/service/user_service.dart';
import 'package:get/get.dart';

class MyPageController extends GetxController {
  static MyPageController get instance => Get.find<MyPageController>();

  @override
  void onInit() {
    super.onInit();
    getMyInfo();
  }

  Future<void> getMyInfo() async {
    print(UserService.instance.uid);
    Map<String, dynamic> jsonData =
        await getUserAllInfo(UserService.instance.uid);
    User userData = User.fromJson(jsonData);

    user.value = userData;
    user.refresh();
    print(user.value.level);
  }

  Future<void> getQuestDateList() async {
    List<Map<String, dynamic>> jsonData =
        await getUserQuestData(UserService.instance.uid);
    // print(jsonData);
  }

  Rx<User> user = User().obs;

  // User<User> transformJson(List<Map<String, dynamic>> jsonList) {
  //   User

  //   for (var item in jsonList) {
  //     for (var key in item.keys) {
  //       var questData = item[key];
  //       var quest = Quest(
  //         questName: key,
  //         questDescription: questData['description'],
  //         reward: questData['point'],
  //         type: questData['type'],
  //       );
  //       quests.add(quest);
  //     }
  //   }
  //   for (var quest in quests) {
  //     print("=========");
  //     print(quest.questName);
  //     print(quest.questDescription);
  //     print(quest.reward);
  //     print(quest.type);
  //   }
  //   return quests;
  // }
}
