import 'package:flutter/material.dart';
import 'package:frontend/pages/quest/view/quest_main_view_page.dart';
import 'package:frontend/pages/social/view/social_main_view_page.dart';
import 'package:get/get.dart';

import '../view/main_view_page.dart';

class NavigationController extends GetxController {
  RxInt pageIndex = 0.obs;

  void selectTab(int index) async {
    if (index == 0) {
      //홈
      //MainViewController.instance
    } else if (index == 1) {
      //퀘스트
      //SituationMainController.instance.getSituationList();
    } else if (index == 2) {
      //소셜
      //MyInfoViewController.instance.getInfoList();
    } else if (index == 3) {
      //마이페이지
      //MyInfoViewController.instance.getInfoList();
    }
    pageIndex.value = index;
    update();
  }

  static NavigationController get instance => Get.find<NavigationController>();

  final List<Widget> bodyContent = [
    const MainViewPage(),
    const QuestMainPage(),
    const SocialMainPage(),
    const SocialMainPage(),
  ];
}
