import 'package:flutter/material.dart';
import 'package:fpg_flutter/public/models/business/request_list_data.dart';
import 'package:fpg_flutter/public/widgets/button.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';

class RequestItemView extends StatelessWidget {
  const RequestItemView(
      {Key? key,
      this.requestData,
      this.animationController,
      this.animation,
      this.callback})
      : super(key: key);

  final VoidCallback? callback;
  final RequestListData? requestData;
  final AnimationController? animationController;
  final Animation<double>? animation;

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
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 16),
              child: InkWell(
                splashColor: Colors.white,
                onTap: callback,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        // color: Colors.grey.withOpacity(0.6),
                        offset: const Offset(4, 4),
                        blurRadius: 16,
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
                            if (requestData != null &&
                                requestData!.status == '依頼確定')
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1.0,
                                        color: AppTheme.success,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    child: Text(requestData!.status,
                                        textAlign: TextAlign.center,
                                        style:
                                            TextStyle(color: AppTheme.success)),
                                  ),
                                  Button(
                                      text: "出発報告",
                                      onPressed: () {
                                        print('pressed');
                                      },
                                      borderRadius: 8.0,
                                      backgroundColor: Colors.black),
                                ],
                              ),
                            if (requestData != null &&
                                requestData!.status == '募集中')
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1.0,
                                        color: AppTheme.info,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    child: Text(requestData!.status,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: AppTheme.info)),
                                  ),
                                ],
                              ),
                            if (requestData != null &&
                                requestData!.status == '依頼拒否')
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1.0,
                                        color: AppTheme.error,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    child: Text(requestData!.status,
                                        textAlign: TextAlign.center,
                                        style:
                                            TextStyle(color: AppTheme.error)),
                                  ),
                                ],
                              ),
                            if (requestData != null &&
                                requestData!.status == '申請中')
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1.0,
                                        color: AppTheme.primary,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    child: Text(requestData!.status,
                                        textAlign: TextAlign.center,
                                        style:
                                            TextStyle(color: AppTheme.primary)),
                                  ),
                                ],
                              ),
                            if (requestData != null &&
                                requestData!.status == '募集終了')
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1.0,
                                        color: AppTheme.warning,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    child: Text(requestData!.status,
                                        textAlign: TextAlign.center,
                                        style:
                                            TextStyle(color: AppTheme.warning)),
                                  ),
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
