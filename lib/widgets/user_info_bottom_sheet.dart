import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:stars_live/models/singl_user_model.dart';
import 'package:stars_live/providers/user_provider.dart';
import 'package:stars_live/widgets/gifts_dialog.dart';
import 'package:stars_live/screens/chat%20screen/chat_screen.dart';

import '../global/constants.dart';
import '../global/functions.dart';

class UserInfoBottomSheet extends StatefulWidget {
  final User user;
  final String recieverID;
  const UserInfoBottomSheet(
      {Key? key, required this.user, required this.recieverID})
      : super(key: key);

  @override
  State<UserInfoBottomSheet> createState() => _UserInfoBottomSheetState();
}

class _UserInfoBottomSheetState extends State<UserInfoBottomSheet> {


  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return SizedBox(
      height: 380,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 310,
            child: Container(
              padding: const EdgeInsets.only(
                top: 60,
                left: 10,
                right: 10,
              ),
              height: Get.height * 0.5,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.user.name.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'id: '.tr + widget.user.id.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(5),
                        height: 70,
                        width: Get.width * 0.4,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 241, 49, 49),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.solidStar,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'host level'.tr,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  widget.user.levelHost!.level.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(5),
                        height: 70,
                        width: Get.width * 0.4,
                        decoration: levelsColor[(widget.user.levelUser?.level/20).floor()>15?15:(widget.user.levelUser?.level/20).floor()],
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.solidMoon,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'user level'.tr,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  widget.user.levelUser!.level.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: RawMaterialButton(
                            onPressed: () {
                              if (myFollowingsIdss.contains(widget.user.id)) {
                                userProvider.unFollowUser(widget.user.id);
                                setState(() {
                                  Functions.updateUserData(context);
                                });
                              } else {
                                userProvider.followUser(widget.user.id);
                                setState(() {
                                  Functions.updateUserData(context);
                                });
                              }
                            },
                            child: Row(
                              children: [
                                Icon(
                                  myFollowingsIdss.contains(widget.user.id)
                                      ? FontAwesomeIcons.minus
                                      : FontAwesomeIcons.plus,
                                  color: Colors.cyan[600],
                                  size: 12,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  myFollowingsIdss.contains(widget.user.id) ? 'un follow'.tr : 'follow'.tr,
                                  style: TextStyle(
                                    color: Colors.cyan[600],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: RawMaterialButton(
                            onPressed: () {

                            },
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/images/chat.svg' , height: 18, width: 18,),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: (){
                                    Get.to(ChatScreen(id : widget.user.id , imgurl : widget.user.image , name:  widget.user.name,));
                                  },
                                  child: Text(
                                    'chat'.tr,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: RawMaterialButton(
                            onPressed: () {
                              Get.bottomSheet(
                                GiftsDialog(
                                  toWhome: widget.user.name??'username',
                                user: widget.user,
                                recieverID: widget.recieverID,
                                show: false,
                              ));
                            },
                            child: Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.gift,
                                  color: Color.fromARGB(255, 152, 0, 240),
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'send gift'.tr,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 152, 0, 240),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(widget.user.image!),
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
