import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpg_flutter/app/controllers/auth_controller.dart';
import 'package:fpg_flutter/app/pages/home/home_view_controller.dart';
import 'package:fpg_flutter/public/widgets/app_general_bar.dart';
import 'package:fpg_flutter/public/widgets/app_image.dart';
import 'package:fpg_flutter/public/widgets/app_notice_widget.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final AuthController authController = Get.find();
  final HomeViewController controller = Get.put(HomeViewController());

  final List<String> tabs = ["彩票", "真人", "棋牌", '电子', '体育', '捕鱼'];
  final List<GridItem> items = [
    GridItem(
        imageUrl:
            'https://wwwstatic01.fdgdggduydaa008aadsdf008.xyz/upload/t002/customise/picture/system/mobileIcon/7779a92e5b2161bfbe13ffe5dbf0efa2.jpeg?timeVersion=1702909220',
        label: 'PP电子'),
    GridItem(
        imageUrl:
            'https://wwwstatic01.fdgdggduydaa008aadsdf008.xyz/upload/t002/customise/picture/system/mobileIcon/7779a92e5b2161bfbe13ffe5dbf0efa2.jpeg?timeVersion=1702909220',
        label: 'AG电子'),
    GridItem(
        imageUrl:
            'https://wwwstatic01.fdgdggduydaa008aadsdf008.xyz/upload/t002/customise/picture/system/mobileIcon/7779a92e5b2161bfbe13ffe5dbf0efa2.jpeg?timeVersion=1702909220',
        label: 'BB电子'),
    // GridItem(imageUrl: 'https://example.com/path/to/image4.png', label: 'FG电子'),
    // GridItem(imageUrl: 'https://example.com/path/to/image5.png', label: 'PT电子'),
    // GridItem(imageUrl: 'https://example.com/path/to/image6.png', label: 'PG电子'),
    // GridItem(imageUrl: 'https://example.com/path/to/image7.png', label: 'PP电子'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppGeneralBar(
        titleWidget: Row(
          children: [
            AppImage.network(
              'https://images.7h79e5.com/upload/f058/customise/images/m_logo_2.jpg?v=1678795487',
              height: 50.w,
              width: 300.w,
              fit: BoxFit.fill,
            )
          ],
        ),
        actionWidgets: [
          AppImage.svgByAsset(
            'tabbar/iconwode.svg',
            width: 25.w,
            height: 25.w,
          ),
          Text(
            '登录',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            '注册',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Icon(
            Icons.menu,
            color: Colors.white,
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_1.jpg'),
            fit: BoxFit.cover, // Makes sure the image covers the whole area
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 280.w,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  autoPlay: true,
                ),
                items: controller.banners.value
                    .map((item) => Container(
                          child: Center(
                              child: AppImage.network(
                            item,
                            fit: BoxFit.cover,
                            height: 280.w,
                          )),
                        ))
                    .toList(),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10.w),
                color: Color(0xffB7CBDD),
                child: AppNoticeWidget(
                  title: controller.notice,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
                padding: EdgeInsets.symmetric(vertical: 20.w),
                decoration: BoxDecoration(
                    color: Color(0xffB7CBDD),
                    borderRadius: BorderRadius.circular(20.w)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: controller.homeGames.map((item) {
                    return Column(
                      children: [
                        AppImage.network(
                          item['icon'],
                          width: 50.w,
                          height: 50.w,
                        ),
                        Text(item['name']),
                      ],
                    );
                  }).toList(),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 120.w,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  autoPlay: true,
                ),
                items: controller.homeAds
                    .map((item) => Container(
                          child: Center(
                              child: AppImage.network(
                            item,
                            fit: BoxFit.cover,
                            height: 120.w,
                          )),
                        ))
                    .toList(),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
                padding: EdgeInsets.symmetric(vertical: 10.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffB7CBDD),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.w),
                    topRight: Radius.circular(20.w),
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(tabs.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            controller.selectedTabIndex.value = index;
                          },
                          child: Obx(
                            () => Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.w),
                              decoration:
                                  controller.selectedTabIndex.value == index
                                      ? const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                                color: Color(0xfff44600)),
                                          ),
                                        )
                                      : null,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.w, right: 10.w, bottom: 10.w),
                                    child: Text(
                                      '${tabs[index]}',
                                      style: TextStyle(
                                          color: controller
                                                      .selectedTabIndex.value ==
                                                  index
                                              ? Color(0xfff44600)
                                              : Color(0xFF000000),
                                          fontSize: 20.sp),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of columns
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    // mainAxisExtent: 110.w,
                    // childAspectRatio: 3, // Adjust the ratio to match your design
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return GridItemWidget(item: items[index]);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.card_giftcard,
                          size: 16,
                        ),
                        Text('优惠活动')
                      ],
                    ),
                    Row(
                      children: [Text('查看更多>>')],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.w),
                padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.w),
                decoration: BoxDecoration(
                  color: Color(0xffB7CBDD),
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: AppImage.network(
                    'https://wwwstatic02.fdgdggduydaa008aadsdf008.xyz/upload/t002/customise/images/mb_promote_44.jpg?v=1714538540',
                    width: double.infinity),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.w),
                padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.w),
                decoration: BoxDecoration(
                  color: Color(0xffB7CBDD),
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: AppImage.network(
                    'https://wwwstatic02.fdgdggduydaa008aadsdf008.xyz/upload/t002/customise/images/mb_promote_51.jpg?v=1716555150',
                    width: double.infinity),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.w),
                padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.w),
                decoration: BoxDecoration(
                  color: Color(0xffB7CBDD),
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: AppImage.network(
                    'https://wwwstatic02.fdgdggduydaa008aadsdf008.xyz/upload/t002/customise/images/mb_promote_51.jpg?v=1716555150',
                    width: double.infinity),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GridItem {
  final String imageUrl;
  final String label;

  GridItem({required this.imageUrl, required this.label});
}

class GridItemWidget extends StatelessWidget {
  final GridItem item;

  GridItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
        color: Color(0xffB7CBDD),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            item.imageUrl,
            width: 50.w,
            height: 50.w,
          ),
          SizedBox(width: 10.w),
          Text(item.label),
        ],
      ),
    );
  }
}
