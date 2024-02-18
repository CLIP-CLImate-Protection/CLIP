import 'package:flutter/material.dart';
import 'package:frontend/backend/backend_page_controller.dart';
// import '../../backend/backend_page_controller.dart';

class BackendPage extends StatelessWidget {
  const BackendPage({super.key});

  static const String url = '/backend';

  @override
  Widget build(BuildContext context) {
    final controller = BackendPageController.instance;

    return const Scaffold(
        body: Center(
      child: Text('BackendPage'),
    ));
  }
}
