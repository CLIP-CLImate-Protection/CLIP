import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frontend/firebase_options.dart';
import 'package:frontend/pages/login/view/login.dart';
import 'package:frontend/pages/main/controller/main_view_controller.dart';
import 'package:frontend/pages/quest/controller/quest_controller.dart';
import 'package:frontend/pages/social/controller/social_main_controller.dart';
import 'package:frontend/routes.dart';
import 'package:frontend/service/user_service.dart';
import 'package:get/get.dart';

void main() async {
  initController();
  await initService();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await dotenv.load(fileName: ".env");
  runApp(GetMaterialApp(
    title: 'CLIP',
    initialRoute: LoginPage.url,
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
