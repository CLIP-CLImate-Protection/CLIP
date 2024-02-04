import 'package:flutter/material.dart';
import 'package:frontend/common/common.dart';
import 'package:frontend/pages/quest/view/component/quest_component.dart';
import 'package:get/get.dart';

import '../controller/quest_controller.dart';

class QuestMainPage extends StatelessWidget {
  const QuestMainPage({super.key});

  static const String url = '/quest/main';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuestMainController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        title: const Text(
          '퀘스트',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF268640),
            fontSize: 30,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            letterSpacing: -0.41,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.4,
      ),
      body: SizedBox(
        width: Common.getWidth,
        child: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(27.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '오늘의 퀘스트',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.41,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                QuestComponent(),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Text(
                      '메인 퀘스트',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.41,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                QuestComponent(),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Text(
                      '이벤트 퀘스트',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.41,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                QuestComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
