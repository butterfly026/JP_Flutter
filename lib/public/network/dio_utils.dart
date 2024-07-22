part of http;

class DioUtils {
  static Dio? _instance;
  static CancelToken? cancelToken;

  static Dio getInstance() {
    if (_instance == null) {
      _instance = Dio(BaseOptions(
        baseUrl: 'https://example.com/api',
        connectTimeout: const Duration(milliseconds: 1000 * 60),
        receiveTimeout: const Duration(milliseconds: 1000 * 60),
      ));

      // _instance!.interceptors.add(BasicInterceptor());
      // _instance!.interceptors.add(ErrorInterceptor());
      _instance!.interceptors.add(
        LogInterceptor(
          request: true,
          requestHeader: true,
          responseBody: true,
          requestBody: true,
        ),
      );
    }
    return _instance!;
  }
}
