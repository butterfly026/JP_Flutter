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
          // AppImage.svgByAsset(
          //   'tabbar/iconwode.svg',
          //   width: 25.w,
          //   height: 25.w,
          // ),
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
