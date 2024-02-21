import 'package:flutter/material.dart';
import 'package:frontend/common/common.dart';
import 'package:frontend/pages/mypage/mydailyquest/my_quest_list_view_page.dart';
import 'package:get/get.dart';

import '../controller/mydailyquestcontroller.dart';

class MyDailyQuestView extends StatefulWidget {
  const MyDailyQuestView({Key? key}) : super(key: key);

  static const String url = 'mypage//mydailyquest';

  @override
  _DailyQuestPageState createState() => _DailyQuestPageState();
}

class _DailyQuestPageState extends State<MyDailyQuestView> {
  int completedQuestCount = 0;
  List<String> userCompletedQuests = [];

  @override
  void initState() {
    super.initState();
    _updateCompletedQuests();
  }

  Future<void> _updateCompletedQuests() async {
    List<String> quests = await MyDailyQuestController().getQuestDateList();
    setState(() {
      completedQuestCount = quests.length;
      userCompletedQuests = quests;
    });
  } // 백엔드 구현 전 임의로 설정

  @override
  Widget build(BuildContext context) {
    final controller = MyDailyQuestController.instance;
    controller.getDateQuestList('2024-02-20');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '나의 퀘스트 내역',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            letterSpacing: -0.41,
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
      backgroundColor: const Color(0xFF278740),
      body: SingleChildScrollView(
        child: Container(
          width: 380,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 20),
                  Text(
                    '총 $completedQuestCount일',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: List.generate(userCompletedQuests.reversed.length, (index) {
                  // Use userCompletedQuests.reversed.length
                  final reversedIndex = userCompletedQuests.length - 1 - index; // Calculate the reversed index
                  return Card(
                    margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                    elevation: 5,
                    child: InkWell(
                      onTap: () {
                        controller.getDateQuestList(userCompletedQuests[reversedIndex]); // Use the reversed index
                        print('date: ${controller.quests['date']}');
                        Get.to(() => const MyQuestListViewPage());
                      },
                      child: Container(
                        width: 310,
                        height: 49,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            userCompletedQuests[reversedIndex], // Use the reversed index
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Istok Web',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
