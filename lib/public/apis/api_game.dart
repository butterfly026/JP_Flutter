
import 'package:fpg_flutter/public/define/appDefine.dart';
import 'package:fpg_flutter/public/network/networking.dart';
class ApiGame {
  static Future<Map<String, dynamic>> homeGames() async {
    final options = NetworkingOptions();    
    
    return await Networking.get('${AppDefine.host}/wjapp/api.php?c=game&a=homeGames', null, options) as Map<String, dynamic>;
  }
}
