import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppNoticeWidget extends StatelessWidget {
  const AppNoticeWidget({super.key, this.title = ""});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.volume_up,
          size: 20,
        ),
        SizedBox(
          width: 10.w,
        ),
        Text('$title'),
      ],
    );
  }
}
