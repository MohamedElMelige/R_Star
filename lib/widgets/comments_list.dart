import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:stars_live/models/singl_user_model.dart';
import 'package:stars_live/providers/show_comments_provier.dart';
import '../global/constants.dart';
import 'user_info_bottom_sheet.dart';

class CommentsList extends StatelessWidget {
  final comments, recieverID;
  const CommentsList({Key? key, this.comments, required this.recieverID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:

      ChangeNotifierProvider(
        create : (context) => ShowCommentsProvider(),
        child: Consumer<ShowCommentsProvider>(
          builder : (context, value, child) {

            return  GestureDetector(
              onHorizontalDragEnd: (_){
                value.toggleComments();
              },
              child:value.showComments? ListView.builder(
                reverse: true,
                itemBuilder: (context, index) {
                  return comments[index]['type'] == 'GIFT'
                      ? Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 0,
                        ),
                        decoration: levelsColor[((comments[index]['level']/20).floor()>15?15:(comments[index]['level']/20).floor())],
                        child: Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.solidStar,
                              color: Color.fromARGB(
                                255,
                                255,
                                230,
                                0,
                              ),
                              size: 10,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              comments[index]['level'].toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: (){
                          Get.bottomSheet(
                            UserInfoBottomSheet(
                              user: User.fromJson(comments[index]['user']),
                              recieverID: User.fromJson(comments[index]['user']).id.toString(),
                            ),
                          );
                        },
                        child: Text(
                          comments[index]['name'].toString() + ' : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),
                      Container(
                        width: 100,
                        height: 100,
                        child: comments[index]['video'] != null
                            ? Image.network(comments[index]['image'].toString(),width: 40,height: 30,)
                            : comments[index]['image'] != null
                            ? Image.network(
                            comments[index]['image'].toString())
                            : Center(
                          child: Text(
                            comments[index]['title'].toString(),
                          ),
                        ),
                      ),
                    ],
                  )
                      : Container(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 0,
                          ),
                          decoration:levelsColor[(comments[index]['level']/20).floor()>15?15:(comments[index]['level']/20).floor()],
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.solidStar,
                                color: Color.fromARGB(
                                  255,
                                  255,
                                  230,
                                  0,
                                ),
                                size: 10,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                comments[index]['level'].toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: (){
                            // Get.bottomSheet(
                            //   UserInfoBottomSheet(
                            //     user: User.fromJson(comments[index]['user']),
                            //     recieverID: User.fromJson(comments[index]['user']).id.toString(),
                            //   ),
                            // );
                            Get.bottomSheet(UserInfoBottomSheet(
                              user: User.fromJson(comments[index]['user']),
                              recieverID:User.fromJson(comments[index]['user']).id.toString() ,
                            ));
                          },
                          child: Text(
                            comments[index]['name'].toString() + ' : ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          width: Get.width * 0.5,
                          child: Text(
                            comments[index]['comment'].toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: comments.length,
              ):Container(width: double.maxFinite,child:Text('StarsLive',style: TextStyle(color: Colors.transparent),),),
            );
          },

        ),
      ),
     // ),
    );
  }
}
