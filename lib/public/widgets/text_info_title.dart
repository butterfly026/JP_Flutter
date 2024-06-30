import 'package:flutter/material.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/public/define/request_info.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';


class TextInfoTitle extends StatelessWidget {
  final String title;
  final int type;
  final void Function()? onTap;
  const TextInfoTitle({super.key, this.title = '', this.onTap = _defaultOnTap, this.type=RequestInfo.SUB_TITLE});

  static void _defaultOnTap() {
    // Function body
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(top: Dimens.gap_dp20, left: type == RequestInfo.SECTION_TITLE ? Dimens.gap_dp10 : Dimens.gap_dp20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(type == RequestInfo.SECTION_TITLE ? '【$title】' : '■$title' , style: AppTheme.body2),
          ],
        ),
      ),
    );
  }
}
