import 'package:flutter/material.dart';
import 'mypagecontroller.dart'; // mypagecontroller.dart 파일을 import 합니다.

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final MyPageController _controller = MyPageController();
  Map<String, dynamic> _userInfo = {};

  @override
  void initState() {
    super.initState();
    _getUserInfo();
  }

  Future<void> _getUserInfo() async {
    Map<String, dynamic> userInfo = await _controller.getUserAllInfo('uid');
    setState(() {
      _userInfo = userInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF278740),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Center(
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
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(20),
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
                            backgroundImage: _userInfo['profileUrl'] != null
                                ? NetworkImage(_userInfo['profileUrl'])
                                : null,
                            child: _userInfo['profileUrl'] == null
                                ? Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.grey[600],
                            )
                                : null,
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _userInfo['nickname'] ?? '',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '레벨 ${_userInfo['level'] ?? ''}',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '서울 서초구',  // 백엔드 코드 확인 후 변경하기 기능명세서에서 못 찾음..
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            width: 99,
                            height: 28,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFF0D3),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Center(
                              child: Text(
                                '포인트 ${_userInfo['point'] ?? ''}',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
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
                              color: Color(0xFF278740),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {
                          // '다음 랭킹까지 남은 게이지'를 눌렀을 때 처리할 내용 추가
                          // 이동할 페이지로 네비게이션하도록 설정
                        },
                        child: Row(
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
                      SizedBox(height: 25), // 25 크기의 간격 추가
                      Container(
                        width: 340,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            // '메인 퀘스트 내역'을 눌렀을 때 처리할 내용 추가
                            // 이동할 페이지로 네비게이션하도록 설정
                          },
                          child: Center(
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
                      SizedBox(height: 10),
                      Container(
                        width: 340,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            // '일일 퀘스트 내역'을 눌렀을 때 처리할 내용 추가
                            // 이동할 페이지로 네비게이션하도록 설정
                          },
                          child: Center(
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
                      SizedBox(height: 110), // 10 크기의 간격 추가
                      GestureDetector(
                        onTap: () {
                          // '로그아웃'을 눌렀을 때 처리할 내용 추가
                          // 로그아웃 기능 구현
                        },
                        child: Center(
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
                      SizedBox(height: 5), // 10 크기의 간격 추가
                      Container(
                        width: 347,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Color(0xFFCCEAC1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            // '내 프로필 편집하기'을 눌렀을 때 처리할 내용 추가
                            // 이동할 페이지로 네비게이션하도록 설정
                          },
                          child: Center(
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
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


