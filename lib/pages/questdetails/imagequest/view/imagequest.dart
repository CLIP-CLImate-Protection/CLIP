import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/questdetails/imagequest/view/component/imagequest_component.dart';
import 'package:image_picker/image_picker.dart';

import '../../../quest/view/quest_main_view_page.dart';
import '../controller/imagequest_controller.dart';

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
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF278740), Color(0xFF7EB78D)],
              stops: [0.5, 1.0],
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20), // 좌우 여백 추가
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Color(0xFFAEBDB2)),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  const SizedBox(width: 70), // 화살표와 '잔반 남기지 않기' 사이 간격 조정
                  const Text(
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
              const SizedBox(height: 40),
              CommentBox(),
              const SizedBox(height: 30), // 추가된 네모칸과의 간격 조정
              UploadBox(_getImage, _image),
              const SizedBox(height: 30),
              ExImageViewer(),
              const SizedBox(height: 100),
              // 제출하기 버튼 추가
              SubmitButton()
            ],
          ),
        ),
      ),
    );
  }
}