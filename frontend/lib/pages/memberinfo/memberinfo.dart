import 'package:flutter/material.dart';

/* void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '회원 정보 입력 페이지',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MemberInfoPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MemberInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MemberInfoForm(),
    );
  }
} */

class MemberInfoForm extends StatefulWidget {
  static const String url = '/memberinfo';
  @override
  _MemberInfoFormState createState() => _MemberInfoFormState();
}

class _MemberInfoFormState extends State<MemberInfoForm> {
  bool _bottomSheetVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
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
              padding: EdgeInsets.only(top: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '회원 정보 입력',
                    style: TextStyle(
                      fontFamily: 'Kantumruy',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  SizedBox(height: 40),
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 40,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        // 이미지 추가 기능 구현
                      },
                    ),
                  ),
                  SizedBox(height: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '닉네임',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 341,
                        height: 49,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10), // 모서리 둥글게 처리
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20), // 패딩 설정
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: '닉네임을 입력하세요',
                            hintStyle:
                                TextStyle(color: Colors.white.withOpacity(0.5)),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '거주 지역',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 341,
                        height: 49,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10), // 모서리 둥글게 처리
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _bottomSheetVisible = !_bottomSheetVisible;
                            });
                          },
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _bottomSheetVisible = !_bottomSheetVisible;
                              });
                            },
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.start, // 텍스트 왼쪽 정렬
                              children: [
                                SizedBox(width: 10), // 왼쪽 여백 추가
                                Text(
                                  '지역 선택하기',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.5)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(), // 화면 가운데 정렬을 위해 추가
                  Container(
                    width: 341,
                    height: 68,
                    decoration: BoxDecoration(
                      color: Color(0xFFFDE3A0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        // 가입하기 버튼 클릭 시 동작
                      },
                      child: Text(
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
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          if (_bottomSheetVisible)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _bottomSheetVisible = false;
                  });
                },
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          if (_bottomSheetVisible)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: BottomSheetWidget(),
            ),
        ],
      ),
    );
  }
}

class BottomSheetWidget extends StatefulWidget {
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  String selectedCity = '서울시'; // 초기 선택 시 서울시로 설정

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '지역 선택',
              style: TextStyle(
                fontFamily: 'Kantumruy',
                fontSize: 24,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
          Divider(thickness: 1),
          // 지역 리스트 넣기
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 10,
                columns: [
                  DataColumn(
                    label: SizedBox(
                      width: 115,
                      height: 49,
                      child: Center(child: Text('시')),
                    ),
                  ),
                  DataColumn(
                    label: SizedBox(
                      width: 240,
                      height: 49,
                      child: Center(child: Text('구')),
                    ),
                  ),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedCity = '서울시';
                          });
                        },
                        child: SizedBox(
                          width: 115,
                          height: 49,
                          child: Center(child: Text('서울')),
                        ),
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        width: 240,
                        height: 49,
                        child: Center(child: buildRightColumn(selectedCity)),
                      ),
                    ),
                  ]),
                  DataRow(cells: [
                    DataCell(
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedCity = '경기도';
                          });
                        },
                        child: SizedBox(
                          width: 115,
                          height: 49,
                          child: Center(child: Text('경기')),
                        ),
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        width: 240,
                        height: 49,
                        child: Center(child: buildRightColumn(selectedCity)),
                      ),
                    ),
                  ]),
                  // 나머지 시 추가
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 오른쪽 칸의 내용을 동적으로 생성하는 함수
  Widget buildRightColumn(String city) {
    switch (city) {
      case '서울':
        return Text('서울시 관련 내용');
      case '경기':
        return Text('경기도 관련 내용');
      case '인천':
        return Text('인천 관련 내용');
      // 나머지 시에 대한 내용 추가
      default:
        return Text('선택된 지역의 내용');
    }
  }
}
