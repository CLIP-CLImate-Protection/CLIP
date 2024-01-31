import 'package:frontend/flutter/packages/flutter/lib/material.dart';

import '../controller/main_view_controller.dart';

class MainViewPage extends StatelessWidget {
  const MainViewPage({super.key});

  static const String url = '/main';

  @override
  Widget build(BuildContext context) {
    final controller = MainViewController.instance;

    return const Scaffold(
      body: Center(
        child: Text('MainViewPage'),
      ),
    );
  }
}
