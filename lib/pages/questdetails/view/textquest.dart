import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/common/common.dart';
import 'package:frontend/fastAPI/models/Quest.dart';
import 'package:image_picker/image_picker.dart';

import 'component/questdetails_component.dart';

class UploadTextPage extends StatefulWidget {
  final Quest model;
  const UploadTextPage({Key? key, required this.model}) : super(key: key);

  static const String url = '/'; //url 미정

  @override
  _UploadTextPageState createState() => _UploadTextPageState();
}

class _UploadTextPageState extends State<UploadTextPage> {
  File? _image;
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _getImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

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
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const SizedBox(height: 50),
              // TitleBox(widget.model.questName!),
              const SizedBox(height: 20),
              CommentBox(widget.model.questDescription!),
              const SizedBox(height: 30), // 추가된 네모칸과의 간격 조
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
