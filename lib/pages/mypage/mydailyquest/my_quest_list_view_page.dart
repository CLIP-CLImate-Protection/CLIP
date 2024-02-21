import 'package:flutter/material.dart';
import 'package:frontend/common/common.dart';
import 'package:frontend/pages/mypage/controller/mydailyquestcontroller.dart';
import 'package:frontend/pages/mypage/mydailyquest/my_info_quest_component.dart';

class MyQuestListViewPage extends StatelessWidget {
  const MyQuestListViewPage({super.key});

  static const String url = '/mypage/mydailyquest';

  @override
  Widget build(BuildContext context) {
    final controller = MyDailyQuestController.instance;
    controller.separateQuest();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        title: Text(
          '${controller.quests['date']}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF268640),
            fontSize: 30,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            letterSpacing: -0.41,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.4,
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
      body: SizedBox(
        width: Common.getWidth,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(27.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Row(
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
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      for (int index = 0; index < controller.dailyQuestList.length; index++)
                        Column(
                          children: [
                            if (index == 0) const SizedBox(height: 10),
                            MyInfoQuestComponent(
                              questName: controller.dailyQuestList[index],
                            ),
                            if (index != controller.dailyQuestList.length - 1) const SizedBox(height: 20),
                          ],
                        )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Row(
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
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      // for (int index = 0; index < controller.questList.length; index++)
                      //   Column(
                      //     children: [
                      //       if (index == 0) const SizedBox(height: 10),
                      //       QuestComponent(
                      //         model: controller.questList[index],
                      //       ),
                      //       if (index != controller.questList.length - 1) const SizedBox(height: 20),
                      //     ],
                      //   )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Row(
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
                const SizedBox(
                  height: 20,
                ),
                // QuestComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
