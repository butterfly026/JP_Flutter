import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpg_flutter/public/widgets/app_general_bar.dart';
import 'package:fpg_flutter/public/widgets/app_image.dart';
import 'package:fpg_flutter/public/widgets/app_notice_widget.dart';

class InformationView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InformationViewState();
}

class _InformationViewState extends State<InformationView> {
  final List<String> images = [
    'https://wwwstatic04.fdgdggduydaa008aadsdf008.xyz/upload/t002/customise/images/m_banner_2.jpg?v=1702477340',
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
            ),
            Text('title')
          ],
        ),
        actionWidgets: [
          // AppImage.svgByAsset(
          //   'tabbar/iconwode.svg',
          //   width: 25.w,
          //   height: 25.w,
          // ),
          Icon(
            Icons.menu,
            color: Colors.white,
          )
        ],
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 300.w,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              autoPlay: true,
            ),
            items: images
                .map((item) => Container(
                      child: Center(
                          child: AppImage.network(
                        item,
                        fit: BoxFit.cover,
                        height: 300.w,
                      )),
                    ))
                .toList(),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10.w),
            color: Color(0xffB7CBDD),
            child: AppNoticeWidget(
              title: "notice",
            ),
          ),
          SizedBox(
            height: 10.w,
          ),
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Column(
              children: [],
            ),
          ),
          Expanded(
              child: GridView.builder(
            shrinkWrap: true,
            // physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0,
              childAspectRatio: 3,
              // mainAxisExtent: 110.w,
              // childAspectRatio: 3, // Adjust the ratio to match your design
            ),
            itemCount: 22,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(8.0),
                    // border: Border.all(color: Colors.grey),
                    border: Border(
                        bottom: BorderSide(color: Colors.grey),
                        right: BorderSide(color: Colors.grey))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppImage.network(
                      '',
                      width: 50,
                      height: 50,
                    ),
                    // SizedBox(width: 10),
                    Text(
                      'label',
                      style: TextStyle(color: Color(0xff659DC7)),
                    ),
                  ],
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
