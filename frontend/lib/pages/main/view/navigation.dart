import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/navigation_controller.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  static const String url = '/main';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Align(alignment: Alignment.topCenter, child: Obx(() => controller.bodyContent[controller.pageIndex.value]))),
      bottomNavigationBar: homeNavigationBar(),
    );
  }

  static Widget homeNavigationBar() {
    final controller = NavigationController.instance;
    return Title(
      //title: PageTitle.main,
      color: Colors.white,
      child: Material(
        child: Container(
          //width: Common.getWidth,
          decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.grey, width: 0.2))),
          child: SafeArea(
            top: false,
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  children: [
                    Expanded(
                        child: _bottomNavigationButton(
                            index: 0,
                            icon: [
                              CupertinoIcons.person,
                              CupertinoIcons.person_fill,
                            ],
                            text: "홈")),
                    Expanded(
                        child: _bottomNavigationButton(
                            index: 1,
                            icon: [
                              CupertinoIcons.person,
                              CupertinoIcons.person_fill,
                            ],
                            text: "퀘스트")),
                    Expanded(
                        child: _bottomNavigationButton(
                            index: 2,
                            icon: [
                              CupertinoIcons.person,
                              CupertinoIcons.person_fill,
                            ],
                            text: "소셜")),
                    Expanded(
                        child: _bottomNavigationButton(
                            index: 3,
                            icon: [
                              CupertinoIcons.person,
                              CupertinoIcons.person_fill,
                            ],
                            text: "내정보")),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _bottomNavigationButton({required int index, required List<IconData> icon, required String text}) {
    final controller = NavigationController.instance;

    return InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          controller.selectTab(index);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon[index == controller.pageIndex.value ? 1 : 0],
                  color: index == controller.pageIndex.value ? const Color(0xFF33C26C) : const Color.fromARGB(255, 85, 85, 85),
                  size: 30,
                ),
                const SizedBox(height: 2.0), // 아이콘과 텍스트 사이의 간격 조절
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 12.0,
                      color: index == controller.pageIndex.value ? const Color(0xFF33C26C) : const Color.fromARGB(255, 85, 85, 85)), // 텍스트의 스타일 설정
                ),
              ],
            ),
          ),
        ));
  }
}
