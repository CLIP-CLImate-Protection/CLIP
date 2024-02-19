import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<List<Map<String, dynamic>>> getTopQuestUsers() async {
  try {
    QuerySnapshot querySnapshot = await _firestore.collection('Users').orderBy('totalQuest', descending: true).limit(5).get();

    List<Map<String, dynamic>> topQuestUsers = [];

    for (QueryDocumentSnapshot document in querySnapshot.docs) {
      String uid = document.id;
      String nickname = document['nickname'];
      String profileUrl = document['profileUrl'];
      int totalQuest = document['totalQuest'];

      Map<String, dynamic> userData = {
        'uid': uid,
        'nickname': nickname,
        'profileUrl': profileUrl,
        'totalQuest': totalQuest,
      };

      topQuestUsers.add(userData);
    }

    return topQuestUsers;
  } catch (e) {
    print('Error getting top quest users: $e');
    return [];
  }
}

Future<List<String>> getAllUserNicknameList() async {
  try {
    List<String> nicknameList = [];
    _firestore.collection('Users').get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        nicknameList.add(doc['nickname']);
      }
    });
    print(nicknameList);
    return nicknameList;
  } catch (e) {
    print('Error getting all user nickname list: $e');
    return [];
  }
}

// Future<List<Map<String, dynamic>>> getTopQuestUsersInWeek() async {
//   try {
//     // Calculate the start and end dates for the week
//     DateTime currentDate = DateTime.now();
//     DateTime weekStartDate = currentDate.subtract(Duration(days: currentDate.weekday - 1));
//     DateTime weekEndDate = weekStartDate.add(Duration(days: 6));

//     CollectionReference grassCollection =
//         _firestore.collection('Users').doc().collection('grass');
//     QuerySnapshot querySnapshot = await grassCollection.get();

//     for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
//       String documentName = documentSnapshot.id;
//       print('Document Name: $documentName');

//       List<String> daily = documentSnapshot['daily'];
//       List<String> main = documentSnapshot['main'];
//     // QuerySnapshot querySnapshot = await _firestore
//     //     .collection('Users')
//     //     .orderBy('totalQuest', descending: true)
//     //     .limit(5)
//     //     .get();

//     List<Map<String, dynamic>> topQuestUsersInWeek = [];

//     for (QueryDocumentSnapshot document in querySnapshot.docs) {
//       String uid = document.id;
//       String nickname = document['nickname'];
//       String profileUrl = document['profileUrl'];
//       int totalQuest = document['totalQuest'];

//       // Check if the user has completed quests for the week
//       QuerySnapshot grassSnapshot = await _firestore
//           .collection('Users')
//           .doc(uid)
//           .collection('grass')
//           .where('date', isGreaterThanOrEqualTo: weekStartDate, isLessThanOrEqualTo: weekEndDate)
//           .get();

//       if (grassSnapshot.docs.isNotEmpty) {
//         Map<String, dynamic> userData = {
//           'uid': uid,
//           'nickname': nickname,
//           'profileUrl': profileUrl,
//           'totalQuest': totalQuest,
//         };

//         topQuestUsersInWeek.add(userData);
//       }
//     }

//     return topQuestUsersInWeek;
//   } catch (e) {
//     print('Error getting top quest users in the week: $e');
//     return [];
//   }
//   }

Future<List<Map<String, dynamic>>> getTopQuestUsersWithSameAddress(String uid) async {
  try {
    DocumentSnapshot userSnapshot = await _firestore.collection('Users').doc(uid).get();
    String userAddress = userSnapshot['address'];

    QuerySnapshot querySnapshot =
        await _firestore.collection('Users').where('address', isEqualTo: userAddress).orderBy('totalQuest', descending: true).limit(5).get();

    List<Map<String, dynamic>> topQuestUsersWithSameAddress = [];

    for (QueryDocumentSnapshot document in querySnapshot.docs) {
      String otherUid = document.id;
      String nickname = document['nickname'];
      String profileUrl = document['profileUrl'];
      int totalQuest = document['totalQuest'];

      Map<String, dynamic> userData = {
        'uid': otherUid,
        'nickname': nickname,
        'profileUrl': profileUrl,
        'totalQuest': totalQuest,
      };

      topQuestUsersWithSameAddress.add(userData);
    }

    return topQuestUsersWithSameAddress;
  } catch (e) {
    print('Error getting top quest users with same address: $e');
    return [];
  }
}

Future<Map<String, dynamic>> searchUserByNickname(String keyword) async {
  try {
    QuerySnapshot querySnapshot = await _firestore.collection('Users').where('nickname', isEqualTo: keyword).get();
    Map<String, dynamic> searchResult = {};
    for (QueryDocumentSnapshot document in querySnapshot.docs) {
      String uid = document.id;
      String nickname = document['nickname'];
      String profileUrl = document['profileUrl'];
      int totalQuest = document['totalQuest'];
      String address = document['address'];
      int level = document['level'];
      int point = document['point'];

      Map<String, dynamic> userData = {
        'uid': uid,
        'nickname': nickname,
        'profileUrl': profileUrl,
        'totalQuest': totalQuest,
        'address': address,
        'level': level,
        'point': point,
      };
      searchResult = userData;
    }
    return searchResult;
  } catch (e) {
    print('Error searching user by nickname: $e');
    return {};
  }
}

Future<String> addFriend(String uid, String friendUid) async {
  try {
    DocumentReference userReference = _firestore.collection('Users').doc(uid);
    DocumentSnapshot userSnapshot = await userReference.get();
    List<dynamic> friends = userSnapshot['friend'];
    if (friends.contains(friendUid)) {
      return 'already friends';
    } else {
      friends.add(friendUid);
      await userReference.update({'friend': friends});
      return 'success';
    }
  } catch (e) {
    print('Error adding friend: $e');
    return 'fail';
  }
}
