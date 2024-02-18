import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

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

Future<void> sendDataToFastapi(File imageFile) async {
  //print("sendDataToFastapi: " + url);
  final apiUrl = Uri.parse('http://localhost:8000/detect');

  var request = http.MultipartRequest('POST', apiUrl);
  request.files.add(
    await http.MultipartFile.fromPath(
      'image',
      imageFile.path,
    ),
  );

  var response = await request.send();
  if (response.statusCode == 200) {
    print('Image uploaded successfully!');
  } else {
    print('Failed to upload image. Error: ${response.reasonPhrase}');
  }
}

Future<void> uploadImageToFirebaseStorage(File imageFile) async {
  try {
    // Firebase 스토리지 레퍼런스 생성
    Reference storageReference = FirebaseStorage.instance.ref().child('images/${DateTime.now().toString()}');

    // 이미지 업로드
    UploadTask uploadTask = storageReference.putFile(imageFile);

    // 업로드 진행 상태 모니터링
    uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
      print('Upload Progress: ${(snapshot.bytesTransferred / snapshot.totalBytes) * 100} %');
    }, onError: (e) {
      print('Error during uploading: $e');
    });

    // 업로드 완료 후 다운로드 URL 반환
    String imageUrl = await (await uploadTask).ref.getDownloadURL();
    print('Uploaded Image URL: $imageUrl');
    //sendDataToFastapi(imageUrl);

  } catch (e) {
    print('Error uploading image to Firebase Storage: $e');
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
  List? _outputs;

  //이미지를 가져오는 함수
  Future getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });

      File imageFile = File(pickedFile.path);
      //await uploadImageToFirebaseStorage(imageFile);
      await sendDataToFastapi(imageFile);
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