import 'package:flutter/material.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/public/models/business/request_list_data.dart';
import 'package:fpg_flutter/public/widgets/button.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';

class RequestItemView extends StatelessWidget {
  const RequestItemView(
      {Key? key,
      this.requestData,
      this.animationController,
      this.animation,
      this.onPressItem,
      this.onPressReport})
      : super(key: key);

  final VoidCallback? onPressItem;
  final VoidCallback? onPressReport;
  final RequestListData? requestData;
  final AnimationController? animationController;
  final Animation<double>? animation;
  Color getColorByReqStatus() {
    if (requestData != null) {
      switch (requestData!.status) {
        case '依頼確定':
          return AppTheme.success;
        case '募集中':
          return AppTheme.info;
        case '依頼拒否':
          return AppTheme.error;
        case '申請中':
          return AppTheme.primary;
        case '募集終了':
          return AppTheme.warning;
        default:
          return AppTheme.black;
      }
    }
    return AppTheme.black;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation!.value), 0.0),
            child: Padding(
              padding: EdgeInsets.only(
                  left: Dimens.gap_dp10,
                  right: Dimens.gap_dp10,
                  top: Dimens.gap_dp10,
                  bottom: Dimens.gap_dp20),
              child: InkWell(
                splashColor: Colors.white,
                onTap: onPressItem,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        // color: Colors.grey.withOpacity(0.6),
                        offset: Offset(Dimens.gap_dp4, Dimens.gap_dp4),
                        blurRadius: Dimens.gap_dp16,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 5.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1.0,
                                      color: getColorByReqStatus(),
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  child: Text(requestData!.status,
                                      textAlign: TextAlign.center,
                                      style: AppTheme.subtitle.copyWith(color: getColorByReqStatus())),
                                ),
                                if (requestData!.status == '依頼確定')
                                Button(
                                      text: "出発報告",
                                      onPressed: onPressReport,
                                      borderRadius: Dimens.gap_dp18,
                                      paddingHorizontal: Dimens.gap_dp28,
                                      paddingVertical: Dimens.gap_dp2,
                                      backgroundColor: Colors.black),
                              ],
                            ),
                            SizedBox(height: 16.0),
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Text('住所', style: AppTheme.subtitle),
                                ),
                                Expanded(
                                  child: Text(requestData!.request_user_address,
                                      style: AppTheme.body2),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.0),
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Text('所要時間', style: AppTheme.subtitle),
                                ),
                                Expanded(
                                  child: Text('${requestData!.worktime}時間',
                                      style: AppTheme.body2),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.0),
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Text('依頼内容', style: AppTheme.subtitle),
                                ),
                                Expanded(
                                  child: Text(requestData!.request_content,
                                      style: AppTheme.body2),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.0),
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Text('依頼者', style: AppTheme.subtitle),
                                ),
                                Expanded(
                                  child: Text(requestData!.request_user_gender,
                                      style: AppTheme.body2),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
