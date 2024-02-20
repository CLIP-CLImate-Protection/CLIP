import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/common/common.dart';
import 'package:frontend/fastAPI/models/User.dart';
import 'package:frontend/pages/social/controller/social_main_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../main/view/component/grass_done_quest_component.dart';
import '../../quest/controller/quest_controller.dart';

class FriendViewPage extends StatelessWidget {
  final User model;
  FriendViewPage({Key? key, required this.model}) : super(key: key);

  static const String url = '/social/friend';

  var now = DateTime.now();
  String month = DateFormat('MMM').format(DateTime.now());

  final controller = SocialMainController.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(Common.mainColor),
        appBar: AppBar(
          backgroundColor: Color(Common.mainColor),
          shadowColor: Colors.transparent,
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                width: 368,
                height: 136,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: model.profileUrl != 'profileUrl' ? NetworkImage(model.profileUrl!) : null,
                          child: model.profileUrl == 'profileUrl'
                              ? Icon(
                                  Icons.person,
                                  size: 60,
                                  color: Colors.grey[600],
                                )
                              : null,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${model.nickname}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  width: 100,
                                  height: 29,
                                  padding: const EdgeInsets.only(left: 12, right: 12),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFFFF0D3),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(45),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(FontAwesomeIcons.coins, color: Color(Common.coinColor), size: 18),
                                      const Spacer(),
                                      Text(
                                        '${model.point}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          //height: 0.09,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              '${model.level}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.41,
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Text('${model.address}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.41,
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                  width: 368,
                  height: 480,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        month,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF707070),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.41,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                          onTap: () {
                            showQuestAlertDialog(context, '잔디', '잔디를 클릭하면 해당 날짜의 퀘스트를 확인할 수 있습니다.');
                          },
                          child: Image.asset('assets/images/my_grass.png', width: 318, height: 238)),
                      const SizedBox(height: 25),
                      Container(
                        width: 305,
                        height: 37,
                        decoration: ShapeDecoration(
                          color: const Color.fromARGB(255, 224, 231, 229),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '나',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'vs',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '친구',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 305,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  '나',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '레벨',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(Common.mainColor)),
                                ),
                                Text(
                                  '${model.level}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  '나',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '누적 랭킹',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(Common.mainColor)),
                                ),
                                Text(
                                  '${model.totalLank}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  '나',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '주간 랭킹',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(Common.mainColor)),
                                ),
                                Text(
                                  '${model.weeklyLank}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 15,
              ),
              Obx(() => controller.friendList.contains(model.nickname)
                  ? TextButton(
                      onPressed: () async {
                        //친구 삭제 함수
                      },
                      style: ButtonStyle(
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(color: Color(Common.mainColor), width: 2.0),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(horizontal: 145, vertical: 15),
                        ),
                      ),
                      child: const Text(
                        '친구 삭제',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    )
                  : TextButton(
                      onPressed: () async {
                        String uid = await controller.getUidFromNickname(model.nickname);
                        controller.addFriendToUser(uid);
                      },
                      style: ButtonStyle(
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(color: Color(Common.mainColor), width: 2.0),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(horizontal: 145, vertical: 15),
                        ),
                      ),
                      child: const Text(
                        '친구 추가',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    )),
            ],
          ),
        ));
  }
}

void showQuestAlertDialog(BuildContext context, String title, String content) {
  final controller = QuestMainController.instance;
  controller.getGrassDoneQugestList();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(10), // 알림창의 내용(padding) 크기 조절
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0), // 알림창의 모서리(rounded corners) 조절
        ),

        content: SizedBox(
          width: 341,
          height: 332,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('1월 15일', style: TextStyle(fontSize: 22, fontFamily: 'Inter', fontWeight: FontWeight.w600)),
                    IconButton(
                      icon: const Icon(Icons.close),
                      color: Colors.grey,
                      iconSize: 22,
                      onPressed: () {
                        Get.back(); // 알림창을 닫습니다.
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    '완료한 퀘스트',
                    style: TextStyle(
                      color: Color(0xFF268640),
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.41,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 280,
                height: 203,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int index = 0; index < controller.grassDoneQuestList.length; index++)
                        Column(
                          children: [
                            if (index == 0) const SizedBox(height: 5),
                            GrassDoneQuestComponent(
                              model: controller.grassDoneQuestList[index],
                            ),
                            if (index != controller.grassDoneQuestList.length - 1) const SizedBox(height: 17),
                          ],
                        ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
