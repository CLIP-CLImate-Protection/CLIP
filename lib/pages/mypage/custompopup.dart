import 'package:flutter/material.dart';
import 'package:frontend/fastAPI/models/User.dart';
import 'package:frontend/pages/login/view/login.dart';
import 'package:frontend/service/user_service.dart';
import 'package:get/get.dart';

class CustomPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: 296,
        height: 211,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '로그아웃 하시겠습니까?',
              style: TextStyle(
                fontFamily: 'Istok Web',
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: BorderSide(width: 2, color: Color(0xFF278740)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(104, 21),
                  ),
                  child: Text(
                    '취소',
                    style: TextStyle(color: Color(0xFF278740)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    UserService.instance.logout();

                    // Get.snackbar(
                    //     'User ID: ${UserService.instance.uid}', '로그아웃 되었습니다.');
                    //Get.toNamed(LoginPage.url);
                    Navigator.pop(context, true);
                    Get.offAllNamed(LoginPage.url);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF278740),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(104, 21),
                  ),
                  child: Text('확인', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
