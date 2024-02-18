import 'package:frontend/fastAPI/models/User.dart';
import 'package:frontend/pages/login/view/login.dart';
import 'package:frontend/pages/main/view/shop_view_page.dart';
import 'package:frontend/pages/memberinfo/memberinfo.dart';
import 'package:frontend/pages/mypage/mypageview.dart';
import 'package:frontend/pages/social/view/freind_view_page.dart';
import 'package:get/get.dart';

import 'pages/dev_route/view/route_view_page.dart';
import 'pages/main/view/navigation.dart';
import 'pages/quest/view/quest_main_view_page.dart';
import 'pages/social/view/social_main_view_page.dart';

class CustomRouter {
  late User model;
  static final routes = [
    GetPage(name: RouteViewPage.url, page: () => const RouteViewPage()),
    GetPage(name: Navigation.url, page: () => const Navigation()),
    GetPage(name: QuestMainPage.url, page: () => const QuestMainPage()),
    GetPage(name: SocialMainPage.url, page: () => const SocialMainPage()),
    // GetPage(name: BackendPage.url, page: () => const BackendPage()),
    GetPage(name: LoginPage.url, page: () => const LoginPage()),
    GetPage(name: ShopViewPage.url, page: () => const ShopViewPage()),
    GetPage(name: MemberInfoForm.url, page: () => const MemberInfoForm()),
    GetPage(name: FriendViewPage.url, page: () => FriendViewPage(model: User())),
    GetPage(name: MyPage.url, page: () => const MyPage()),
  ];
}
