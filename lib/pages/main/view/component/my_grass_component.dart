import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/pages/main/view/component/grass_done_quest_component.dart';
import 'package:frontend/pages/quest/controller/quest_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyGrassComponent extends StatelessWidget {
  MyGrassComponent({super.key});

  var now = DateTime.now();
  String month = DateFormat('MMM').format(DateTime.now());
  //final MyGrass myGrass;

  //MyGrassComponent({this.myGrass});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    month = DateFormat('MMM').format(DateTime(now.month - 1));
                    //이전 달 잔디 보여줌
                  },
                  icon: const Icon(FontAwesomeIcons.caretLeft),
                  color: const Color(0xFFD9D9D9),
                  iconSize: 20),
              Text(
                month,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF707070),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.41,
                ),
              ),
              IconButton(
                  onPressed: () {
                    //다음 달 잔디 보여줌
                  },
                  icon: const Icon(FontAwesomeIcons.caretRight),
                  color: const Color(0xFFD9D9D9),
                  iconSize: 20),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          InkWell(
              onTap: () {
                showQuestAlertDialog(context, '잔디', '잔디를 클릭하면 해당 날짜의 퀘스트를 확인할 수 있습니다.');
              },
              child: Image.asset('assets/images/my_grass.png', width: 318, height: 238)),
        ],
      ),
    );
  }
}

void showQuestAlertDialog(BuildContext context, String title, String content) {
  final controller = QuestMainController.instance;
  controller.getGrassDoneQugestList();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(10), // 알림창의 내용(padding) 크기 조절
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0), // 알림창의 모서리(rounded corners) 조절
        ),

        content: SizedBox(
          width: 341,
          height: 332,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('1월 15일', style: TextStyle(fontSize: 22, fontFamily: 'Inter', fontWeight: FontWeight.w600)),
                    IconButton(
                      icon: const Icon(Icons.close),
                      color: Colors.grey,
                      iconSize: 22,
                      onPressed: () {
                        Get.back(); // 알림창을 닫습니다.
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    '완료한 퀘스트',
                    style: TextStyle(
                      color: Color(0xFF268640),
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.41,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 280,
                height: 203,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int index = 0; index < controller.grassDoneQuestList.length; index++)
                        Column(
                          children: [
                            if (index == 0) const SizedBox(height: 5),
                            GrassDoneQuestComponent(
                              model: controller.grassDoneQuestList[index],
                            ),
                            if (index != controller.grassDoneQuestList.length - 1) const SizedBox(height: 17),
                          ],
                        ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
