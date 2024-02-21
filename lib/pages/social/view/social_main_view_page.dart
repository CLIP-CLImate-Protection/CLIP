import 'package:flutter/material.dart';
import 'package:frontend/common/common.dart';
import 'package:frontend/pages/social/controller/social_main_controller.dart';
import 'package:frontend/pages/social/view/component/friend_component.dart';
import 'package:frontend/pages/social/view/freind_view_page.dart';
import 'package:get/get.dart';

// class SocialMainPage extends StatefulWidget {
//   const SocialMainPage({super.key});

//   static const String url = '/social/main';

//   @override
//   _SocialViewPageState createState() => _SocialViewPageState();
// }

// List<String> controller.filteredList = [];
// final controller = SocialMainController.instance;

// class _SocialViewPageState extends State<SocialMainPage> {
//   @override
//   Widget build(BuildContext context) {
//     //controller.initFriend();
//     controller.initFriendList();
//     controller.getFriendList();
//     //String value;
//     // controller.filteredList = [];
//     return Container(
//       color: Color(Common.mainColor),
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             Container(
//               width: 368,
//               height: 132,
//               decoration: ShapeDecoration(
//                 color: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               ),
//               child: Column(children: [
//                 const Padding(
//                   padding: EdgeInsets.all(20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         '친구',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 30,
//                           fontFamily: 'Inter',
//                           fontWeight: FontWeight.w800,
//                           letterSpacing: -0.41,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: 326,
//                   height: 44,
//                   decoration: ShapeDecoration(
//                     color: const Color(0xFFF5F1F1), // This is fine as it's a constant color
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(45),
//                     ),
//                   ),
//                   child: SearchBar(
//                     textStyle: MaterialStateTextStyle.resolveWith((states) => const TextStyle(color: Colors.black, fontSize: 17)),
//                     constraints: const BoxConstraints.expand(height: 44),
//                     backgroundColor: MaterialStateProperty.all(const Color(0xFFF5F1F1)), // Remove 'const'
//                     shadowColor: MaterialStateProperty.all(Colors.transparent), // Remove 'const'
//                     trailing: const [
//                       Icon(
//                         Icons.person_search,
//                       )
//                     ],
//                     onChanged: (value) {
//                       setState(
//                         () {
//                           controller.filteredList =
//                               controller.nicknameList.where((element) => (element.toLowerCase().contains(value.toLowerCase())) && (value.isNotEmpty)).toList();
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ]),
//             ),
//             if (controller.filteredList.isNotEmpty) SearchFriendList(),
//             const SizedBox(
//               height: 20,
//             ),
//             Expanded(
//               child: Obx(
//                 () => controller.friendList.isEmpty
//                     ? const CircularProgressIndicator(color: Color(0xFF33C26C))
//                     : Container(
//                         width: 368,
//                         decoration: const ShapeDecoration(
//                           color: Color(0xFFF5F1F1),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(30),
//                               topRight: Radius.circular(30),
//                             ),
//                           ),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10),
//                           child: Column(
//                             children: [
//                               for (int index = 0; index < controller.friendList.length; index++)
//                                 Column(
//                                   children: [
//                                     if (index == 0) const SizedBox(height: 10),
//                                     FriendComponent(
//                                       model: controller.friendList[index],
//                                     ),
//                                     //if (index != controller.friendList.length - 1) const SizedBox(height: 10),
//                                     Divider(color: Color(Common.subGray), thickness: 0.5),
//                                   ],
//                                 )
//                             ],
//                           ),
//                         ),
//                       ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

final controller = SocialMainController.instance;

class SocialMainPage extends StatelessWidget {
  const SocialMainPage({Key? key}) : super(key: key);

  static const String url = '/social/main';

  @override
  Widget build(BuildContext context) {
    controller.initFriendList();
    controller.getFriendList();
    return Scaffold(
      backgroundColor: Color(Common.mainColor),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Container(
              width: 368,
              //height: 132,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
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
                          child: Obx(() => Center(
                                child: Text(
                                  '${controller.friendList.length}명',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    letterSpacing: -0.41,
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SearchBar(
                        //textStyle: TextStyle(color: Colors.black, fontSize: 17),
                        constraints: const BoxConstraints.expand(height: 44),
                        backgroundColor: MaterialStateProperty.all(const Color(0xFFF5F1F1)),
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                        trailing: const [Icon(Icons.person_search)],
                        onChanged: (value) => controller.setSearchQuery(value),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(
                () => Container(
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
                    child: ListView.builder(
                      itemCount: controller.friendList.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          if (index == 0) const SizedBox(height: 10),
                          FriendComponent(model: controller.friendList[index]),
                          if (index != controller.friendList.length - 1) const SizedBox(height: 10),
                          Divider(color: Color(Common.subGray), thickness: 0.5),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget SearchFriendList() {
  if (controller.filteredList == null) {
    print('검색결과 없음');
    return Container(
      child: const Text('검색된 결과가 없습니다.'),
    );
  } else {
    return Column(
      children: [
        for (int index = 0; index < controller.filteredList.length; index++)
          Container(
            decoration: BoxDecoration(
              //color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Color(Common.subGray),
                  width: 0.5,
                ),
              ),
            ),
            width: 310, // Set your desired width
            height: 45, // Set your desired height
            child: TextButton(
              onPressed: () {
                print('누른 친구 ${controller.filteredList[index]}');
                //reset the friend value
                controller.getFriendInfo(controller.filteredList[index]);
                print('친구 정보 ${controller.friend.value.nickname}');
                if (controller.friend.value.nickname != null) {
                  Get.to(() => FriendViewPage(
                        model: controller.friend.value,
                      ));
                }
              },
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  controller.filteredList[index],
                  style: const TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
