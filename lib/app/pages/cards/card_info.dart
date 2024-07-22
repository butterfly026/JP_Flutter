
import 'package:flutter/material.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/public/define/request_info.dart';
import 'package:fpg_flutter/public/widgets/app_bar.dart';
import 'package:fpg_flutter/public/widgets/button.dart';
import 'package:fpg_flutter/public/widgets/text_info_title.dart';
import 'package:fpg_flutter/public/widgets/text_subtitle_value.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';

class CardInfoPage extends StatefulWidget {
  const CardInfoPage({super.key});

  @override
  CardInfoPageState createState() => CardInfoPageState();
}

class CardInfoPageState extends State<CardInfoPage>
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
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.white,
        body: Stack(children: [
          Column(
            children: [
              SubPageAppBar(
                titleText: '依頼内容',
              ),
              const Divider(
                height: 1,
                color: AppTheme.mainLightGrey,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(Dimens.gap_dp20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const TextInfoTitle(
                              title: '【依頼内容】', type: RequestInfo.SECTION_TITLE),
                          Padding(
                              padding: EdgeInsets.all(Dimens.gap_dp10),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const TextSubitleValue(
                                        title: '■依頼日時',
                                        value: '2024-03-03  14:00 ~ 15:00'),
                                    const TextSubitleValue(
                                      title: '■稼働時間',
                                      value: '1時間30分',
                                    ),
                                    const TextSubitleValue(
                                        title: '■報酬', value: '1500円'),
                                    const TextSubitleValue(
                                        title: '■依頼内容', value: '病院付き添い'),
                                    const TextSubitleValue(
                                        title: '■依頼者氏名', value: '山田太郎'),
                                    const TextSubitleValue(
                                        title: '■依頼者性別', value: '男性'),
                                    SizedBox(height: Dimens.gap_dp100),
                                  ])),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
              const Divider(
                height: 1,
                color: AppTheme.mainLightGrey,
              ),
              SizedBox(height: Dimens.gap_dp10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Button(
                  text: "報告",
                  onPressed: () {},
                  borderRadius: Dimens.gap_dp16,
                  paddingVertical: Dimens.gap_dp16,
                  paddingHorizontal: Dimens.gap_dp28,
                  minWidth: Dimens.gap_dp100 * 1.6,
                  backgroundColor: AppTheme.primary,
                  textColor: AppTheme.black,
                ),
                Button(
                  text: "チャット",
                  onPressed: () {},
                  borderRadius: Dimens.gap_dp16,
                  paddingVertical: Dimens.gap_dp16,
                  paddingHorizontal: Dimens.gap_dp28,
                  minWidth: Dimens.gap_dp100 * 1.6,
                  backgroundColor: AppTheme.buttonDisabledBack,
                  textColor: AppTheme.black,
                )
              ]),
              SizedBox(height: Dimens.gap_dp20),
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
