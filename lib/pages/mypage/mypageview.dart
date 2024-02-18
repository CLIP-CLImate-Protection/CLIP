import 'package:flutter/material.dart';

import 'mypagecontroller.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  static const String url = '/mypage';

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final MyPageController _controller = MyPageController();
  Map<String, dynamic> _userInfo = {};

  @override
  Future<void> _getUserInfo() async {
    Map<String, dynamic> userInfo = await _controller.getUserAllInfo('uid');
    setState(() {
      _userInfo = userInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF278740),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  '내 정보',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: _userInfo['profileUrl'] != null ? NetworkImage(_userInfo['profileUrl']) : null,
                          child: _userInfo['profileUrl'] == null
                              ? Icon(
                                  Icons.person,
                                  size: 60,
                                  color: Colors.grey[600],
                                )
                              : null,
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _userInfo['nickname'] ?? '',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '레벨 ${_userInfo['level'] ?? ''}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              '서울 서초구', // 백엔드 코드 확인 후 변경하기 기능명세서에서 못 찾음..
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          width: 99,
                          height: 28,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF0D3),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Center(
                            child: Text(
                              '포인트 ${_userInfo['point'] ?? ''}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: FractionallySizedBox(
                        widthFactor: 0.7,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF278740),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {
                        // '다음 랭킹까지 남은 게이지'를 눌렀을 때 처리할 내용 추가
                        // 이동할 페이지로 네비게이션하도록 설정
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '다음 랭킹까지 남은 게이지(남은게이지 퍼센트)', //퍼센트 파이어베이스 처리 //아직 미구현
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25), // 25 크기의 간격 추가
                    Container(
                      width: 340,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // '메인 퀘스트 내역'을 눌렀을 때 처리할 내용 추가
                          // 이동할 페이지로 네비게이션하도록 설정
                        },
                        child: const Center(
                          child: Text(
                            '메인 퀘스트 내역',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 340,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // '일일 퀘스트 내역'을 눌렀을 때 처리할 내용 추가
                          // 이동할 페이지로 네비게이션하도록 설정
                        },
                        child: const Center(
                          child: Text(
                            '일일 퀘스트 내역',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 110), // 10 크기의 간격 추가
                    GestureDetector(
                      onTap: () {
                        // '로그아웃'을 눌렀을 때 처리할 내용 추가
                        // 로그아웃 기능 구현
                      },
                      child: const Center(
                        child: Text(
                          '로그아웃',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5), // 10 크기의 간격 추가
                    Container(
                      width: 347,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFCCEAC1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // '내 프로필 편집하기'을 눌렀을 때 처리할 내용 추가
                          // 이동할 페이지로 네비게이션하도록 설정
                        },
                        child: const Center(
                          child: Text(
                            '내 프로필 편집하기',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
