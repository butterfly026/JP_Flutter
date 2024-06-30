import 'package:flutter/material.dart';
import 'package:fpg_flutter/app/pages/business/components/request_item_view.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/public/config/images.dart';
import 'package:fpg_flutter/public/models/business/request_list_data.dart';
import 'package:fpg_flutter/public/router/router.dart';
import 'package:fpg_flutter/public/tools/ugLog.dart';
import 'package:fpg_flutter/public/widgets/app_bar.dart';
import 'package:fpg_flutter/public/widgets/app_general_bar.dart';
import 'package:fpg_flutter/public/widgets/dropdown.dart';
import 'package:fpg_flutter/public/widgets/image.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:get/get.dart';

class RequestListPage extends StatefulWidget {
  const RequestListPage({super.key});

  @override
  _RequestListPageState createState() => _RequestListPageState();
}

class _RequestListPageState extends State<RequestListPage>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  List<RequestListData> requestList = RequestListData.requestList;
  List<RequestListData> filteredList = [];
  final ScrollController _scrollController = ScrollController();
  String? selected = 'すべて';

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    filteredList = requestList;
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppTheme.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CustomDropdownMenu(
                      items: [
                        'すべて',
                        '募集中',
                        '申請中',
                        '依頼確定',
                        '依頼拒否',
                        '募集終了',
                      ],
                      selectedItem: 'すべて',
                      onChanged: (value) {
                        setState(() {
                          selected = value;
                          if (value == 'すべて') {
                            filteredList = requestList;
                          } else {
                            filteredList = requestList
                                .where((item) => item.status == value)
                                .toList();
                          }
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  // child: NestedScrollView(
                  //   controller: _scrollController,
                  //   headerSliverBuilder:
                  //       (BuildContext context, bool innerBoxIsScrolled) {
                  //     return <Widget>[
                  //       SliverList(
                  //         delegate: SliverChildBuilderDelegate(
                  //             (BuildContext context, int index) {
                  //           return Column(
                  //             children: <Widget>[Text('Header')],
                  //           );
                  //         }, childCount: 1),
                  //       ),
                  //       // SliverPersistentHeader(
                  //       //   pinned: true,
                  //       //   floating: true,
                  //       //   delegate: ContestTabHeader(Text('Persist header')),
                  //       // ),
                  //     ];
                  //   },
                  // child: SingleChildScrollView(
                  //   controller: _scrollController,
                  child: Container(
                    color: AppTheme.white,
                    child: ListView.builder(
                      itemCount: filteredList.length,
                      padding: const EdgeInsets.only(top: 8),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        final int count =
                            filteredList.length > 5 ? 5 : filteredList.length;
                        final Animation<double> animation =
                            Tween<double>(begin: 0.0, end: 1.0).animate(
                                CurvedAnimation(
                                    parent: animationController!,
                                    curve: Interval((1 / count) * index, 1.0,
                                        curve: Curves.fastOutSlowIn)));
                        animationController?.forward();
                        return RequestItemView(
                          callback: () {
                            Get.toNamed(AppRouter.requestDetail,
                                parameters: {'index': index.toString()});
                          },
                          requestData: filteredList[index],
                          animation: animation,
                          animationController: animationController!,
                        );
                      },
                    ),
                  ),
                  // ),
                )
              ],
            ),
          ),
        ));
  }

  // Widget getListUI() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: HotelAppTheme.buildLightTheme().dialogBackgroundColor,
  //       boxShadow: <BoxShadow>[
  //         BoxShadow(
  //             color: Colors.grey.withOpacity(0.2),
  //             offset: const Offset(0, -2),
  //             blurRadius: 8.0),
  //       ],
  //     ),
  //     child: Column(
  //       children: <Widget>[
  //         Container(
  //           height: MediaQuery.of(context).size.height - 156 - 50,
  //           child: FutureBuilder<bool>(
  //             future: getData(),
  //             builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
  //               if (!snapshot.hasData) {
  //                 return const SizedBox();
  //               } else {
  //                 return ListView.builder(
  //                   itemCount: hotelList.length,
  //                   scrollDirection: Axis.vertical,
  //                   itemBuilder: (BuildContext context, int index) {
  //                     final int count =
  //                         hotelList.length > 10 ? 10 : hotelList.length;
  //                     final Animation<double> animation =
  //                         Tween<double>(begin: 0.0, end: 1.0).animate(
  //                             CurvedAnimation(
  //                                 parent: animationController!,
  //                                 curve: Interval((1 / count) * index, 1.0,
  //                                     curve: Curves.fastOutSlowIn)));
  //                     animationController?.forward();

  //                     return HotelListView(
  //                       callback: () {},
  //                       hotelData: hotelList[index],
  //                       animation: animation,
  //                       animationController: animationController!,
  //                     );
  //                   },
  //                 );
  //               }
  //             },
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Widget getHotelViewList() {
  //   final List<Widget> hotelListViews = <Widget>[];
  //   for (int i = 0; i < hotelList.length; i++) {
  //     final int count = hotelList.length;
  //     final Animation<double> animation =
  //         Tween<double>(begin: 0.0, end: 1.0).animate(
  //       CurvedAnimation(
  //         parent: animationController!,
  //         curve: Interval((1 / count) * i, 1.0, curve: Curves.fastOutSlowIn),
  //       ),
  //     );
  //     hotelListViews.add(
  //       HotelListView(
  //         callback: () {},
  //         hotelData: hotelList[i],
  //         animation: animation,
  //         animationController: animationController!,
  //       ),
  //     );
  //   }
  //   animationController?.forward();
  //   return Column(
  //     children: hotelListViews,
  //   );
  // }

  // Widget getTimeDateUI() {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 18, bottom: 16),
  //     child: Row(
  //       children: <Widget>[
  //         Expanded(
  //           child: Row(
  //             children: <Widget>[
  //               Material(
  //                 color: Colors.transparent,
  //                 child: InkWell(
  //                   focusColor: Colors.transparent,
  //                   highlightColor: Colors.transparent,
  //                   hoverColor: Colors.transparent,
  //                   splashColor: Colors.grey.withOpacity(0.2),
  //                   borderRadius: const BorderRadius.all(
  //                     Radius.circular(4.0),
  //                   ),
  //                   onTap: () {
  //                     FocusScope.of(context).requestFocus(FocusNode());
  //                     // setState(() {
  //                     //   isDatePopupOpen = true;
  //                     // });
  //                     showDemoDialog(context: context);
  //                   },
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(
  //                         left: 8, right: 8, top: 4, bottom: 4),
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: <Widget>[
  //                         Text(
  //                           'Choose date',
  //                           style: TextStyle(
  //                               fontWeight: FontWeight.w100,
  //                               fontSize: 16,
  //                               color: Colors.grey.withOpacity(0.8)),
  //                         ),
  //                         const SizedBox(
  //                           height: 8,
  //                         ),
  //                         Text(
  //                           '${DateFormat("dd, MMM").format(startDate)} - ${DateFormat("dd, MMM").format(endDate)}',
  //                           style: TextStyle(
  //                             fontWeight: FontWeight.w100,
  //                             fontSize: 16,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.only(right: 8),
  //           child: Container(
  //             width: 1,
  //             height: 42,
  //             color: Colors.grey.withOpacity(0.8),
  //           ),
  //         ),
  //         Expanded(
  //           child: Row(
  //             children: <Widget>[
  //               Material(
  //                 color: Colors.transparent,
  //                 child: InkWell(
  //                   focusColor: Colors.transparent,
  //                   highlightColor: Colors.transparent,
  //                   hoverColor: Colors.transparent,
  //                   splashColor: Colors.grey.withOpacity(0.2),
  //                   borderRadius: const BorderRadius.all(
  //                     Radius.circular(4.0),
  //                   ),
  //                   onTap: () {
  //                     FocusScope.of(context).requestFocus(FocusNode());
  //                   },
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(
  //                         left: 8, right: 8, top: 4, bottom: 4),
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: <Widget>[
  //                         Text(
  //                           'Number of Rooms',
  //                           style: TextStyle(
  //                               fontWeight: FontWeight.w100,
  //                               fontSize: 16,
  //                               color: Colors.grey.withOpacity(0.8)),
  //                         ),
  //                         const SizedBox(
  //                           height: 8,
  //                         ),
  //                         Text(
  //                           '1 Room - 2 Adults',
  //                           style: TextStyle(
  //                             fontWeight: FontWeight.w100,
  //                             fontSize: 16,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget getSearchBarUI() {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
  //     child: Row(
  //       children: <Widget>[
  //         Expanded(
  //           child: Padding(
  //             padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
  //             child: Container(
  //               decoration: BoxDecoration(
  //                 color: HotelAppTheme.buildLightTheme().dialogBackgroundColor,
  //                 borderRadius: const BorderRadius.all(
  //                   Radius.circular(38.0),
  //                 ),
  //                 boxShadow: <BoxShadow>[
  //                   BoxShadow(
  //                       color: Colors.grey.withOpacity(0.2),
  //                       offset: const Offset(0, 2),
  //                       blurRadius: 8.0),
  //                 ],
  //               ),
  //               child: Padding(
  //                 padding: const EdgeInsets.only(
  //                     left: 16, right: 16, top: 4, bottom: 4),
  //                 child: TextField(
  //                   onChanged: (String txt) {},
  //                   style: const TextStyle(
  //                     fontSize: 18,
  //                   ),
  //                   cursorColor: HotelAppTheme.buildLightTheme().primaryColor,
  //                   decoration: InputDecoration(
  //                     border: InputBorder.none,
  //                     hintText: 'London...',
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //         Container(
  //           decoration: BoxDecoration(
  //             color: HotelAppTheme.buildLightTheme().primaryColor,
  //             borderRadius: const BorderRadius.all(
  //               Radius.circular(38.0),
  //             ),
  //             boxShadow: <BoxShadow>[
  //               BoxShadow(
  //                   color: Colors.grey.withOpacity(0.4),
  //                   offset: const Offset(0, 2),
  //                   blurRadius: 8.0),
  //             ],
  //           ),
  //           child: Material(
  //             color: Colors.transparent,
  //             child: InkWell(
  //               borderRadius: const BorderRadius.all(
  //                 Radius.circular(32.0),
  //               ),
  //               onTap: () {
  //                 FocusScope.of(context).requestFocus(FocusNode());
  //               },
  //               child: Padding(
  //                 padding: const EdgeInsets.all(16.0),
  //                 child: Icon(FontAwesomeIcons.magnifyingGlass,
  //                     size: 20,
  //                     color: HotelAppTheme.buildLightTheme()
  //                         .dialogBackgroundColor),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget getFilterBarUI() {
  //   return Stack(
  //     children: <Widget>[
  //       Positioned(
  //         top: 0,
  //         left: 0,
  //         right: 0,
  //         child: Container(
  //           height: 24,
  //           decoration: BoxDecoration(
  //             color: HotelAppTheme.buildLightTheme().dialogBackgroundColor,
  //             boxShadow: <BoxShadow>[
  //               BoxShadow(
  //                   color: Colors.grey.withOpacity(0.2),
  //                   offset: const Offset(0, -2),
  //                   blurRadius: 8.0),
  //             ],
  //           ),
  //         ),
  //       ),
  //       Container(
  //         color: HotelAppTheme.buildLightTheme().dialogBackgroundColor,
  //         child: Padding(
  //           padding:
  //               const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
  //           child: Row(
  //             children: <Widget>[
  //               Expanded(
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: Text(
  //                     '530 hotels found',
  //                     style: TextStyle(
  //                       fontWeight: FontWeight.w100,
  //                       fontSize: 16,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               Material(
  //                 color: Colors.transparent,
  //                 child: InkWell(
  //                   focusColor: Colors.transparent,
  //                   highlightColor: Colors.transparent,
  //                   hoverColor: Colors.transparent,
  //                   splashColor: Colors.grey.withOpacity(0.2),
  //                   borderRadius: const BorderRadius.all(
  //                     Radius.circular(4.0),
  //                   ),
  //                   onTap: () {
  //                     FocusScope.of(context).requestFocus(FocusNode());
  //                     Navigator.push<dynamic>(
  //                       context,
  //                       MaterialPageRoute<dynamic>(
  //                           builder: (BuildContext context) => FiltersScreen(),
  //                           fullscreenDialog: true),
  //                     );
  //                   },
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(left: 8),
  //                     child: Row(
  //                       children: <Widget>[
  //                         Text(
  //                           'Filter',
  //                           style: TextStyle(
  //                             fontWeight: FontWeight.w100,
  //                             fontSize: 16,
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: const EdgeInsets.all(8.0),
  //                           child: Icon(Icons.sort,
  //                               color: HotelAppTheme.buildLightTheme()
  //                                   .primaryColor),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //       const Positioned(
  //         top: 0,
  //         left: 0,
  //         right: 0,
  //         child: Divider(
  //           height: 1,
  //         ),
  //       )
  //     ],
  //   );
  // }

  // void showDemoDialog({BuildContext? context}) {
  //   showDialog<dynamic>(
  //     context: context!,
  //     builder: (BuildContext context) => CalendarPopupView(
  //       barrierDismissible: true,
  //       minimumDate: DateTime.now(),
  //       //  maximumDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 10),
  //       initialEndDate: endDate,
  //       initialStartDate: startDate,
  //       onApplyClick: (DateTime startData, DateTime endData) {
  //         setState(() {
  //           startDate = startData;
  //           endDate = endData;
  //         });
  //       },
  //       onCancelClick: () {},
  //     ),
  //   );
  // }

  // Widget getAppBarUI() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: HotelAppTheme.buildLightTheme().dialogBackgroundColor,
  //       boxShadow: <BoxShadow>[
  //         BoxShadow(
  //             color: Colors.grey.withOpacity(0.2),
  //             offset: const Offset(0, 2),
  //             blurRadius: 8.0),
  //       ],
  //     ),
  //     child: Padding(
  //       padding: EdgeInsets.only(
  //           top: MediaQuery.of(context).padding.top, left: 8, right: 8),
  //       child: Row(
  //         children: <Widget>[
  //           Container(
  //             alignment: Alignment.centerLeft,
  //             width: AppBar().preferredSize.height + 40,
  //             height: AppBar().preferredSize.height,
  //             child: Material(
  //               color: Colors.transparent,
  //               child: InkWell(
  //                 borderRadius: const BorderRadius.all(
  //                   Radius.circular(32.0),
  //                 ),
  //                 onTap: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: Icon(Icons.arrow_back),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           Expanded(
  //             child: Center(
  //               child: Text(
  //                 'Explore',
  //                 style: TextStyle(
  //                   fontWeight: FontWeight.w600,
  //                   fontSize: 22,
  //                 ),
  //               ),
  //             ),
  //           ),
  //           Container(
  //             width: AppBar().preferredSize.height + 40,
  //             height: AppBar().preferredSize.height,
  //             child: Row(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               mainAxisAlignment: MainAxisAlignment.end,
  //               children: <Widget>[
  //                 Material(
  //                   color: Colors.transparent,
  //                   child: InkWell(
  //                     borderRadius: const BorderRadius.all(
  //                       Radius.circular(32.0),
  //                     ),
  //                     onTap: () {},
  //                     child: Padding(
  //                       padding: const EdgeInsets.all(8.0),
  //                       child: Icon(Icons.favorite_border),
  //                     ),
  //                   ),
  //                 ),
  //                 Material(
  //                   color: Colors.transparent,
  //                   child: InkWell(
  //                     borderRadius: const BorderRadius.all(
  //                       Radius.circular(32.0),
  //                     ),
  //                     onTap: () {},
  //                     child: Padding(
  //                       padding: const EdgeInsets.all(8.0),
  //                       child: Icon(FontAwesomeIcons.locationDot),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

class ContestTabHeader extends SliverPersistentHeaderDelegate {
  ContestTabHeader(
    this.searchUI,
  );
  final Widget searchUI;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return searchUI;
  }

  @override
  double get maxExtent => 52.0;

  @override
  double get minExtent => 52.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
