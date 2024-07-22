

import 'package:flutter/material.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/public/define/request_info.dart';
import 'package:fpg_flutter/public/widgets/app_bar.dart';
import 'package:fpg_flutter/public/widgets/button.dart';
import 'package:fpg_flutter/public/widgets/text_info_title.dart';
import 'package:fpg_flutter/public/widgets/top_labeled_textfield.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';

class AuthSettingsPage extends StatefulWidget {
  const AuthSettingsPage({super.key});

  @override
  _AuthSettingsPageState createState() => _AuthSettingsPageState();
}

class _AuthSettingsPageState extends State<AuthSettingsPage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // int curIndex = int.tryParse(Get.parameters['index'] ?? '') ?? 0;
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.white,
        body: Stack(children: [
          Column(
            children: [
              SubPageAppBar(
                titleText: 'アカウント設定',
              ),
              const Divider(
                height: 1,
                color: AppTheme.mainLightGrey,
              ),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(Dimens.gap_dp20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextInfoTitle(
                                title: 'アカウント情報',
                                type: RequestInfo.SECTION_TITLE),
                            const TopLabeledTextField(label: 'メールアドレス', value: ''),
                            const TopLabeledTextField(
                                label: '新しいパスワード', value: '', isPassword: true),
                            const TopLabeledTextField(
                                label: '新しいパスワードを再入力',
                                value: '',
                                isPassword: true),
                            Expanded(
                                child: Column(
                              children: [
                                Spacer(),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Dimens.gap_dp60),
                                        child: Button(
                                          text: "更新",
                                          onPressed: () {},
                                          borderRadius: 16.0,
                                          backgroundColor: Colors.black,
                                          minWidth: 200.0,
                                        ))),
                                SizedBox(height: Dimens.gap_dp50)
                              ],
                            ))
                          ])))
            ],
          )
        ]));
  }
}

class ContestTabHeader extends SliverPersistentHeaderDelegate {
  ContestTabHeader(
    this.searchUI,
  );
  final Widget searchUI;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return searchUI;
  }

  @override
  double get maxExtent => 52.0;

  @override
  double get minExtent => 52.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
