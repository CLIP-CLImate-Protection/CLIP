import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/pages/main/view/shop_view_page.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';
import '../controller/main_view_controller.dart';

class MainViewPage extends StatelessWidget {
  const MainViewPage({super.key});

  static const String url = '/main';

  @override
  Widget build(BuildContext context) {
    final controller = MainViewController.instance;

    return Container(
      color: Color(Common.mainColor),
      width: Common.getWidth,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Common.getWidth * 0.1,
                    ),
                    const Text('CLIP', style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Kantumruy')),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                    //내 잔디 부분
                    width: 368,
                    height: 353,
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
                          padding: const EdgeInsets.only(top: 20, left: 21, right: 21),
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
                                  height: 0.04,
                                  letterSpacing: -0.41,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: 98,
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
                                  //mainAxisSize: MainAxisSize.min,
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(FontAwesomeIcons.coins, color: Color(Common.coinColor), size: 18),
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
                                width: 5,
                              ),
                              IconButton(
                                icon: const Icon(FontAwesomeIcons.cartShopping),
                                color: Color(Common.subGray),
                                iconSize: 25,
                                padding: const EdgeInsets.all(0),
                                onPressed: () {
                                  Get.toNamed(ShopViewPage.url);
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
