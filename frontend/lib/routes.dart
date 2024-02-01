import 'package:frontend/backend/backend_page.dart';
import 'package:get/get.dart';

import 'pages/dev_route/view/route_view_page.dart';
import 'pages/main/view/navigation.dart';
import 'pages/my_info/view/info_main_view_page.dart';
import 'pages/quest/view/quest_main_view_page.dart';
import 'pages/social/view/social_main_view_page.dart';

class CustomRouter {
  static final routes = [
    GetPage(name: RouteViewPage.url, page: () => const RouteViewPage()),
    GetPage(name: Navigation.url, page: () => const Navigation()),
    GetPage(name: QuestMainPage.url, page: () => const QuestMainPage()),
    GetPage(name: SocialMainPage.url, page: () => const SocialMainPage()),
    GetPage(name: MyInfoPage.url, page: () => const MyInfoPage()),
    GetPage(name: BackendPage.url, page: () => const BackendPage()),
  ];
}
