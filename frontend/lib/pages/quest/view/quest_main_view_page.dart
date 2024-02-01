import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/quest_controller.dart';

class QuestMainPage extends StatelessWidget {
  const QuestMainPage({super.key});

  static const String url = '/quest/main';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuestMainController());
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Quest Main Page',
            ),
          ],
        ),
      ),
    );
  }
}
