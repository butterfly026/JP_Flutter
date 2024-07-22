import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpg_flutter/app/controllers/auth_controller.dart';
import 'package:fpg_flutter/app/pages/main/main_home_controller.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/public/widgets/app_bar.dart';
import 'package:fpg_flutter/public/widgets/app_image.dart';
import 'package:fpg_flutter/utils/theme/app_colors.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
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
        appBar: CustomAppBar(
          titleSpacing: 0,
          backgroundColor: AppTheme.white,
          title: Obx(
            () {
              return Padding(
                padding: EdgeInsets.only(left: Dimens.gap_dp20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    // ignore: invalid_use_of_protected_member
                    _controller.bottomNavs
                        .value[_controller.currentTabIndex.value].name,
                    style: AppTheme.headline,
                  ),
                ),
              );
            },
          ),
          centerTitle: false,
        ),
        body: Obx(() => Center(
              child: _controller.getCurrentPage(),
            )),
        bottomNavigationBar: Obx(
          () => BottomAppBar(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 0.w),
            height: 110.h,
            color: const Color.fromARGB(255, 253, 253, 253),
            child: Column(children: <Widget>[
              Divider(
                height: Dimens.gap_dp1,
                color: AppTheme.mainLightGrey,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 18.h, bottom: 5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                      List.generate(_controller.bottomNavs.length, (index) {
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
                              width: 30.h,
                              height: 30.h,
                              color: _controller.currentTabIndex.value == index
                                  ? AppTheme.primary
                                  : AppTheme.black,
                            ),
                            Text(
                              nav.name,
                              style: TextStyle(
                                color:
                                    _controller.currentTabIndex.value == index
                                        ? AppTheme.primary
                                        : AppTheme.black,
                                fontSize: 18.sp,
                                fontFamily: 'NotoSansJP'
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
            ]),
          ),
        ));
  }
}
