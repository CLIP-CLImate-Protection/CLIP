import 'package:get/get.dart';

import 'pages/main/view/navigation.dart';

class CustomRouter {
  static final routes = [
    GetPage(name: Navigation.url, page: () => const Navigation()),
    // GetPage(name: QuestMainPage.url, page: () => const QuestMainPage()),
    // GetPage(name: SocialMainPage.url, page: () => const SocialMainPage()),
    // GetPage(name: MyInfoPage.url, page: () => const MyInfoPage()),
  ];
}
