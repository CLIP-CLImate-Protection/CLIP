import 'package:flutter/material.dart';
import 'package:frontend/pages/social/controller/social_main_controller.dart';

class SocialMainPage extends StatelessWidget {
  const SocialMainPage({super.key});

  static const String url = '/social/main';

  @override
  Widget build(BuildContext context) {
    final controller = SocialMainController.instance;
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Quest Main Page',
            ),
          ],
        ),
      ),
    );
  }
}
