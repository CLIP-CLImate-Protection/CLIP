import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/fastAPI/models/Quest.dart';
import 'package:frontend/pages/quest/controller/quest_controller.dart';
import 'package:get/get.dart';

import '../../../../common/common.dart';
import '../../../questdetails/imagequest/view/imagequest.dart';

class QuestComponent extends StatelessWidget {
  final Quest model;

  static const String url = '/quest';
  const QuestComponent({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = QuestMainController.instance;

    return InkWell(
        onTap: () async {
          Get.to(() => UploadImagePage());
        },
        child: SizedBox(
          width: 341,
          height: 61,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 341,
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
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 231,
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
                        model.type == 'event'
                            ? SvgPicture.asset('assets/icons/event_apple.svg')
                            : Icon(
                                FontAwesomeIcons.coins,
                                color: Color(Common.coinColor),
                                size: 22,
                              ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${model.reward}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
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
        ));
  }
}
