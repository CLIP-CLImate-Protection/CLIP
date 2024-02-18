import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frontend/firebase_options.dart';
import 'package:frontend/pages/login/view/login.dart';
import 'package:frontend/pages/main/controller/main_view_controller.dart';
import 'package:frontend/pages/main/view/navigation.dart';
import 'package:frontend/pages/quest/controller/quest_controller.dart';
import 'package:frontend/pages/social/controller/social_main_controller.dart';
import 'package:frontend/routes.dart';
import 'package:frontend/service/user_service.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await dotenv.load(fileName: ".env");
  await initService();
  initController();
  String route = initRoute();
  runApp(GetMaterialApp(
    title: 'CLIP',

    initialRoute: route,
    //initialRoute: RouteViewPage.url,
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      canvasColor: Colors.white,
      fontFamily: 'NotoSansKR',
    ),
    getPages: CustomRouter.routes,
  ));
}

void initController() {
  Get.put(MainViewController());
  Get.put(QuestMainController());
  Get.put(SocialMainController());
  Get.put(SocialMainController());
}

Future<void> initService() async {
  await Get.putAsync(() => UserService().init());
}

String initRoute() {
  print('${UserService.instance.isLogin} 로그인 여부');
  if (UserService.instance.isLogin) {
    return Navigation.url;
  } else {
    return LoginPage.url;
  }
}
