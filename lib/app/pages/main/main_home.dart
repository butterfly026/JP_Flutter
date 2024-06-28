import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpg_flutter/app/controllers/auth_controller.dart';
import 'package:fpg_flutter/app/pages/main/main_home_controller.dart';
import 'package:fpg_flutter/public/tools/app_tool.dart';
import 'package:fpg_flutter/public/widgets/app_image.dart';
import 'package:fpg_flutter/utils/theme/app_colors.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  final AuthController authController = Get.find();
  final int curIndex;

  @override
  State<StatefulWidget> createState() => _MainPageState();

  MainPage({super.key, this.curIndex = 0});
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  final _controller = Get.put(MainHomeController());


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _controller.currentTabIndex.value = widget.curIndex;
  }

  @override
  Widget build(BuildContext context) {
    final appThemeColor = Theme.of(context).extension<AppColors>();
    return Scaffold(
      body: Obx(() => Center(
            child: _controller.getCurrentPage(),
          )),
      bottomNavigationBar: Obx(
        () => BottomAppBar(
          padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 0.w),
          height: 90.w,
          color: Color(0xffC5CBC6),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(_controller.bottomNavs.length, (index) {
                var nav = _controller.bottomNavs[index];
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _controller.currentTabIndex.value = index;
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppImage.svgByAsset(
                          'tabbar/${nav.icon}.svg',
                          width: 30.w,
                          height: 30.w,
                          color: _controller.currentTabIndex.value == index
                              ? Color(0xff0277BD)
                              : Color(0xffffffff),
                        ),
                        Text(
                          '${nav.name}',
                          style: TextStyle(
                            color: _controller.currentTabIndex.value == index
                                ? Color(0xff0277BD)
                                : Color(0xffffffff),
                            fontSize: 22.sp,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
