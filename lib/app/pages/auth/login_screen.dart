import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fpg_flutter/app/controllers/auth_controller.dart';
import 'package:fpg_flutter/app/controllers/global_controller.dart';
import 'package:fpg_flutter/app/pages/main/main_home_controller.dart';
import 'package:fpg_flutter/public/define/appDefine.dart';
import 'package:fpg_flutter/public/router/router.dart';
import 'package:fpg_flutter/public/widgets/button.dart';
import 'package:fpg_flutter/public/widgets/input.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  final AuthController authController = Get.find();
  String userName = '';
  String password = '';
  bool bUserNameValid = true;

  Future handleLogin() async {
    if (userName.isEmpty || password.isEmpty) {
      setState(() {
        bUserNameValid = false;
      });
    } else {
      await Get.offAndToNamed(AppRouter.profile);
    }
  }

  Future handleRegister() async {
    print(userName);
    print(password);
    Get.offNamed(AppRouter.register);
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    return new SafeArea(
        child: Scaffold(
      body: Container(
          color: Colors.white,
          child: new SafeArea(
            child: Scaffold(
              backgroundColor: AppTheme.white,
              body: new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      child: new Stack(
                        children: [
                          new Center(
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Image.asset(
                                  'assets/images/logo.png',
                                  // width: 168.0,
                                  // height: 168.0,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (!bUserNameValid)
                          Text(
                            'ユーザー名とパスワードの組み合わせが正しくありません',
                            style:
                                AppTheme.body3.copyWith(color: AppTheme.error),
                          ),
                        Container(
                          margin: EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 4.0, bottom: 4.0, left: 8.0, right: 8.0),
                            child: Input(
                              placeholder: "ユーザー名",
                              borderColor: bUserNameValid
                                  ? AppTheme.mainGrey
                                  : AppTheme.error,
                              onChanged: (value) {
                                setState(() {
                                  bUserNameValid = true;
                                  userName = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Input(
                              placeholder: "パスワード",
                              isPassword: true,
                              onChanged: (value) {
                                setState(() {
                                  password = value;
                                  bUserNameValid = true;
                                });
                              },
                            ),
                          ),
                        ),
                        // Container(
                        //   margin: EdgeInsets.only(left: 20.0, right: 20.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     children: [
                        //       Text("パスワードをお忘れですか？",
                        //           style: TextStyle(
                        //               color: AppTheme.black,
                        //               fontSize: 12,
                        //               fontFamily: 'OpenSans',
                        //               fontWeight: FontWeight.w200)),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Container(
                            margin: EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Button(
                              text: "ログイン",
                              onPressed: handleLogin,
                              borderRadius: 32.0,
                              backgroundColor: AppTheme.button,
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 30,
                        // ),
                        // SizedBox(
                        //   width: double.infinity,
                        //   child: Container(
                        //     margin: EdgeInsets.only(left: 20.0, right: 20.0),
                        //     child: Button(
                        //       text: "新規作成",
                        //       onPressed: handleRegister,
                        //       borderRadius: 32.0,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    ));
  }
}
