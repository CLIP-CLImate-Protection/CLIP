import 'package:flutter/material.dart';


class LankingInfo extends StatefulWidget {
  const LankingInfo({Key? key}) : super(key: key);

  static const String url = '/lankinginfo';

  @override
  _LankingPageState createState() => _LankingPageState();
}

class _LankingPageState extends State<LankingInfo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SizedBox(width: 33),
            Text(
              '랭킹 상세',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white, // 이미지 외의 여백의 색상을 흰색으로 지정
        child: Center(
          child: AspectRatio(
            aspectRatio: 16 / 9, // 이미지의 종횡비를 유지
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/lankinginfo.png'),
                  fit: BoxFit.contain, // 이미지가 완전히 표시될 수 있도록 설정
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

