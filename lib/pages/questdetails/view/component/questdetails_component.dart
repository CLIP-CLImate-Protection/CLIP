import 'package:flutter/material.dart';
import 'package:frontend/pages/questdetails/controller/questdetails_controller.dart';
import 'package:get/get.dart';

Widget TitleBox(String title) {
  return Row(
    children: [
      IconButton(
        icon: const Icon(Icons.arrow_back, color: Color(0xFFAEBDB2)),
        onPressed: () {
          Get.back();
        },
      ),
      const SizedBox(width: 30), // 화살표와 '환경 관련 책/영상/다큐' 사이 간격 조정
      Text(
        title,
        style: const TextStyle(
          fontFamily: 'Istok Web',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ],
  );
}

Widget CommentBox() {
  return Container(
    width: 326,
    height: 95,
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: const Color(0xFFA4D1B1),
      borderRadius: BorderRadius.circular(15),
    ),
    child: const Text(
      '설명 문구를 입력하세요',
      textAlign: TextAlign.center, // 설명 문구 가운데 정렬
      style: TextStyle(
        fontFamily: 'Istok Web',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}

<<<<<<< HEAD
Widget UploadBox(_getImage, _image, String comment, String option, controller) {
=======
Widget UploadBox(getImage, image, String comment, String option, controller) {
>>>>>>> 1bd6c050e9914d46a22b915c916193863ee2d128
  return Container(
    width: 326,
    height: 312,
    margin: const EdgeInsets.only(top: 30), // 설명문구 네모칸 아래에 30만큼의 여백 추가
    decoration: BoxDecoration(
      color: Colors.white, // 흰색 배경
      borderRadius: BorderRadius.circular(15), // 네 모서리 라운드 처리
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          comment,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w400, // Regular
            color: Colors.black, // 텍스트 색상 변경
          ),
        ),
        const SizedBox(height: 20),
        option == 'image'
            ? const ImageUploader()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F1), // 회색 배경
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      controller: controller,
                      maxLength: 200,
                      maxLines: null,
                      decoration: const InputDecoration(
                        hintText: '환경과 관련된 책/영상/다큐 등의 감상문을 입력하세요 (최대 200자)',
                        contentPadding: EdgeInsets.all(15),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              )
      ],
    ),
  );
}

Widget SubmitButton() {
  return SizedBox(
    width: 326,
    height: 68,
    child: ElevatedButton(
      onPressed: () {
        // 제출하기 버튼 누를 때 수행할 동작 추가
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFAE474), // 버튼 배경색
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // 버튼을 라운드 처리
        ),
      ),
      child: const Text(
        '제출하기',
        style: TextStyle(
          fontFamily: 'Work Sans', // 글자체
          fontSize: 26, // 글자 크기
          fontWeight: FontWeight.w500, // Medium 처리
        ),
      ),
    ),
  );
}
