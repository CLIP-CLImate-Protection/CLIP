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
  bool _isImageVisible = false;

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
                  SizedBox(width: 70), // 화살표와 '잔반 남기지 않기' 사이 간격 조정
                  Text(
                    '잔반 남기지 않기',
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
              SizedBox(height: 5), // 추가된 네모칸과의 간격 조정
              GestureDetector(
                onTap: _getImage,
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
                        '음식을 다 먹고 빈 그릇을 찍어\n업로드해주세요.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w400, // Regular
                          color: Colors.black, // 텍스트 색상 변경
                        ),
                      ),
                      SizedBox(height: 20),
                      _image == null
                          ? Container(
                        width: 242,
                        height: 199,
                        decoration: BoxDecoration(
                          color: Color(0xFFF1F5F1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: 40,
                            color: Color(0xFF888888),
                          ),
                        ),
                      )
                          : Image.file(_image!),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isImageVisible = !_isImageVisible;
                  });
                },
                child: Text(
                  '예시 사진',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w400, // Regular
                    color: Colors.white, // 텍스트 색상 변경
                  ),
                ),
              ),
              SizedBox(height: 10),
              _isImageVisible
                  ? Image.asset(
                'assets/exbowl.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              )
                  : SizedBox(height: 0), // 이미지를 보이거나 숨길 때 공간 차지하지 않도록 함
              SizedBox(height: 10),

              // 제출하기 버튼 추가
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

