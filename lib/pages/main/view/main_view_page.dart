import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/pages/main/view/component/my_grass_component.dart';
import 'package:frontend/pages/main/view/component/rank_component.dart';
import 'package:frontend/pages/main/view/shop_view_page.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../common/common.dart';
import '../../social/controller/social_main_controller.dart';

class MainViewPage extends StatefulWidget {
  const MainViewPage({Key? key}) : super(key: key);

  static const String url = '/main';

  @override
  _MainViewPageState createState() => _MainViewPageState();
}

class _MainViewPageState extends State<MainViewPage> {
  String _selectedRanking = '누적랭킹'; // Default selected ranking

  @override
  Widget build(BuildContext context) {
    final controller2 = SocialMainController.instance;
    controller2.getFriendList();
    return Scaffold(
      body: SlidingUpPanel(
        body: Container(
          color: Color(Common.mainColor),
          width: Common.getWidth,
          height: Common.getHeight,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Color(Common.mainColor),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: Common.getWidth * 0.1,
                          ),
                          const Text('CLIP',
                              style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Kantumruy')),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      //내 잔디 부분
                      width: 375,
                      height: 385,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(5, 5),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15, left: 21, right: 21),
                            child: Row(
                              children: [
                                const Text(
                                  '내 잔디',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -0.41,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  width: 110,
                                  height: 31,
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFFFF0D3),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(45),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(FontAwesomeIcons.coins,
                                          color: Color(Common.coinColor),
                                          size: 18),
                                      const Spacer(),
                                      const Text(
                                        '1300',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          //height: 0.09,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                IconButton(
                                  icon:
                                      const Icon(FontAwesomeIcons.cartShopping),
                                  color: Color(Common.subGray),
                                  iconSize: 25,
                                  padding: const EdgeInsets.all(0),
                                  onPressed: () {
                                    Get.toNamed(ShopViewPage.url);
                                  },
                                ),
                              ],
                            ),
                          ),
                          MyGrassComponent()
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        panel: Container(
          //랭킹
          width: Common.getWidth,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 23, top: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '랭킹',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedRanking = '누적랭킹';
                      });
                    },
                    child: Text(
                      '누적랭킹',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: _selectedRanking == '누적랭킹'
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: _selectedRanking == '누적랭킹'
                            ? Color(Common.mainColor)
                            : Color(Common.subGray),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedRanking = '주간랭킹';
                      });
                    },
                    child: Text(
                      '주간랭킹',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: _selectedRanking == '주간랭킹'
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: _selectedRanking == '주간랭킹'
                            ? Color(Common.mainColor)
                            : Color(Common.subGray),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedRanking = '지역랭킹';
                      });
                    },
                    child: Text(
                      '지역랭킹',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: _selectedRanking == '지역랭킹'
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: _selectedRanking == '지역랭킹'
                            ? Color(Common.mainColor)
                            : Color(Common.subGray),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 3,
                color: Color(Common.subGray),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10),
              //   child: Column(
              //     children: [
              //       for (int index = 0; index < 5; index++)
              //         Column(
              //           children: [
              //             RankComponent(model: controller2.friendList[index], index: index + 1),
              //             Divider(color: Color(Common.subGray), thickness: 0.5),
              //           ],
              //         )
              //     ],
              //   ),
              // ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5, // Adjust as needed
                  itemBuilder: (context, index) {
                    // Display RankComponents based on the selected ranking
                    // You can adjust the logic here based on your data structure
                    switch (_selectedRanking) {
                      case '주간랭킹':
                        return RankComponent(
                            model: controller2.friendList[index],
                            index: index + 1);
                      case '지역랭킹':
                        // Implement logic for 지역랭킹
                        return const SizedBox(); // Placeholder
                      default:
                        return RankComponent(
                            model: controller2.friendList[index],
                            index: index + 1);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        minHeight: 220,
        maxHeight: MediaQuery.of(context).size.height - 215,
      ),
    );
  }
}
