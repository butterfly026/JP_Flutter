part of '../router.dart';

class AppRouter {
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final RouteObserver<ModalRoute<void>> routeObservers =
      RouteObservers();

  static const login = '/login';
  static const register = '/register';
  static const profile = '/profile';
  static const chat = '/chat';
  static const chatMessage = '/chat/messages';
  static const chatGroup = '/chat/group';
  static const requestReport = '/request/report';
  static const requestList = '/request/list';
  static const requestStart = '/request/start';
  static const requestActive = '/request/active';
  static const requestDetail = '/request/detail';
  static const accountPath = '/ucenter';
  static const profileChangePasswordPath = '/change-password';
  static const homePath = '/home';
  static const mainPath = '/';

  static final List<GetPage> pages = [
    GetPage(
      name: mainPath,
      page: () => MainPage(),
    ),
    GetPage(
      name: homePath,
      page: () => MainPage(),
    ),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: register,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: profile,
      page: () => MainPage(curIndex: AppDefine.TAB_PROFILE_INDEX),
    ),
    GetPage(
      name: requestDetail,
      page: () => const RequestDetailPage(),
    ),
    GetPage(
      name: requestReport,
      page: () => const RequestReportPage(),
    ),
    GetPage(
      name: requestStart,
      page: () => const RequestStartReportPage(),
    ),
    GetPage(
      name: requestActive,
      page: () => const RequestActiveReportPage(),
    ),
  ];
}
