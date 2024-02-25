import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/common/common.dart';
import 'package:frontend/fastAPI/models/Quest.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/questdetails_controller.dart';
import 'component/questdetails_component.dart';

class UploadImagePage extends StatefulWidget {
  final Quest model;
  const UploadImagePage({Key? key, required this.model}) : super(key: key);

  static const String url = '/uploadimage';

  @override
  _UploadImagePageState createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadImagePage> {
  File? _image;
  final TextEditingController _nullController = TextEditingController(); //사용하지 않는 컨트롤런

  Future<void> _getImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            widget.model.questName!,
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              letterSpacing: -0.41,
            ),
          ),
        ),
        backgroundColor: Color(Common.mainColor),
        toolbarHeight: 70.0,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context, true);
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: Color(Common.subGray),
          ),
        ),
      ),
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
          //padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20), // 좌우 여백 추가
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const SizedBox(height: 50),
              // TitleBox(widget.model.questName!),
              const SizedBox(height: 20),
              CommentBox(widget.model.questDescription!),
              const SizedBox(height: 40), // 추가된 네모칸과의 간격 조정
              UploadBox(_getImage, _image, '음식을 다 먹고 빈 그릇을 찍어\n업로드해주세요.', 'image', _nullController),
              const SizedBox(height: 30),
              const ExImageViewer(),
              const SizedBox(height: 40),
              // 제출하기 버튼 추가
              SubmitButton()
            ],
          ),
        ),
      ),
    );
  }
}
