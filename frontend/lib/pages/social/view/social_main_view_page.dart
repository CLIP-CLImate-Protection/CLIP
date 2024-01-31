import 'package:frontend/flutter/packages/flutter/lib/material.dart';

class SocialMainPage extends StatelessWidget {
  const SocialMainPage({super.key});

  static const String url = '/social/main';

  @override
  Widget build(BuildContext context) {
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
