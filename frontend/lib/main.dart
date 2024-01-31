import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/main/view/navigation.dart';
import 'package:frontend/routes.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'pages/main/controller/main_view_controller.dart';
import 'pages/my_info/controller/info_controller.dart';
import 'pages/quest/controller/quest_controller.dart';


void main() async {
  initController();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(GetMaterialApp(
    title: 'CLIP',
    initialRoute: Navigation.url,
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
  Get.put(MyInfoViewController());
}
