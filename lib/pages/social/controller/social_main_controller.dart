import 'package:frontend/backend/CommunityService/community_service.dart';
import 'package:frontend/backend/UserService/user_service.dart';
import 'package:frontend/fastAPI/models/User.dart';
import 'package:frontend/service/user_service.dart';
import 'package:get/get.dart';

class SocialMainController extends GetxController {
  static SocialMainController get instance => Get.find<SocialMainController>();

  @override
  void onInit() {
    super.onInit();
    getFriendList();
    getNicknameList();
  }

  RxList<User> friendList = <User>[].obs;

  RxList<String> nicknameList = <String>[].obs;

  Future<void> getNicknameList() async {
    List<String> getNicknameList = await getAllUserNicknameList();
    nicknameList.value = getNicknameList;
    nicknameList.refresh();
  }

  Future<void> getFriendInfo(String nickname) async {
    friend.value = User();
    print('닉네임 $nickname');
    Map<String, dynamic> jsonData = await searchUserByNickname(nickname);
    User userData = User.fromJson(jsonData);
    print('userData: ${userData.nickname}');
    friend.value = userData;
    friend.refresh();
  }

  Rx<User> friend = User().obs;
  Map<String, dynamic> friendData = {};

  Future<void> addFriendToUser(String friendUid) async {
    String result = await addFriend(UserService.instance.uid, friendUid);
    print(result);
  }

  Future<void> getFriendList() async {
    print(UserService.instance.uid);
    Map<String, dynamic> jsondata = await getUserAllInfo(UserService.instance.uid);
    for (var fuid in jsondata['friend']) {
      print('친구 uid $fuid');
      friendData = await getUserAllInfo(fuid);
      print('친구 정보 $friendData ');
      //User friend = User.fromJson(friendData);
      // if (friendList.contains(friend) == false) {
      //   print('친구 추가 ');
      //   friendList.add(friend);
      // }
      // print(friendList);
      friendList.add(User.fromJson(friendData));
    }

    // List<User> friendlist=
    // friendList.value = friendlist;
    friendList.refresh();
    // List<Map<String, dynamic>> fakeJsonData = [
    //   {
    //     "nickname": "김미소",
    //     "level": 1,
    //     "address": "서울시 동작구",
    //     "point": 1300,
    //     "totalLank": 1,
    //     "weeklyLank": 1,
    //     "profileUrl":
    //         "https://i.namu.wiki/i/LODIWLJWeuBlogBkFQSu13l2s2HQ1dtMf0eN83PgIWw6koET_a4AozK3Gl3Vd8WzC5mRT-xmmsh9w5FMsM33SQ.webp",
    //     "totalQuest": 130,
    //     "friend": ["김밤비", "김햇살"]
    //   },
    //   {
    //     "nickname": "김밤비",
    //     "level": 1,
    //     "address": "부산시",
    //     "point": 10,
    //     "totalLank": 2,
    //     "weeklyLank": 2,
    //     "profileUrl":
    //         "https://mblogthumb-phinf.pstatic.net/MjAxODA3MTNfNTYg/MDAxNTMxNDY1NTU5ODc0.BapP8ZHcMVdlrl-aKZhMMyraIIO4z-dKzVF-HuaJxIwg.ZdVU-s0PevqySMhwm-eL0Y4cizz1mvFwnoI4mrI-LZAg.PNG.wkrquf0621/%EB%B9%A8%EA%B0%84%EB%B2%84%EC%84%AF.png?type=w800",
    //     "totalQuest": 10,
    //     "friend": ["김미소", "김햇살"]
    //   },
    //   // {"nickname": "김햇살", "level": "나무", "address": "서울시 강남구", "point": 1, "totalLank": 3, "weeklyLank": 3},
    //   // {"nickname": "김햇살", "level": "나무", "address": "서울시 강남구", "point": 1, "totalLank": 3, "weeklyLank": 3},
    //   // {"nickname": "김햇살", "level": "나무", "address": "서울시 강남구", "point": 1, "totalLank": 3, "weeklyLank": 3},
    // ];

    // List<User> fakeTalkings =
    //     fakeJsonData.map((jsonData) => User.fromJson(jsonData)).toList();
    //friendList.value = fakeTalkings;
  }
}
