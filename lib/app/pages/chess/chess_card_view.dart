import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpg_flutter/public/widgets/app_general_bar.dart';

class ChessCardView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChessCardViewState();
}

class _ChessCardViewState extends State<ChessCardView> {
  final List<GridItem> items = [
    GridItem(
        imageUrl:
            'https://wwwstatic05.fdgdggduydaa008aadsdf008.xyz/upload/t002/photo/1119Z5X3W82CW04WSS000GK.png',
        title: '天游棋牌',
        subtitle: '立即游戏'),
    GridItem(
        imageUrl:
            'https://wwwstatic05.fdgdggduydaa008aadsdf008.xyz/upload/t002/photo/1119Z5X3W82CW04WSS000GK.png',
        title: 'LEG乐游棋牌',
        subtitle: '立即游戏'),
    GridItem(
        imageUrl:
            'https://wwwstatic05.fdgdggduydaa008aadsdf008.xyz/upload/t002/photo/1119Z5X3W82CW04WSS000GK.png',
        title: '幸运棋牌',
        subtitle: '立即游戏'),
    GridItem(
        imageUrl:
            'https://wwwstatic05.fdgdggduydaa008aadsdf008.xyz/upload/t002/photo/1119Z5X3W82CW04WSS000GK.png',
        title: '美博棋牌',
        subtitle: '立即游戏'),
    GridItem(
        imageUrl:
            'https://wwwstatic05.fdgdggduydaa008aadsdf008.xyz/upload/t002/photo/1119Z5X3W82CW04WSS000GK.png',
        title: 'KX棋牌',
        subtitle: '立即游戏'),
    GridItem(
        imageUrl:
            'https://wwwstatic05.fdgdggduydaa008aadsdf008.xyz/upload/t002/photo/1119Z5X3W82CW04WSS000GK.png',
        title: '欢乐棋牌',
        subtitle: '立即游戏'),
    GridItem(
        imageUrl:
            'https://wwwstatic05.fdgdggduydaa008aadsdf008.xyz/upload/t002/photo/1119Z5X3W82CW04WSS000GK.png',
        title: 'VG棋牌',
        subtitle: '立即游戏'),
    GridItem(
        imageUrl:
            'https://wwwstatic05.fdgdggduydaa008aadsdf008.xyz/upload/t002/photo/1119Z5X3W82CW04WSS000GK.png',
        title: 'DB棋牌',
        subtitle: '立即游戏'),
    GridItem(
        imageUrl:
            'https://wwwstatic05.fdgdggduydaa008aadsdf008.xyz/upload/t002/photo/1119Z5X3W82CW04WSS000GK.png',
        title: '新世界棋牌',
        subtitle: '立即游戏'),
    GridItem(
        imageUrl:
            'https://wwwstatic05.fdgdggduydaa008aadsdf008.xyz/upload/t002/photo/1119Z5X3W82CW04WSS000GK.png',
        title: '博乐棋牌',
        subtitle: '立即游戏'),
    GridItem(
        imageUrl:
            'https://wwwstatic05.fdgdggduydaa008aadsdf008.xyz/upload/t002/photo/1119Z5X3W82CW04WSS000GK.png',
        title: '双赢棋牌',
        subtitle: '立即游戏'),
    GridItem(
        imageUrl:
            'https://wwwstatic05.fdgdggduydaa008aadsdf008.xyz/upload/t002/photo/1119Z5X3W82CW04WSS000GK.png',
        title: '百胜棋牌',
        subtitle: '立即游戏'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppGeneralBar(
        leading: Row(children: [
          Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          Text(
            'back',
            style: TextStyle(color: Colors.white),
          )
        ]),
        titleWidget: Center(
            child: Text(
          'title',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 3, // Adjust the ratio to match your design
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GridItemWidget(item: items[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class GridItem {
  final String imageUrl;
  final String title;
  final String subtitle;

  GridItem(
      {required this.imageUrl, required this.title, required this.subtitle});
}

class GridItemWidget extends StatelessWidget {
  final GridItem item;

  GridItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          SizedBox(width: 10.w),
          Image.network(
            item.imageUrl,
            width: 50,
            height: 50,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                item.subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
