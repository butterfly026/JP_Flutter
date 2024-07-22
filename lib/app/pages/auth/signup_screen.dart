import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fpg_flutter/public/router/router.dart';
import 'package:fpg_flutter/public/widgets/button.dart';
import 'package:fpg_flutter/public/widgets/input.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SignUpPage(),
        ),
      ),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State createState() => RegisterScreenState();
}

class RegisterScreenState extends State<SignUpPage> {
  String userName = '';
  String password = '';

  Future handleRegister() async {
    Get.toNamed(AppRouter.profileEdit);
    // Navigator.push<dynamic>(
    //   context,
    //   MaterialPageRoute<dynamic>(
    //     builder: (BuildContext context) => new Register(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/logo.png',
                          // width: 168.0,
                          // height: 168.0,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 4.0, bottom: 4.0, left: 8.0, right: 8.0),
                      child: Input(
                        placeholder: "ユーザー名 (半角英数字で6字以上20字以内)",
                        isPassword: true,
                        onChanged: (value) {
                          setState(() {
                            userName = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Input(
                        placeholder: "パスワード (半角英数字で8字以上20字以内)",
                        isPassword: true,
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.offNamed(AppRouter.login);
                          },
                          child: const Text("ログインはこちら",
                              style: TextStyle(
                                  color: AppTheme.black,
                                  fontSize: 12,
                                  fontFamily: 'NotoSansJP',
                                  fontWeight: FontWeight.w200)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Button(
                        text: "新規作成",
                        onPressed: handleRegister,
                        borderRadius: 32.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
