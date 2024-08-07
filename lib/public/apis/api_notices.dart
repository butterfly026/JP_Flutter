import 'package:fpg_flutter/public/define/appDefine.dart';
import 'package:fpg_flutter/public/network/networking.dart';


const List<String> appInfoUrl = [
  'https://appapi.coin-ken.com/api.php',
  'https://appapi.doy-coin.net/api.php',
  'https://appapi.hguavideo.com/api.php',
  'https://appapi.itokenweb.com/api.php',
]; //域名服务器

class ApiNotices {
  static Future<Map<String, dynamic>> latest() async {
    final options = NetworkingOptions();    
    return await Networking.get('${AppDefine.host}/wjapp/api.php?c=notice&a=latest', null, options) as Map<String, dynamic>;
  }
}
