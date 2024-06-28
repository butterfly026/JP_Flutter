import 'package:fpg_flutter/public/define/appDefine.dart';
import 'package:fpg_flutter/public/network/networking.dart';

class ApiSystem {
  static Future<Map<String, dynamic>> homeAds() async {
    final options = NetworkingOptions();    
    
    return await Networking.get('${AppDefine.host}/wjapp/api.php?c=system&a=homeAds', null, options) as Map<String, dynamic>;
  }

  static Future<Map<String, dynamic>> banners() async {
    final options = NetworkingOptions();  
    return await Networking.get('${AppDefine.host}/wjapp/api.php?c=system&a=banners', null, options) as Map<String, dynamic>;
  }

  static Future<Map<String, dynamic>> notices() async {
    final options = NetworkingOptions();    
    
    return await Networking.get('${AppDefine.host}/wjapp/api.php?c=notice&a=latest', null, options) as Map<String, dynamic>;
  }
}
