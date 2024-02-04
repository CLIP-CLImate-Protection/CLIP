// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<String> googleSingIn() async {
  User currentUser;

  final GoogleSignInAccount? account = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await account!.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  UserCredential authResult = await _auth.signInWithCredential(credential);
  User user = authResult.user!;
  print(user.uid);

  if (await userExistsInDB(user.uid)) {
    print(1);
    return 'Google login successful: $user';
  } else {
    await createNewUserDocument(user.uid);
    return 'First login successful: $user';
  }
}

Future<bool> userExistsInDB(String uid) async {
  try {
    print('DB check: $uid');
    CollectionReference usersCollection = FirebaseFirestore.instance.collection('Users');
    DocumentSnapshot documentSnapshot = await usersCollection.doc(uid).get();
    print(documentSnapshot.exists);
    return documentSnapshot.exists;
  } catch (e) {
    print('Error checking user existence: $e');
    return false;
  }
}

Future<void> createNewUserDocument(String uid) async {
  try {
    print('Creating new user document: $uid');
    // CollectionReference usersCollection =
    //     FirebaseFirestore.instance.collection('Users');
    // await usersCollection.doc(uid);

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .set({'address': 'address', 'friend': [], 'level': 1, 'nickname': 'nickname', 'point': 0, 'totalQuest': 0, 'profileUrl': 'profileUrl'});
  } catch (e) {
    print('Error creating new user document: $e');
  }
}

Future<String> googleSignOut() async {
  await _auth.signOut();
  await _googleSignIn.signOut();

  // setState(() {
  //   email = "";
  //   url = "";
  //   name = "";
  // });

  return 'logout';
}

Future<String> getUserInfo(String email, String nickname, String uid, String address) async {
  //입력 받은 정보를 해당하는 uid문서를 찾아서
  //필드에 저장
  await _firestore.collection('Users').doc(uid).set({
    'nickname': nickname,
    'address': address,
  });

  return 'success';
}

Future<Map<String, List<String>>> getUserGrassInfo(String uid, String date) async {
  DocumentSnapshot documentSnapshot = await _firestore.collection('Users').doc(uid).collection('grass').doc(date).get();

  List<String> daily = documentSnapshot['daily'];
  print('daily: $daily');

  List<String> main = documentSnapshot['main'];
  print('main: $main');

  Map<String, List<String>> grassInfo = {
    'daily': daily,
    'main': main,
  };

  return grassInfo;
}

// Future<String> getUserGrassList(String uid, String month) async {
//   try {
//     DateTime monthDateTime = DateTime.parse('$month-01');

//     //이 기간 동안 문서 다 가져와야함
//     DateTime startDate = monthDateTime;
//     DateTime endDate = monthDateTime.add(Duration(days: 31));

//     CollectionReference grassCollection =
//         _firestore.collection('Users').doc(uid).collection('grass');
//     QuerySnapshot querySnapshot = await grassCollection.get();

//     for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
//       String documentName = documentSnapshot.id;
//       print('Document Name: $documentName');

//       List<String> daily = documentSnapshot['daily'];
//       List<String> main = documentSnapshot['main'];
//       print('daily: $daily');
//       print('main: $main');
//     }

//     return 'Successfully retrieved grass list for $month';
//   } catch (e) {
//     print('Error getting user grass list: $e');
//     return 'Error retrieving grass list';
//   }
// }

Future<int> getUserGrassList(String uid, String date) async {
  List<String>? daily;
  List<String>? main;
  try {
    // DateTime timestampDateTime = DateTime.parse(date);

    // String month = timestampDateTime.month.toString().padLeft(2, '0');
    // String year = timestampDateTime.year.toString();

    // DateTime startDate = DateTime(int.parse(year), int.parse(month), 1);
    // DateTime endDate = DateTime(int.parse(year), int.parse(month) + 1, 1);

    CollectionReference grassCollection = _firestore.collection('Users').doc(uid).collection('grass');
    QuerySnapshot querySnapshot = await grassCollection.where('date').get();

    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      daily = List<String>.from(documentSnapshot['daily']);
      main = List<String>.from(documentSnapshot['main']);
    }

    int dailyCount = daily?.length ?? 0;
    int mainCount = main?.length ?? 0;

    return dailyCount + mainCount;
  } catch (e) {
    print('Error getting user grass list: $e');
    return 0;
  }
}

Future<int> getUserPoint(String uid) async {
  try {
    DocumentSnapshot documentSnapshot = await _firestore.collection('Users').doc(uid).get();
    int point = documentSnapshot['point'];
    return point;
  } catch (e) {
    print('Error getting user point: $e');
    return 0;
  }
}

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

Future<String> updateUserPoint(String uid, int point) async {
  try {
    await _firestore.collection('Users').doc(uid).update({'point': point});
    return 'Successfully updated user point';
  } catch (e) {
    print('Error updating user point: $e');
    return 'Error updating user point';
  }
}

Future<String> updateUserLevel(String uid, int level) async {
  try {
    await _firestore.collection('Users').doc(uid).update({'level': level});
    return 'Successfully updated user level';
  } catch (e) {
    print('Error updating user level: $e');
    return 'Error updating user level';
  }
}

Future<String> updateUserTotalQuest(String uid, int totalQuest) async {
  try {
    await _firestore.collection('Users').doc(uid).update({'totalQuest': totalQuest});
    return 'Successfully updated user total quest';
  } catch (e) {
    print('Error updating user total quest: $e');
    return 'Error updating user total quest';
  }
}

Future<String> updateUserProfileUrl(String uid, String profileUrl) async {
  try {
    await _firestore.collection('Users').doc(uid).update({'profileUrl': profileUrl});
    return 'Successfully updated user profile url';
  } catch (e) {
    print('Error updating user profile url: $e');
    return 'Error updating user profile url';
  }
}
