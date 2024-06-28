import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpg_flutter/public/widgets/app_image.dart';

class HuntingView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HuntingViewState();
}

class _HuntingViewState extends State<HuntingView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color(0xff609AC5),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TabBar(
                onTap: (index) {},
                controller: _tabController,
                isScrollable: false,
                // labelStyle: AppStyles.primaryText_(fontSize: 26),
                // unselectedLabelStyle: AppStyles.xff000000_(fontSize: 26),

                physics: const ClampingScrollPhysics(),
                indicatorSize: TabBarIndicatorSize.label,
                // dividerColor: AppColors.xffE7E7E7(),
                indicator: null,
                tabs: [
                  Tab(text: '网址大全'),
                  Tab(text: '担保平台'),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(controller: _tabController, children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // Number of columns
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  // mainAxisExtent: 110.w,
                  // childAspectRatio: 3, // Adjust the ratio to match your design
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.network(
                          'https://wwwstatic05.fdgdggduydaa008aadsdf008.xyz/upload/t002/photo/1119Z5X3W82CW04WSS000GK.png'),
                      SizedBox(
                        height: 10.w,
                      ),
                      Text('118图库'),
                    ],
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.w, horizontal: 20.w),
              child: Column(
                children: [
                  Image.network(
                      'https://wwwstatic05.fdgdggduydaa008aadsdf008.xyz/upload/t002/photo/1119Z5X53PJ5OG8C4O88WK4.jpeg'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('100彩票'),
                      Container(
                        child: Text('点击访问'),
                      )
                    ],
                  )
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
