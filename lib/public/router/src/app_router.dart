part of '../router.dart';

class AppRouter {
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final RouteObserver<ModalRoute<void>> routeObservers =
      RouteObservers();

  static const login = '/login';
  static const register = '/register';
  static const profile = '/profile';
  static const profileEdit = '/profile/edit';
  static const chat = '/chat';
  static const chatMessage = '/chat/messages';
  static const chatGroup = '/chat/group';
  static const requestReport = '/request/report';
  static const requestList = '/request/list';
  static const requestStart = '/request/start';
  static const requestActive = '/request/active';
  static const requestDetail = '/request/detail';
  static const authSettings = '/auth_settings';
  static const userShift = '/user/shift';
  static const notices = '/notices';
  static const noticeDetail = '/notices/detail';
  static const cardDetail = '/cards/detail';
  static const webPage = '/web_page';
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
    GetPage(
      name: notices,
      page: () => const NoticesPage(),
    ),
    GetPage(
      name: noticeDetail,
      page: () => const NoticeDetailPage(),
    ),
    GetPage(
      name: profileEdit,
      page: () => const ProfileEditPage(),
    ),
    GetPage(
      name: authSettings,
      page: () => const AuthSettingsPage(),
    ),
    GetPage(
      name: userShift,
      page: () => const UserShiftPage(),
    ),
    GetPage(
      name: cardDetail,
      page: () => const CardInfoPage(),
    ),
    GetPage(
      name: chatMessage,
      page: () => const ChatMessagePage(),
    ),
    GetPage(
      name: chatGroup,
      page: () => const ChatGroupPage(),
    ),
    GetPage(
      name: webPage,
      page: () => const WebViewPage(),
    ),
  ];
}
