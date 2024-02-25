import 'package:frontend/service/user_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find<LoginController>();

  Future<int> login(String date) async {
    int result = await UserService.instance.googleSignIn(date);
    return result;
  }
}
