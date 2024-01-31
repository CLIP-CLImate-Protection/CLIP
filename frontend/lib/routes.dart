import 'package:get/get.dart';

import 'pages/main/view/navigation.dart';
import 'pages/my_info/view/info_main_view_page.dart';
import 'pages/quest/view/quest_main_view_page.dart';
import 'pages/social/view/social_main_view_page.dart';

class CustomRouter {
  static final routes = [
    GetPage(name: Navigation.url, page: () => const Navigation()),
    GetPage(name: '/quest', page: () => const QuestMainPage()),
    GetPage(name: '/social', page: () => const SocialMainPage()),
    GetPage(name: '/myinfo', page: () => const MyInfoPage()),
  ];
}
