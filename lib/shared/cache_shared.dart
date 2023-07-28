import 'package:shared_preferences/shared_preferences.dart';
class SharedData{
 static SharedPreferences? shared;
  static Future init()async{
    shared=await SharedPreferences.getInstance();
  }
  static Future<bool?> setIsDark({required String key,required bool isDark})async{
   return await shared?.setBool(key, isDark);
  }
  static bool? getIsDark({required String key}){
    return shared?.getBool(key);
  }
}