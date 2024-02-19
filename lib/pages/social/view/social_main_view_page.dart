import 'package:flutter/material.dart';
import 'package:frontend/common/common.dart';
import 'package:frontend/pages/social/controller/social_main_controller.dart';
import 'package:frontend/pages/social/view/component/friend_component.dart';

class SocialMainPage extends StatefulWidget {
  const SocialMainPage({super.key});

  static const String url = '/social/main';

  @override
  _SocialViewPageState createState() => _SocialViewPageState();
}

List<String> filteredList = [];

class _SocialViewPageState extends State<SocialMainPage> {
  @override
  Widget build(BuildContext context) {
    final controller = SocialMainController.instance;
    controller.getFriendList();
    controller.getNicknameList();
    //String value;
    return Scaffold(
      backgroundColor: Color(Common.mainColor),
      // appBar: AppBar(
      //   backgroundColor: Color(Common.mainColor),
      //   shadowColor: Colors.transparent,
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 368,
              height: 132,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '친구',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.41,
                        ),
                      ),
                      Container(
                          width: 98,
                          height: 29,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF5F1F1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(45),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              '00명',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                //fontWeight: FontWeight.w800,
                                letterSpacing: -0.41,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                Container(
                  width: 326,
                  height: 44,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF5F1F1), // This is fine as it's a constant color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                  ),
                  child: SearchBar(
                    constraints: const BoxConstraints.expand(height: 44),
                    backgroundColor: MaterialStateProperty.all(const Color(0xFFF5F1F1)), // Remove 'const'
                    shadowColor: MaterialStateProperty.all(Colors.transparent), // Remove 'const'
                    trailing: const [
                      Icon(
                        Icons.person_search,
                      )
                    ],
                    onChanged: (value) {
                      setState(
                        () {
                          filteredList =
                              controller.nicknameList.where((element) => (element.toLowerCase().contains(value.toLowerCase())) && (value.isNotEmpty)).toList();
                          //print('검색된 친구 리스트 $filteredList');
                        },
                      );
                      print('검색 $value');
                      //print('nicknameList: ${controller.nicknameList}');
                      print('검색된 갯수: ${filteredList.length}');
                      print('검색된 친구 리스트 $filteredList');
                    },
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            // Container(
            //   width: 368,
            //   decoration: const ShapeDecoration(
            //     color: Color(0xFFF5F1F1),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(30),
            //         topRight: Radius.circular(30),
            //       ),
            //     ),
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 10),
            //     child: Column(
            //       children: [
            //         // if (filteredList.isNotEmpty)
            //         //   Expanded(
            //         //     child: ListView.builder(
            //         //       itemCount: filteredList.length,
            //         //       itemBuilder: (context, index) {
            //         //         return ListTile(
            //         //           title: Text(filteredList[index]),
            //         //           onTap: () {
            //         //             //Get.to(() => FriendViewPage(model: model));
            //         //           },
            //         //         );
            //         //       },
            //         //     ),
            //         //   ),
            //         if (filteredList.isEmpty)
            //           Expanded(
            //             child: ListView.builder(
            //               itemCount: controller.friendList.length,
            //               itemBuilder: (context, index) {
            //                 return Column(
            //                   children: [
            //                     if (index == 0) const SizedBox(height: 10),
            //                     FriendComponent(
            //                       model: controller.friendList[index],
            //                     ),
            //                     Divider(
            //                       color: Color(Common.subGray),
            //                       thickness: 0.5,
            //                     ),
            //                   ],
            //                 );
            //               },
            //             ),
            //           ),
            //       ],
            //     ),
            //   ),
            // ),
            if (filteredList.isNotEmpty) SearchFriendList(),
            Container(
              width: 368,
              decoration: const ShapeDecoration(
                color: Color(0xFFF5F1F1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    for (int index = 0; index < controller.friendList.length; index++)
                      Column(
                        children: [
                          if (index == 0) const SizedBox(height: 10),
                          FriendComponent(
                            model: controller.friendList[index],
                          ),
                          //if (index != controller.friendList.length - 1) const SizedBox(height: 10),
                          Divider(color: Color(Common.subGray), thickness: 0.5),
                        ],
                      )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget SearchFriendList() {
  print('검색된 친구 리스트 $filteredList');

  if (filteredList.isEmpty) {
    return Container(
      child: const Text('검색된 결과가 없습니다.'),
    );
  } else {
    return Expanded(
      child: ListView.builder(
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredList[index]),
            onTap: () {
              print("검색된 친구 탭");
              //Get.to(() => FriendViewPage(model: model));
            },
          );
        },
      ),
    );
  }
}
