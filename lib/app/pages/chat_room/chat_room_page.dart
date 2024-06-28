import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpg_flutter/public/widgets/app_general_bar.dart';
import 'package:fpg_flutter/public/widgets/app_image.dart';

class ChatRoomPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<String> tabs = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppGeneralBar(
        leading: Row(children: [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
        ]),
        titleWidget: Center(
            child: Text(
          'title',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_1.jpg'),
            fit: BoxFit.cover, // Makes sure the image covers the whole area
          ),
        ),
        child: Column(
          children: [
            TabBar(
              onTap: (index) {},
              controller: _tabController,
              isScrollable: true,
              physics: const ClampingScrollPhysics(),
              indicatorSize: TabBarIndicatorSize.label,
              // dividerColor: AppColors.xffE7E7E7(),
              indicator: null,
              tabs: [
                Tab(text: '网址'),
                Tab(text: '担保'),
                Tab(text: '担保'),
                Tab(text: '担保平台'),
                Tab(text: '担保平台'),
              ],
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppImage.svgByAsset('empty.svg'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppImage.svgByAsset('empty.svg'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppImage.svgByAsset('empty.svg'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppImage.svgByAsset('empty.svg'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppImage.svgByAsset('empty.svg'),
                  ],
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
