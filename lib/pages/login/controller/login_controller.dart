import 'package:frontend/service/user_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find<LoginController>();

  Future<int> login() async {
    int result = await UserService.instance.googleSingIn();

    return result;
  }
}
