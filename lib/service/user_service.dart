import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend/backend/UserService/user_service.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class UserService extends GetxService {
  static UserService get instance => Get.find<UserService>();

  String uid = 'null';

  Future<UserService> init() async {
    const storage = FlutterSecureStorage();
    uid = await storage.read(key: 'uid') ?? 'null';
    return this;
  }

  Future<int> googleSignIn() async {
    final GoogleSignInAccount? account = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await account!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential authResult = await _auth.signInWithCredential(credential);
    User user = authResult.user!;

    const storage = FlutterSecureStorage();
    if (await userExistsInDB(user.uid)) {
      return 1;
    } else {
      if (await createNewUserDocument(user.uid)) {
        await storage.write(key: 'uid', value: user.uid);
        await UserService.instance.init(); // Wait for initialization
        print(await storage.read(key: 'uid') ?? "null"); // Print UID from storage
        print('${UserService.instance.uid} 유저 서비스'); // Print UID from UserService
        return 2;
      } else {
        return 3;
      }
    }
  }
}
