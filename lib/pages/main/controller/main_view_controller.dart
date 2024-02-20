import 'package:frontend/backend/CommunityService/community_service.dart';
import 'package:frontend/fastAPI/models/User.dart';
import 'package:get/get.dart';

class MainViewController extends GetxController {
  static MainViewController get instance => Get.find<MainViewController>();

  @override
  void onInit() {
    super.onInit();
    getRankList();
    //reloadData();
  }

  RxList<User> rankList = <User>[].obs;

  Future<void> getRankList() async {
    try {
      print('Fetching top quest users...');
      List<Map<String, dynamic>> jsonData = await getTopQuestUsers();
      print('Fetched top quest users: $jsonData');

      rankList.clear();

      for (var user in jsonData) {
        int totalQuest = int.tryParse(user['totalQuest'] ?? '0') ?? 0;
        user['totalQuest'] = totalQuest;
        rankList.add(User.fromJson(user));
      }
      print(rankList.value[0].nickname);
      rankList.refresh();
    } catch (e) {
      print('Error fetching and updating rank list: $e');
    }
  }
}
