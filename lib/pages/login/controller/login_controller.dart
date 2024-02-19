import 'package:frontend/service/user_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find<LoginController>();

  Future<int> login() async {
    int result = await UserService.instance.googleSignIn();
    // Now wait for UserService.instance.uid to be updated
    print('${UserService.instance.uid} 로그인 컨트롤러');
    await Future.delayed(const Duration(seconds: 5)); // You can adjust the duration as needed
    return result;
  }
}
