import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 라벨 숨기기
      home: Scaffold(
        body: UploadImagePage(),
      ),
    );
  }
}

class UploadImagePage extends StatefulWidget {
  @override
  _UploadImagePageState createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadImagePage> {
  File? _image;
  TextEditingController _descriptionController = TextEditingController();

  Future<void> _getImage() async {
    final pickedFile =
    await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF278740), Color(0xFF7EB78D)],
              stops: [0.5, 1.0],
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20), // 좌우 여백 추가
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Color(0xFFAEBDB2)),
                    onPressed: () {
                      // 이전으로 가는 기능을 추가
                    },
                  ),
                  SizedBox(width: 30), // 화살표와 '환경 관련 책/영상/다큐' 사이 간격 조정
                  Text(
                    '환경 관련 책/영상/다큐',
                    style: TextStyle(
                      fontFamily: 'Istok Web',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Container(
                width: 326,
                height: 95,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color(0xFFA4D1B1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  '설명 문구를 입력하세요',
                  textAlign: TextAlign.center, // 설명 문구 가운데 정렬
                  style: TextStyle(
                    fontFamily: 'Istok Web',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 5), // 추가된 네모칸과의 간격 조
              GestureDetector(
                child: Container(
                  width: 326,
                  height: 312,
                  margin: EdgeInsets.only(top: 20), // 설명문구 네모칸 아래에 30만큼의 여백 추가
                  decoration: BoxDecoration(
                    color: Colors.white, // 흰색 배경
                    borderRadius: BorderRadius.circular(15), // 네 모서리 라운드 처리
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '환경과 관련된 책/영상/다큐 등을 보고\n감상문을 남겨주세요.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w400, // Regular
                          color: Colors.black, // 텍스트 색상 변경
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 300,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Color(0xFFF1F5F1), // 회색 배경
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextField(
                          controller: _descriptionController,
                          maxLength: 200,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText:
                            '환경과 관련된 책/영상/다큐 등의 감상문을 입력하세요 (최대 200자)',
                            contentPadding: EdgeInsets.all(15),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 326,
                height: 68,
                child: ElevatedButton(
                  onPressed: () {
                    // 제출하기 버튼 누를 때 수행할 동작 추가
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFAE474), // 버튼 배경색
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // 버튼을 라운드 처리
                    ),
                  ),
                  child: Text(
                    '제출하기',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Work Sans', // 글자체
                      fontSize: 26, // 글자 크기
                      fontWeight: FontWeight.w500, // Medium 처리
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
