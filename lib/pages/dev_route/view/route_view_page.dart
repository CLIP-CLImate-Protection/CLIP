import 'package:flutter/material.dart';

import 'package:frontend/pages/dev_route/controller/route_view_controller.dart';
import 'package:frontend/pages/login/login.dart';
import 'package:frontend/pages/main/view/shop_view_page.dart';
import 'package:frontend/pages/my_info/view/info_main_view_page.dart';
import 'package:frontend/pages/quest/view/quest_main_view_page.dart';
import 'package:frontend/pages/social/view/social_main_view_page.dart';
import 'package:get/get.dart';

import '../../main/view/navigation.dart';

class RouteViewPage extends StatelessWidget {
  const RouteViewPage({super.key});

  static const String url = '/route';
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RouteViewController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(children: [
          const Text('RouteViewPage'),
          ElevatedButton(
              onPressed: () {
                Get.offAllNamed(Navigation.url);
              },
              child: const Text('Go to Main Page')),
          ElevatedButton(
              onPressed: () {
                Get.offAllNamed(QuestMainPage.url);
              },
              child: const Text('Go to Quest Page')),
          ElevatedButton(
              onPressed: () {
                Get.offAllNamed(SocialMainPage.url);
              },
              child: const Text('Go to Social Page')),
          ElevatedButton(
              onPressed: () {
                Get.offAllNamed(MyInfoPage.url);
              },
              child: const Text('Go to MyInfo Page')),
          // ElevatedButton(
          //     onPressed: () {
          //       Get.offAllNamed(BackendPage.url);
          //     },
          //     child: const Text('Go to Backend Page')),
          ElevatedButton(
              onPressed: () {
                Get.offAllNamed(ShopViewPage.url);
              },
              child: const Text('Go to Shop Page')),
          ElevatedButton(
              onPressed: () {
                Get.offAllNamed(LoginPage.url);
              },
              child: const Text('Go to Login Page')),
        ]),
      )),
    );
  }
}
