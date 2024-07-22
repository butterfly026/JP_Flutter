library http;


import 'package:dio/dio.dart';
import 'package:fpg_flutter/public/network/service.dart';

part 'dio_utils.dart';

part 'exception.dart';


var http = DioUtils.getInstance();

final httpService = ApiService(dio: http);
