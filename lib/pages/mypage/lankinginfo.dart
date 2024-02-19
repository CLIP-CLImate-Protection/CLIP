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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/lankinginfo.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
