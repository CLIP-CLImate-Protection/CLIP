import 'package:flutter/material.dart';
import 'package:frontend/fastAPI/models/User.dart';
import 'package:frontend/pages/social/view/freind_view_page.dart';
import 'package:get/get.dart';

import '../../../../common/common.dart';

class FriendComponent extends StatelessWidget {
  final User model;

  static const String url = '/quest';
  const FriendComponent({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final controller = SocialMainController.instance;

    return InkWell(
      onTap: () async {
        Get.to(() => FriendViewPage(model: model));
      },
      child: SizedBox(
        width: Common.getWidth * 0.85,
        height: 68,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[300],
                backgroundImage: model.profileImage != null ? NetworkImage(model.profileImage!) : null,
                child: model.profileImage == null
                    ? Icon(
                        Icons.person,
                        size: 32,
                        color: Colors.grey[600],
                      )
                    : null,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                '${model.userName}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Istok Web',
                  letterSpacing: -0.41,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text('${model.level}'),
              const Spacer(),
              TextButton(
                onPressed: () {
                  // 버튼을 눌렀을 때 실행되는 함수
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFFAE474)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                  ),
                ),
                child: const SizedBox(
                  width: 80,
                  height: 20,
                  child: Center(
                    child: Text(
                      '친구 삭제',
                      style: TextStyle(
                        // 버튼 텍스트 스타일
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        letterSpacing: -0.41,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
