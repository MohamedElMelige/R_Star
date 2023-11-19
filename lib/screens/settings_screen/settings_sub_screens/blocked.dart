import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/constants.dart';

class BlockedScreen extends StatelessWidget {
  static String id = '/blockedScreen';

  const BlockedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 30),
            height: Get.height * 0.13,
            decoration: const BoxDecoration(
              gradient: GRADIENT,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Blocked',
                        style: Get.theme.textTheme.headline5
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: Get.height / 1.5,
            child: ListView(
              children: List.generate(
                5,
                (index) => Container(
                  margin: EdgeInsets.only(bottom: 10, right: 8, left: 8),
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  width: double.infinity,

                  decoration: DECORATION.copyWith(color: Colors.grey[300]),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage('https://www.testingtime.com/app/uploads/2020/12/in-house_research_2.png'),
                      ),
                      SizedBox(width: 15,),
                      Expanded(child: Text('username',style: Get.theme.textTheme.headline6?.copyWith(color: Colors.red),))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
