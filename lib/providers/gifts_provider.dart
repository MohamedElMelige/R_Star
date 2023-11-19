import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stars_live/global/constants.dart';
import 'package:stars_live/models/gift_model.dart';


class GiftsProvider extends ChangeNotifier {
  List<Gift> gifts = [];

  void getAllGifts() async {
    try {
      final dio = Dio();
      dio.options = BaseOptions(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${GetStorage().read('api') ?? ''}',
        },
      );
      final response = await dio.post(
        getGiftsURL,
      );
      response.data['data'].forEach((gift) {
        gifts.add(Gift.fromJson(gift));
      });
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
  bool sendSuccess= false ;
  void sendGift(Gift gift, userID) async {

    notifyListeners();
    try {
      final dio = Dio();
      dio.options = BaseOptions(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${GetStorage().read('api') ?? ''}',
        },
      );
      //Fluttertoast.showToast(msg: 'loading');
      await dio.post(
        sendGiftURL,
        data: {
          'receiver_id': userID,
          'gift_id': gift.id,
          'gift_number': 1,
        },
      );
     // Fluttertoast.showToast(msg: 'done');
      updateSendSuccuess(true);
      notifyListeners();


    } catch (e) {
      //Fluttertoast.showToast(msg: 'wrong');
      updateSendSuccuess(false);
      print(e);
    }
  }



  void updateSendSuccuess(bool val)
  {
    sendSuccess = val;
   // Fluttertoast.showToast(msg: 'send success upadated');
    notifyListeners();
  }
}
