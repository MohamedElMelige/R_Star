import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global/constants.dart';
import 'games/guess_screen.dart';

class GamesScreen extends StatelessWidget {
  static String id = '/gamesScreen';

  const GamesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: GRADIENT),
        ),
        titleSpacing: 0.0,
        centerTitle: true,
        title: Text(
          'games'.tr,
          style: Get.theme.textTheme.headline5?.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0 , vertical: 20),
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                  gradient: GRADIENT,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: MaterialButton(
                  onPressed: () {
                    Get.toNamed(GuessScreen.id);
                  },
                  child: Text('guess game'.tr , style: Get.textTheme.headline6?.copyWith(color: Colors.white),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
