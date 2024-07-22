import 'package:flutter/material.dart';
import 'package:fpg_flutter/public/models/notice.dart';

class NoticeItemView extends StatelessWidget {
  const NoticeItemView(
      {super.key,
      this.noticeData,
      this.animationController,
      this.animation,
      this.onPressItem});

  final VoidCallback? onPressItem;
  final Notice? noticeData;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      onTap: onPressItem,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [Text(noticeData?.title ?? '')]),
            ),
          ),
        ),
      ),
    );
  }
}
