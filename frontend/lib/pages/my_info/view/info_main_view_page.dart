import 'package:frontend/flutter/packages/flutter/lib/material.dart';

import '../controller/info_controller.dart';

class MyInfoPage extends StatelessWidget {
  const MyInfoPage({super.key});

  static const String url = '/my_info';

  @override
  Widget build(BuildContext context) {
    final controller = MyInfoViewController.instance;

    return const Scaffold(
        body: Center(
      child: Text('MyInfoPage'),
    ));
  }
}
