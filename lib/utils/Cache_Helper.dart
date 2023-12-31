import 'package:shared_preferences/shared_preferences.dart';

class Cache_Helper{
    static SharedPreferences? sharedPreferences ;

  static init() async
  {
      sharedPreferences = await SharedPreferences.getInstance() ;
  }

  static Future<bool?> setData(String key, dynamic value)async
  {
    if(value is bool)
   return await sharedPreferences?.setBool(key, value);
    if(value is double)
      return await sharedPreferences?.setDouble(key, value);
    if(value is int)
      return await sharedPreferences?.setInt(key, value);
    if(value is String)
      return await sharedPreferences?.setString(key, value);

  }

    static dynamic getData(String key)
    {
      return  sharedPreferences?.get(key);
    }

    static Future<bool?> removeData(String key)async
    {
      return await sharedPreferences?.remove(key);
    }

}