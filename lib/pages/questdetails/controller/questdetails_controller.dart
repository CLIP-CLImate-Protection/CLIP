import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class ExImageViewer extends StatefulWidget {
  const ExImageViewer({Key? key}) : super(key: key);

  @override
  State<ExImageViewer> createState() => _ExImageViewerState();
}

class _ExImageViewerState extends State<ExImageViewer> {

  bool _isImageVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isImageVisible = !_isImageVisible;
              });
            },
            child: const Text(
              '예시 사진',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w400, // Regular
                color: Colors.white, // 텍스트 색상 변경
              ),
            ),
          ),
          const SizedBox(height: 10),
          _isImageVisible
              ? Image.asset(
            'assets/exbowl.png',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          )
              : const SizedBox(height: 0), // 이미지를 보이거나 숨길 때 공간 차지하지 않도록 함
        ]
    );
  }
}


class ImageUploader extends StatefulWidget {
  const ImageUploader({Key? key}) : super(key: key);

  @override
  State<ImageUploader> createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  XFile? _image;
  final ImagePicker picker = ImagePicker();

  //이미지를 가져오는 함수
  Future getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 242,
        height: 199,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F5F1),
          borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        child: Center(
          child: _image == null
              ? const Icon(
            Icons.add,
            size: 40,
            color: Color(0xFF888888),
          )
              : Image.file(
            File(_image!.path),
            //fit: BoxFit.cover,
          ),
        ),
        onTap: () async{
          getImage(ImageSource.gallery);
        }
      )
    );
  }
}
