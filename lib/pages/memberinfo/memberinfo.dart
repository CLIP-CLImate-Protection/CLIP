import 'package:flutter/material.dart';
import 'package:frontend/backend/UserService/user_service.dart';
import 'package:frontend/service/user_service.dart';
import 'package:get/get.dart';

class MemberInfoForm extends StatefulWidget {
  static const String url = '/memberinfo';

  const MemberInfoForm({super.key});
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
                  Color(0xFF278740), // 그라데이션 시작 색
                  Color(0xFF7EB78D), // 그라데이션 종료 색
                ],
                stops: [0.5, 1.0], // 그라데이션 위치
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
                        // 이미지 추가 기능 구현
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
                          borderRadius: BorderRadius.circular(10), // 모서리 둥글게 처리
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20), // 패딩 설정
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
                          borderRadius: BorderRadius.circular(10), // 모서리 둥글게 처리
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20), // 패딩 설정
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
                  const Spacer(), // 화면 가운데 정렬을 위해 추가
                  Container(
                    width: 341,
                    height: 68,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFDE3A0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        String nickname = nicknameController.text; // 가입하기 버튼 클릭 시 동작
                        String address = addressController.text; // 사용자가 입력한 주소
                        // String uid = UserService.instance.uid; // 사용자 uid
                        // print(uid);
                        getUserInfo(nickname, UserService.instance.uid, address); // 사용자 정보 저장 함수 호출
                        showSnackBar(); // 회원가입 성공 시 스낵바 출력
                        Navigator.pushNamed(context, '/main'); // 메인 페이지로 이동
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
