import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frontend/firebase_options.dart';
import 'package:frontend/pages/main/controller/main_view_controller.dart';
import 'package:frontend/pages/my_info/controller/info_controller.dart';
import 'package:frontend/pages/quest/controller/quest_controller.dart';
import 'package:frontend/pages/social/controller/social_main_controller.dart';
import 'package:frontend/routes.dart';
import 'package:get/get.dart';

import 'pages/dev_route/view/route_view_page.dart';

void main() async {
  initController();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await dotenv.load(fileName: ".env");
  runApp(GetMaterialApp(
    title: 'CLIP',
    //initialRoute: Navigation.url,
    initialRoute: RouteViewPage.url,
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
  Get.put(MyInfoViewController());
}
