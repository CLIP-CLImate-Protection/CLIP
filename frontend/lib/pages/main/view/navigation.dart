import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/common/common.dart';
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
                      icon: [CupertinoIcons.house, CupertinoIcons.house_fill],
                    )),
                    Expanded(
                        child: _bottomNavigationButton(
                      index: 1,
                      icon: [
                        FontAwesomeIcons.list,
                        FontAwesomeIcons.list,
                      ],
                    )),
                    Expanded(
                      child: _bottomNavigationButton(
                        index: 2,
                        icon: [
                          FontAwesomeIcons.addressBook,
                          FontAwesomeIcons.solidAddressBook,
                        ],
                      ),
                    ),
                    Expanded(
                        child: _bottomNavigationButton(
                      index: 3,
                      icon: [
                        FontAwesomeIcons.user,
                        FontAwesomeIcons.solidUser,
                      ],
                    )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _bottomNavigationButton({required int index, required List<IconData> icon}) {
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
                  color: index == controller.pageIndex.value ? Color(Common.mainColor) : Color(Common.mainGray),
                  size: 30,
                ),
              ],
            ),
          ),
        ));
  }
}
