import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/fastAPI/models/Quest.dart';
import 'package:frontend/pages/quest/controller/quest_controller.dart';

import '../../../../common/common.dart';

class GrassDoneQuestComponent extends StatelessWidget {
  final Quest model;

  const GrassDoneQuestComponent({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = QuestMainController.instance;

    return SizedBox(
      width: 274,
      height: 52,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 274,
              height: 52,
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
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 185,
                      child: Text(
                        '${model.questName}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Istok Web',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.41,
                        ),
                      ),
                    ),
                    const Spacer(),
                    model.questType == 'event'
                        ? SvgPicture.asset('assets/icons/event_apple.svg', width: 20, height: 20)
                        : Icon(
                            FontAwesomeIcons.coins,
                            color: Color(Common.coinColor),
                            size: 18,
                          ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${model.reward}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.41,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
