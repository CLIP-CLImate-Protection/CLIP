import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MyPageController extends GetxController {
  static MyPageController get instance => Get.find<MyPageController>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<Map<String, dynamic>> getUserAllInfo(String uid) async {
    try {
      DocumentSnapshot documentSnapshot = await _firestore.collection('Users').doc(uid).get();
      List<String> friend = List<String>.from(documentSnapshot['friend']);
      int level = documentSnapshot['level'];
      String nickname = documentSnapshot['nickname'];
      int point = documentSnapshot['point'];
      int totalQuest = documentSnapshot['totalQuest'];
      String profileUrl = documentSnapshot['profileUrl'];

      Map<String, dynamic> userInfo = {
        'friend': friend,
        'level': level,
        'nickname': nickname,
        'point': point,
        'totalQuest': totalQuest,
        'profileUrl': profileUrl,
      };

      return userInfo;
    } catch (e) {
      print('Error getting user all info: $e');
      return {};
    }
  }
}
