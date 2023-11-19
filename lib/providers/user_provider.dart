import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stars_live/models/user_model.dart';

import '../global/constants.dart';
import '../utils/Cache_Helper.dart';
import '../utils/diohelper.dart';
import '../models/follower_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? userData;

  Future getUserData(String? email, String? password) async {
    try {
      var response = await DioHelper.setData(
          path: 'login', data: {'login': email, 'password': password});
      if (response.statusCode == 200) {
        // await Cache_Helper.setData('email', email);
        // await Cache_Helper.setData('password', password);
        print('messgage ' + response.data['msg']);
        userData = UserModel.fromJson(response.data);
        final storage = GetStorage();
        storage.write('api', userData?.data?.first.apiToken.toString());
        // await Cache_Helper.setData('api', userData?.data?.first.apiToken);
        print(userData?.data?.elementAt(0).email);
        myFollowingsIds(userData?.data?.first.followeds);
        notifyListeners();
      }
    } catch (error) {
      Cache_Helper.removeData('email');
      Cache_Helper.removeData('password');
      Cache_Helper.removeData('googleEmail');
      GoogleSignIn().signOut();
      GetStorage().remove('api');
      userData = null;
      print('error from userprovider' + error.toString());
      notifyListeners();
    }
  }


  Future getMyData() async {
    try {
      var response = await DioHelper.getData(
          path: 'user/my-data',
          auth: 'Bearer ' + GetStorage().read('api'),
      );
      if (response.statusCode == 200) {
        userData = UserModel.fromJson(response.data);
        myFollowingsIds(userData?.data?.first.followeds);
        print('from get my data');
        notifyListeners();
      }
    } catch (error) {
      print('error from my data' + error.toString());
      notifyListeners();
    }
  }

  Future getGoogleUserData() async {
    int random1 = Random().nextInt(99999999);
    int random2 = Random().nextInt(88888888);
    int random3 = Random().nextInt(77777777);
    var googleEmail = Cache_Helper.getData('googleEmail');
    var googleName = Cache_Helper.getData('googleName');
    var googleId = Cache_Helper.getData('googleId');
    print('hello google sign in');
    try {
      var response = await DioHelper.setData(path: 'social/login', data: {
        'google_id': googleId,
        'name': googleName,
        'email': googleEmail,
        'device_token': '$random3$random1$random2$random3$random1$random2'
      });
      if (response.statusCode == 200) {
        print('messgage ' + response.data['msg']);
        print(userData?.data?.first.email);
        userData = UserModel.fromJson(response.data);
        print(userData?.data?.first.email);
        final storage = GetStorage();
        storage.write('api', userData?.data?.first.apiToken.toString());
        myFollowingsIds(userData?.data?.first.followeds);
        print(googleId);
        print(googleName);
        print('$random3$random1$random2$random3$random1$random2');
        print(userData?.data?.first.email);

        notifyListeners();
      }
    } catch (error) {
      Cache_Helper.removeData('email');
      Cache_Helper.removeData('password');
      Cache_Helper.removeData('googleEmail');
      GoogleSignIn().signOut();
      GetStorage().remove('api');
      userData = null;
      print('error from userProvider ' + error.toString());
      notifyListeners();
    }
  }

  void followUser(userID) async {
    try {
      final dio = Dio();
      dio.options = BaseOptions(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${GetStorage().read('api') ?? ''}',
        },
      );
      await dio.post(
        followingURL,
        data: {
          'follow_id': userID,
        },
      );
      myFollowingsIdss.add(userID);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void unFollowUser(userID) async {
    try {
      final dio = Dio();
      dio.options = BaseOptions(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${GetStorage().read('api') ?? ''}',
        },
      );
      await dio.post(
        unFollowURL,
        data: {
          'follow_id': userID,
        },
      );
      myFollowingsIdss.remove(userID);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

   void myFollowingsIds(List<Follower>? myFollowings)
  {
    if(myFollowings!=null)
      {
        myFollowingsIdss={};
        myFollowings.forEach((element) {
          myFollowingsIdss.add(element.id??-1);
        });
      }
  }



}
