import 'package:flutter/material.dart';

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