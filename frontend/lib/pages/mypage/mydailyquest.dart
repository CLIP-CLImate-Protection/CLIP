import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 라벨 숨기기
      home: DailyQuestPage(),
    );
  }
}

class DailyQuestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // 투명한 앱 바
        elevation: 0, // 그림자 제거
        title: Row(
          children: [
            SizedBox(width: 33), // 간격 추가
            Text(
              '일일 퀘스트 내역',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // 화살표 색상 검정
          onPressed: () {
            // 이전 페이지로 이동하는 기능 추가
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Color(0xFF278740), // 페이지 배경색: 흰색
      body: Center(
        child: Container(
          width: 380, // 네모의 너비
          height: 580,
          margin: EdgeInsets.symmetric(horizontal: 5), // 좌우 간격 조절
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}

