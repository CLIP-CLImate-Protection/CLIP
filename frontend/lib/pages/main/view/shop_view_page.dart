import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/common/common.dart';
import 'package:frontend/pages/main/controller/main_view_controller.dart';
import 'package:get/get.dart';

class ShopViewPage extends StatelessWidget {
  const ShopViewPage({super.key});

  static const String url = '/shop';

  @override
  Widget build(BuildContext context) {
    final controller = MainViewController.instance;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '상점',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              letterSpacing: -0.41,
            ),
          ),
          backgroundColor: Color(Common.mainColor),
          toolbarHeight: 70.0,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 24,
              color: Color(Common.subGray),
            ),
          ),
        ),
        body: Material(
            //width: Common.getWidth,
            color: Color(Common.mainColor),
            child: Container(
              width: 368,
              height: 706,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Background color
                          fixedSize: const Size(100, 145),
                        ).copyWith(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          elevation: MaterialStateProperty.all(10),
                          shadowColor: MaterialStateProperty.all(
                            const Color(0x3F000000),
                          ),
                        ),
                        onPressed: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 28,
                              height: 28,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/green.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            const SizedBox(
                              width: 80,
                              child: Text(
                                '흙 블록을 녹색 블록으로 바꾸기',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Istok Web',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.41,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.coins, color: Color(Common.coinColor), size: 18),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  '300',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.41,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            )));
  }
}
