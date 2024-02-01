import 'package:flutter/material.dart';

import '../../../common/common.dart';
import '../controller/main_view_controller.dart';

class MainViewPage extends StatelessWidget {
  const MainViewPage({super.key});

  static const String url = '/main';

  @override
  Widget build(BuildContext context) {
    final controller = MainViewController.instance;

    return Container(
      color: Color(Common.mainColor),
      width: Common.getWidth,
      child: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text('CLIP', style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Kantumruy')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
