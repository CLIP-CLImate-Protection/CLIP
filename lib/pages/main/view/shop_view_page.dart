import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/common/common.dart';
import 'package:frontend/pages/main/controller/main_view_controller.dart';
import 'package:frontend/pages/main/view/navigation.dart';
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
              Navigator.pop(context, true);
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 24,
              color: Color(Common.subGray),
            ),
          ),
        ),
        body: Center(
          child: Container(
              width: Common.getWidth,
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
                            elevation: MaterialStateProperty.all(7),
                            shadowColor: MaterialStateProperty.all(
                              const Color.fromARGB(193, 0, 0, 0),
                            ),
                          ),
                          onPressed: () {
                            showPurchaseAlertDialog(context);
                          },
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
              )),
        ));
  }
}

void showPurchaseAlertDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(10), // 알림창의 내용(padding) 크기 조절
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0), // 알림창의 모서리(rounded corners) 조절
          ),

          content: SizedBox(
              width: 296,
              height: 211,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                  const SizedBox(
                    height: 26,
                  ),
                  const SizedBox(
                    width: 207,
                    child: Text(
                      '"흙 블록을 녹색 블록으로 바꾸기" 를',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    width: 110,
                    child: Text(
                      '구매하시겠습니까?',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.back(); // 홈으로 돌아가기 동작 수행
                        },
                        style: ButtonStyle(
                          side: MaterialStateProperty.all<BorderSide>(
                            BorderSide(color: Color(Common.mainColor), width: 2.0),
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                          ),
                        ),
                        child: const Text(
                          '취소하기',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          showChooseAlertDialog(context); // 알림창을 닫습니다.
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
                          backgroundColor: MaterialStateProperty.all<Color>(Color(Common.mainColor)),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                          ),
                        ),
                        child: const Text('구매하기', style: TextStyle(color: Colors.white, fontSize: 14)),
                      ),
                    ],
                  )
                ],
              )),
        );
      });
}

void showChooseAlertDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(10), // 알림창의 내용(padding) 크기 조절
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0), // 알림창의 모서리(rounded corners) 조절
          ),

          content: SizedBox(
              width: 292,
              height: 378,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        color: Colors.grey,
                        iconSize: 22,
                        onPressed: () {
                          Get.back();
                          Get.back(); // 알림창을 닫습니다.
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    width: 207,
                    child: Text(
                      '"흙 블록을 녹색 블록으로 바꾸기" 를\n적용할 블록을 선택해주세요.',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/my_grass.png', width: 200, height: 200),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                          Get.back(); // 홈으로 돌아가기 동작 수행
                        },
                        style: ButtonStyle(
                          side: MaterialStateProperty.all<BorderSide>(
                            BorderSide(color: Color(Common.mainColor), width: 2.0),
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                          ),
                        ),
                        child: const Text(
                          '취소하기',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          showSnackBar();
                          Get.offAllNamed(Navigation.url);
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
                          backgroundColor: MaterialStateProperty.all<Color>(Color(Common.mainColor)),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                          ),
                        ),
                        child: const Text('적용하기', style: TextStyle(color: Colors.white, fontSize: 14)),
                      ),
                    ],
                  )
                ],
              )),
        );
      });
}

void showSnackBar() {
  Get.snackbar(
    "알림",
    "구매가 완료되었습니다.",
    snackPosition: SnackPosition.TOP,
    backgroundColor: const Color.fromARGB(71, 255, 255, 255),
    colorText: Colors.black,
  );
}
