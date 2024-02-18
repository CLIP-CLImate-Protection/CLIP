import 'package:flutter/material.dart';
import 'mymainquestcontroller.dart';


class MyMainQuestView extends StatefulWidget {
  const MyMainQuestView({Key? key}) : super(key: key);

  static const String url = '/m'; //url미정
  @override
  _MainQuestPageState createState() => _MainQuestPageState();

}

class _MainQuestPageState extends State<MyMainQuestView> {
  Map<String, int> questExecutionCount = {};

  @override
  void initState() {
    super.initState();
    _updateQuestExecutionCount();
  }

  Future<void> _updateQuestExecutionCount() async {
    List<String> quests = await MyMainQuestController().getUserCompletedQuests();
    questExecutionCount.clear();
    for (String quest in quests) {
      questExecutionCount[quest] = (questExecutionCount[quest] ?? 0) + 1;
    }
  } //백엔드 작업 전 테스트용 임의로 적용

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            SizedBox(width: 33),
            Text(
              '메인 퀘스트 내역',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.white,
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
      backgroundColor: Color(0xFF278740),
      body: Center(
        child: Container(
          width: 380,
          height: 580,
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      '총',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '${questExecutionCount.length}', // 중복된 퀘스트 수만큼 카운트(임의)
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '개',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20), // 간격 추가
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(questExecutionCount.length, (index) {
                        String questName = questExecutionCount.keys.toList()[index];
                        int executionCount = questExecutionCount.values.toList()[index]; //임의
                        return Card(
                          margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
                          elevation: 5,
                          child: Container(
                            width: 310,
                            height: 49,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      questName, // 유저가 완료한 퀘스트 이름(임의)
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Istok Web',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    '총 $executionCount회', // 실행 횟수 표시(임의)
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Istok Web',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
