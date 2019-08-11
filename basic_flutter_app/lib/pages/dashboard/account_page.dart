import 'package:flutter/material.dart';
import 'package:we_rate_dogs/widget/non_scroolable_page_view.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  ScrollController _scrollController;
  MyPageController _pageController;
  MyPageController _headerPageController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: 0);
    _pageController = MyPageController();
    _headerPageController = MyPageController();
    _pageController.addListener(() {
      _headerPageController.animateTo(
          _headerPageController.position.viewportDimension *
              _pageController.page,
          duration: Duration(milliseconds: 1),
          curve: Curves.decelerate);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
    _headerPageController.dispose();
    super.dispose();
  }

  Widget control() {
    return Container(
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Material(
                color: Colors.transparent,
                child: new InkResponse(
                  child: new Container(
                    width: 40.0,
                    height: 40.0,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white70,
                      size: 15,
                    ),
                  ),
                  onTap: () async {
                    _pageController.animateToPage(
                        _pageController.page.round() - 1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.decelerate);


//                    _headerPageController.animateToPage(
//                        _headerPageController.page.round() - 1,
//                        duration: Duration(milliseconds: 500),
//                        curve: Curves.decelerate);

                    //                  });
                  },
                  //点击或者toch控件高亮时显示的颜色在控件上层,水波纹下层
                  highlightColor: Colors.black12,
                  //点击或者touch控件高亮的shape形状
                  highlightShape: BoxShape.rectangle,
                  //shape圆角半径
                  borderRadius: new BorderRadius.circular(20.0),
                  //ripple水波纹半径
                  radius: 150.0,
                  //true表示要裁剪水波纹响应的边界,false就是不裁剪
                  //如果控件是圆角的,不裁剪的话,水波纹出来的最终填充出来的效果是矩形
                  containedInkWell: true,
                  //水波纹颜色
                  splashColor: Colors.black12,
                )), //
            //                  color: Colors.green,
            Container(
              width: 200,
              child: MyPageView(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                controller: _headerPageController,
                children: <Widget>[
                  Center(
                    child: Text("Classic",
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  ),
                  Center(
                    child: Text("Popular",
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  ),
                  Center(
                    child: Text("Premium",
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  )
                ],
              ),
            ),

            Material(
                color: Colors.transparent,
                child: new InkResponse(
                  child: new Container(
                    width: 40.0,
                    height: 40.0,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white70,
                      size: 15,
                    ),
                  ),
                  onTap: () {
                    _pageController.animateToPage(
                        _pageController.page.round() + 1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                  },
                  //点击或者toch控件高亮时显示的颜色在控件上层,水波纹下层
                  highlightColor: Colors.black12,
                  //点击或者touch控件高亮的shape形状
                  highlightShape: BoxShape.rectangle,

                  //shape圆角半径
                  borderRadius: new BorderRadius.circular(20.0),
                  //ripple水波纹半径
                  radius: 150.0,
                  //true表示要裁剪水波纹响应的边界,false就是不裁剪
                  //如果控件是圆角的,不裁剪的话,水波纹出来的最终填充出来的效果是矩形
                  containedInkWell: true,
                  //水波纹颜色
                  splashColor: Colors.black12,
                )),
          ],
        ));
  }

  Widget content() {
    return Container(
        width: 100,
        child: Row(
          children: <Widget>[
            Baseline(
              baseline: 0,
              baselineType: TextBaseline.alphabetic,
              child: new Text(
                r'$',
                style: new TextStyle(
                  fontSize: 14,
                  color: Colors.white54,
                  textBaseline: TextBaseline.alphabetic,
                ),
              ),
            ),
            Baseline(
              baseline: 15.0,
              baselineType: TextBaseline.alphabetic,
              child: new Text(
                '37',
                style: new TextStyle(
                  fontSize: 28,
                  color: Colors.white54,
                  textBaseline: TextBaseline.alphabetic,
                ),
              ),
            ),
            Baseline(
              baseline: 13.0,
              baselineType: TextBaseline.alphabetic,
              child: new Text(
                '/week',
                style: new TextStyle(
                  fontSize: 10,
                  color: Colors.white54,
                  textBaseline: TextBaseline.alphabetic,
                ),
              ),
            ),
          ],
        ));
  }

  Widget topArea() {
    var result = Material(
        type: MaterialType.canvas,
        color: Colors.white,
        child: Card(
            margin:
                EdgeInsets.only(left: 12.5, top: 10, right: 12.5, bottom: 10.0),
            elevation: 6.0,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.blue, Colors.red])),
              padding: EdgeInsets.all(5.0),
              child: Column(children: <Widget>[
                control(),
                Container(
                  height: 81,
                  child: MyPageView(
                    pageSnapping: true,
                    controller: _pageController,
                    children: <Widget>[
                      Container(
                        height: 81,
                        padding: EdgeInsets.all(10),
                        child: Center(child: content()),
                      ),
                      Container(
                        height: 81,
                        color: Colors.transparent,
                        child: Center(child: content()),
                      ),
                      Container(
                        height: 81,
                        color: Colors.transparent,
                        child: Center(child: content()),
                      ),
                    ],
                  ),
                ),
              ]),
            )));

//    _pageController.position.addListener(() {
//      print(_pageController.page);
//    });

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.canvas,
      color: Colors.white,
      child: CustomScrollView(
          // controller: scrollController,
          slivers: [
            SliverAppBar(
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                )
              ],
              expandedHeight: 170.0,
              backgroundColor: Colors.red,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Accounts'),
                background: SizedBox.expand(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Image.asset('assets/shoes1.png'),
                      Container(color: Colors.black26)
                    ],
                  ),
                ),
              ),
              elevation: 2.0,
              forceElevated: true,
              pinned: true,
              floating: true,
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                topArea(),
              ),
              pinned: true,
            ),
            new SliverList(
              delegate: new SliverChildListDelegate(
                new List.generate(
                    30,
                    (int index) => accountItems("Trevello App $index",
                        r"+ $ 4,946.00", "28-04-16", "credit")),
              ),
            )
          ]),
      // _buildFab(),
    );
  }

  Widget accountItems(
          String item, String charge, String dateString, String type) =>
      Material(
          type: MaterialType.transparency,
          //color: Colors.white,
          child: Card(
              elevation: 8.0,
              //    color: Colors.white,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(item, style: TextStyle(fontSize: 16.0)),
                          Text(charge, style: TextStyle(fontSize: 16.0))
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(dateString,
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 14.0)),
                          Text(type,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14.0))
                        ],
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  print("---tapped");
                },
              )));
}
//)));
//}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => 151;

  @override
  double get maxExtent => 151;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
      color: Colors.white,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
