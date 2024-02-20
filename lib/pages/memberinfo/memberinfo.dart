import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend/backend/UserService/user_service.dart';
import 'package:get/get.dart';

String currentUserUID = '';
String currentUserAddress = '';

class MemberInfoForm extends StatefulWidget {
  static const String url = '/memberinfo';

  const MemberInfoForm({Key? key}) : super(key: key);

  @override
  _MemberInfoFormState createState() => _MemberInfoFormState();
}

class _MemberInfoFormState extends State<MemberInfoForm> {
  final bool _bottomSheetVisible = false;
  final nicknameController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF278740),
                  Color(0xFF7EB78D),
                ],
                stops: [0.5, 1.0],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '회원 정보 입력',
                    style: TextStyle(
                      fontFamily: 'Kantumruy',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  const SizedBox(height: 40),
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(
                        Icons.add,
                        size: 40,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        //이미지 받기
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '닉네임',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 341,
                        height: 49,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: nicknameController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: '닉네임을 입력하세요',
                            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        '거주 지역',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 341,
                        height: 49,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: addressController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: '서울시는 구까지, 그 외는 시까지 입력하세요',
                            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 341,
                    height: 68,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFDE3A0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () async {
                        String nickname = nicknameController.text;
                        String address = addressController.text;

                        bool isSuccess = await getUserInfo(nickname, currentUserUID, address);
                        //bool isSuccess = await createNewUserDocument(currentUserUID, profileUrl, nickname, address);
                        //백엔드 메서드 인자 4개로 바꿀 수 있는지 확인, 이미지 url 받는 거 구현하기.

                        if (isSuccess) {
                          const storage = FlutterSecureStorage();
                          storage.write(key: 'isLogin', value: 'true');
                          showSnackBar();
                          Navigator.pushNamed(context, '/main');
                        } else {
                          // 회원가입 실패 시 처리
                        }
                      },
                      child: const Text(
                        '가입하기',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showSnackBar() {
  Get.snackbar(
    "알림",
    "회원가입에 성공했습니다.",
    snackPosition: SnackPosition.TOP,
    backgroundColor: const Color.fromARGB(71, 255, 255, 255),
    colorText: Colors.black,
  );
}

// Future<bool> createNewUserDocument(String uid, String profileUrl, String nickname, String address) async {
//   try {
//     print('Creating new user document: $uid');
//
//     await FirebaseFirestore.instance
//         .collection('Users')
//         .doc(uid)
//         .set({
//       'address': address,
//       'friend': [],
//       'level': 1,
//       'nickname': nickname,
//       'point': 0,
//       'totalQuest': 0,
//       'profileUrl': profileUrl
//     });
//
//     String currentDate = DateTime.now().toString();
//     FirebaseFirestore.instance.collection('Users').doc(uid).collection('grass').doc(currentDate).set({
//       'cover': 0,
//       'daily': [],
//       'main': [],
//     });
//     return true;
//   } catch (e) {
//     print('Error creating new user document: $e');
//     return false;
//   }
// }

