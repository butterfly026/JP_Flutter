part of '../router.dart';


class AppRouter {
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final RouteObserver<ModalRoute<void>> routeObservers =
      RouteObservers();

  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const mypage = '/mypage';
  static const chat = '/chat';
  static const chat_message = '/chat/messages';
  static const chat_group = '/chat/group';
  static const request_list = '/request/list';
  static const request_detail = '/request/detail';
  static const accountPath = '/ucenter';
  static const profileChangePasswordPath = '/change-password';
  static const homePath = '/home';

  static final List<GetPage> pages = [
    
  GetPage(
    name: '/',
    page: () => MainPage(),
    binding: MainBindings(),
  ),
  GetPage(
    name: homePath,
    page: () => MainPage(),
    binding: MainBindings(),
  ),
  GetPage(
    name: login,
    page: () => const LoginScreen(),
    binding: MainBindings(),
  ),
  GetPage(
    name: register,
    page: () => const SignUpScreen(),
    binding: MainBindings(),
  ),
    // GetPage(
    //   name: login,
    //   page: () => const Login(),
    // ),
    // GetPage(
    //   name: register,
    //   page: () => const Register(),
    // ),
    // GetPage(
    //   name: home,
    //   page: () => const MyHomePage(),
    // ),
    // GetPage(
    //   name: mypage,
    //   page: () => const MyPage(),
    // ),
    // GetPage(
    //   name: request_list,
    //   page: () => const RequestList(),
    // ),
    // GetPage(
    //   name: request_detail,
    //   page: () => const RequestDetail(),
    // ),
    // GetPage(
    //   name: chat,
    //   page: () => const ChatPage(),
    // ),
    // GetPage(
    //   name: chat_message,
    //   page: () => const ChatMessagePage(),
    // ),
    // GetPage(
    //   name: chat_group,
    //   page: () => const ChatGroupPage(),
    // ),
  ];
}
