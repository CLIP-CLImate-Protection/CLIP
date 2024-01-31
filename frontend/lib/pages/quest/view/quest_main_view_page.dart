import 'package:frontend/flutter/packages/flutter/lib/material.dart';

class QuestMainPage extends StatelessWidget {
  const QuestMainPage({super.key});

  static const String url = '/quest/main';

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
