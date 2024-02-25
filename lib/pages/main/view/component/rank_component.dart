import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/fastAPI/models/User.dart';

import '../../../../common/common.dart';

class RankComponent extends StatelessWidget {
  final User model;
  final int index;

  const RankComponent({Key? key, required this.model, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final controller = QuestMainController.instance;

    return SizedBox(
      width: 350,
      height: 65,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            rank(),
            const SizedBox(width: 20),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[300],
              backgroundImage: model.profileUrl != 'profileUrl' ? NetworkImage(model.profileUrl!) : null,
              child: model.profileUrl == 'profileUrl'
                  ? Icon(
                      Icons.person,
                      size: 32,
                      color: Colors.grey[600],
                    )
                  : null,
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              width: Common.getWidth * 0.3,
              child: Text(
                '${model.nickname}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Istok Web',
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.41,
                ),
              ),
            ),
            const Spacer(),
            Icon(
              FontAwesomeIcons.leaf,
              color: Color(Common.mainColor),
              size: 18,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              '${model.totalQuest}',
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
    );
  }

  Widget rank() {
    Widget rankWidget = Row(
      children: [
        Text(
          '$index',
          style: const TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );

    return rankWidget;
  }
}
