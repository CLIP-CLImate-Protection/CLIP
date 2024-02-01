import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  // assert(!user.isAnonymous);
  // assert(await user.getIdToken() != null);

  // currentUser = await _auth.currentUser();
  // assert(user.uid == currentUser.uid);

  // setState(() {
  //   email = user.email;
  //   url = user.photoUrl;
  //   name = user.displayName;
  // });

  if (await userExistsInDB(user.uid)) {
    return 'Google login successful: $user';
  } else {
    await createNewUserDocument(user.uid);
    return 'First login successful: $user';
  }
}

Future<bool> userExistsInDB(String uid) async {
  try {
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('Users');
    DocumentSnapshot documentSnapshot = await usersCollection.doc(uid).get();
    return documentSnapshot.exists;
  } catch (e) {
    print('Error checking user existence: $e');
    return false;
  }
}

Future<void> createNewUserDocument(String uid) async {
  try {
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('Users');
    await usersCollection.doc(uid);
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

Future<String> getUserInfo(
    String email, String nickname, String uid, String address) async {
  //입력 받은 정보를 해당하는 uid문서를 찾아서
  //필드에 저장
  await _firestore.collection('Users').doc(uid).set({
    'email': email,
    'nickname': nickname,
    'address': address,
  });

  return 'success';
}

Future<String> getUserGrassInfo(String uid, String date) async {
  //입력 받은 정보를 해당하는 uid문서를 찾아서
  //필드에 저장
  DocumentSnapshot documentSnapshot = await _firestore
      .collection('Users')
      .doc(uid)
      .collection('grass')
      .doc(date)
      .get();
  List<String> daily = documentSnapshot['daily'];
  print('daily: $daily');
  List<String> main = documentSnapshot['main'];
  print('main: $main');
  return 'dffd';
}

Future<String> getUserGrassList(String uid, String month) async {
  try {
    DateTime monthDateTime = DateTime.parse('$month-01');

    //이 기간 동안 문서 다 가져와야함
    DateTime startDate = monthDateTime;
    DateTime endDate = monthDateTime.add(Duration(days: 31));

    CollectionReference grassCollection =
        _firestore.collection('Users').doc(uid).collection('grass');
    QuerySnapshot querySnapshot = await grassCollection.get();

    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      String documentName = documentSnapshot.id;
      print('Document Name: $documentName');

      List<String> daily = documentSnapshot['daily'];
      List<String> main = documentSnapshot['main'];
      print('daily: $daily');
      print('main: $main');
    }

    return 'Successfully retrieved grass list for $month';
  } catch (e) {
    print('Error getting user grass list: $e');
    return 'Error retrieving grass list';
  }
}

Future<String> getUserGrassList2(String uid, String timestamp) async {
  List<String>? daily;
  List<String>? main;
  try {
    DateTime timestampDateTime = DateTime.parse(timestamp);

    String month = timestampDateTime.month.toString().padLeft(2, '0');
    String year = timestampDateTime.year.toString();

    DateTime startDate = DateTime(int.parse(year), int.parse(month), 1);
    DateTime endDate = DateTime(int.parse(year), int.parse(month) + 1, 1);

    CollectionReference grassCollection =
        _firestore.collection('Users').doc(uid).collection('grass');
    QuerySnapshot querySnapshot = await grassCollection
        .where('timestamp',
            isGreaterThanOrEqualTo: startDate, isLessThan: endDate)
        .get();

    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      daily = List<String>.from(documentSnapshot['daily']);
      main = List<String>.from(documentSnapshot['main']);
    }

    int dailyCount = daily?.length ?? 0;
    int mainCount = main?.length ?? 0;

    return 'Successfully retrieved grass list for $month-$year';
  } catch (e) {
    print('Error getting user grass list: $e');
    return 'Error retrieving grass list';
  }
}
