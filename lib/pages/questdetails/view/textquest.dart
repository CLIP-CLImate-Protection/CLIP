import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'component/questdetails_component.dart';


class UploadTextPage extends StatefulWidget {
  const UploadTextPage({Key? key}) : super(key: key);

  static const String url = '/'; //url 미정

  @override
  _UploadTextPageState createState() => _UploadTextPageState();
}

class _UploadTextPageState extends State<UploadTextPage> {
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
              TitleBox('환경 관련 책/영상/다큐'),
              const SizedBox(height: 40),
              CommentBox(),
              const SizedBox(height: 5), // 추가된 네모칸과의 간격 조
              UploadBox(_getImage, _image, '환경과 관련된 책/영상/다큐 등의 감상문을 입력하세요 (최대 200자)', 'text', _descriptionController),
              const SizedBox(height: 20),
              SubmitButton()
            ],
          ),
        ),
      ),
    );
  }
}
