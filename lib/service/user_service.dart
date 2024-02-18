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

  Future<int> googleSingIn() async {
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
    const storage = FlutterSecureStorage();
    if (await userExistsInDB(user.uid)) {
      //바로 메인으로 넘어가야함
      return 1;
    } else {
      if (await createNewUserDocument(user.uid)) {
        //닉네임, 주소 입력 페이지로 넘어가야함
        await storage.write(key: 'uid', value: user.uid);
        return 2;
      } else {
        return 3;
      }
    }
  }
}
