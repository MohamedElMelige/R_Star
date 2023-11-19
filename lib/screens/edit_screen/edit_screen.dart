import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stars_live/providers/profile_provider.dart';
import 'package:stars_live/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:stars_live/screens/main_screen/main_screen_tabs/profile_tab.dart';

import '../../global/constants.dart';
import '../../utils/Cache_Helper.dart';
import '../../global/functions.dart';

class EditScreen extends StatelessWidget {
  EditScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  var password = Cache_Helper.getData('password');
  var email = Cache_Helper.getData('email');

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 100),
                height: double.infinity,
                decoration: const BoxDecoration(
                  gradient: GRADIENT,
                ),
                child: SingleChildScrollView(
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Container(
                        margin:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 50),
                        height: Get.size.height / 2,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Consumer<UserProvider>(
                                builder: (context, value, child) {
                                  return Container(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: DECORATION.copyWith(
                                        color: Colors.grey[300]),
                                    margin: EdgeInsets.only(bottom: 10),
                                    width: double.infinity,
                                    //height: 50,
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: TextFormField(
                                          controller: _nameController,
                                          decoration: InputDecoration(
                                            hintText: value.userData?.data?.first.name ??
                                                'username'.tr,
                                            border: InputBorder.none,
                                          ),
                                        )),
                                  );
                                },
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Color(0xff6950FB),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Consumer<ProfileProvider>(
                                  builder: (context, value, child) {
                                    String? apiToken = GetStorage().read('api');
                                    return MaterialButton(
                                      onPressed: () async{
                                        if (formKey.currentState!.validate()) {

                                          await value.updateProfile({
                                            'name': _nameController.text,
                                          }, 'Bearer ' + (apiToken ?? ''));

                                          if(value.updatedDataUser!=null)
                                          {
                                            if(password!=null) {

                                              context
                                                  .read<UserProvider>()
                                                  .getMyData();
                                            } else
                                              context.read<UserProvider>().getMyData();
                                            
                                            
                                            Fluttertoast.showToast(msg: 'updated'.tr);
                                            Get.back();
                                          }
                                          
                                        }
                                      },
                                      child: Text(
                                        "save".tr,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Consumer<UserProvider>(
                        builder: (context, value, child) {
                          if( Provider.of<ProfileProvider>(context).uploadedImage) {
                            Provider.of<ProfileProvider>(context).uploadedImage=false;
                            value.getMyData();
                          }
                          String apiToken = 'Bearer '+ GetStorage().read('api');;
                          return Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 58,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(value.userData?.data?.first.image??''),
                                  backgroundColor: Colors.grey,
                                  radius: 51,
                                ),
                              ),
                              InkWell(
                                onTap:(){
                                  showBottomSheet(context: context, builder: (context)=> BottomSheetBuilder(context,apiToken));
                                },
                                child: Stack(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      radius: 18,
                                      child: CircleAvatar(
                                        child: Icon(Icons.camera_alt_outlined,color: Colors.white,),
                                        backgroundColor: Colors.grey,
                                        radius: 15,
                                      ),
                                    ),
                                    if(Provider.of<ProfileProvider>(context).uploading)
                                      CircularProgressIndicator(color: basicColor,)
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget BottomSheetBuilder(context,apiToken) {
    return Container(
      height: 80.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: InkWell(
              onTap: (){
                Provider.of<ProfileProvider>(context,listen: false).pickMessageImage(true,apiToken);

                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.camera_alt),
                    SizedBox(width:10.0),
                    Text('camera'.tr)
                  ],
                ),
              ),
            ),
          ),
          Divider(height: 2.0,),
          Expanded(
            child: InkWell(
              onTap: (){
                Provider.of<ProfileProvider>(context,listen: false).pickMessageImage(false,apiToken);
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.image),
                    SizedBox(width: 10.0,),
                    Text('gallery'.tr)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
