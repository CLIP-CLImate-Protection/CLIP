import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


// 클릭하면 예시 사진을 보여주는 함수
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


// 업로드한 이미지를 fastapi 서버로 전송하여 추론한 결과를 받는 함수
Future<dynamic> sendDataToFastapi(File imageFile) async {
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
    var responseBody = await response.stream.bytesToString();
    var jsonData = json.decode(responseBody);
    var detectedObjects = jsonData['detected_objects'];
    print('Detected Objects:');
    for (var object in detectedObjects) {
      print(object);
    }
    print("fastapi");
    return detectedObjects;
  } else {
    print('Failed to upload image. Error: ${response.reasonPhrase}');
  }
}


// 이미지를 업로드하는 함수
class ImageUploader extends StatefulWidget {
  const ImageUploader({Key? key}) : super(key: key);

  @override
  State<ImageUploader> createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  XFile? _image;
  final ImagePicker picker = ImagePicker();
  Future<List<dynamic>>? objects; // 변수 선언

//이미지를 가져오는 함수
  Future<List<dynamic>> getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);

    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });

      File imageFile = File(pickedFile.path);
      //await uploadImageToFirebaseStorage(imageFile);
      List<dynamic> objects = await sendDataToFastapi(imageFile);
      print("after return");
      print(objects.runtimeType);

      return objects;
    } else {
      throw Exception('Failed to pick image'); // 이미지를 선택하지 못한 경우 예외 발생
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
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
            onTap: () async {
              setState(() {
                objects = getImage(ImageSource.gallery);
              });
            },
          ),
        ),
        SizedBox(height: 10,),
        Container(
          height: 50,
          child: FutureBuilder<List<dynamic>>(
            future: objects,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // 데이터 로딩 중이면 로딩 스피너 표시
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}'); // 에러가 발생한 경우 에러 메시지 출력
              } else {
                // 데이터가 준비되면 출력
                print('비동기');
                print(snapshot.data);
                if (snapshot.data != null && snapshot.data!.isNotEmpty) {
                  final item = snapshot.data![0];
                  return Column(
                    children: snapshot.data!.map((item) {
                      // 각 요소를 Text 위젯으로 변환하여 출력합니다.
                      return Text(
                        item.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      );
                    }).toList(),
                  );
                } else {
                  return Text(' '); // 혹은 다른 적절한 처리
                }
                /*ListView.builder(
                  itemCount: snapshot.data!.length ?? 0, // 데이터가 null이거나 비어있는 경우를 고려하여 itemCount를 설정합니다.
                  itemBuilder: (context, index) {
                    final item = snapshot.data![index]; // index에 해당하는 데이터 항목을 가져옵니다.
                    return Text('hi', style: const TextStyle(
                        color: Colors.black
                    ),); // 가져온 데이터를 텍스트로 표시합니다.
                  },
                );*/
              }
            },
          ),
        ),
      ],
    );
  }

}