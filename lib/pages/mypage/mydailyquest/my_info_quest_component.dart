import 'package:flutter/material.dart';

import '../../../../common/common.dart';

class MyInfoQuestComponent extends StatelessWidget {
  //final Quest model;
  final String questName;

  //static const String url = '/quest';
  const MyInfoQuestComponent({Key? key, required this.questName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final controller = QuestMainController.instance;

    return Container(
      width: Common.getWidth * 0.87,
      height: 61,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 10,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: Common.getWidth * 0.5,
              child: Text(
                questName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Istok Web',
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.41,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
