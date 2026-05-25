import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences instance;

  static Future<void>init()async{
    instance = await SharedPreferences.getInstance();
}

static void setBool(String key,bool value){
    instance.setBool(key, value);
}

static  bool getBool(String key){
    return instance.getBool(key) ?? false;
}




}