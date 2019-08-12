import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:progress_hud/progress_hud.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:we_rate_dogs/pages/fruit/moving_overlay.dart';
import 'package:we_rate_dogs/widget/ItemEffect.dart';
import 'package:we_rate_dogs/widget/list_animation_controller.dart';

import './detail_page.dart';

class MyPlateHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyPlateHomePage> {
  ScrollController _controller;
  Duration _duration;
  ListAnimationController _animationController;
  RefreshController _refreshController;
  int total = 20;
  int batch  = 40;
  int count = 0;
  GlobalKey _basketKey = GlobalKey();

  @override
  void initState() {
    _controller = ScrollController();
    _duration = Duration(milliseconds: 900);
    _animationController = ListAnimationController();
    _refreshController = RefreshController(initialRefresh: false);
    _controller.addListener(() {});

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
            backgroundColor: Color(0xFF21BFBD),
            appBar: new AppBar(
              backgroundColor: Color(0xFF21BFBD),
              elevation: 0.0,
              title: const Text('Fruit'),
              leading: new IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_ios),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.filter_list),
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () {},
                )
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: _buildBottomNavigationBar(),
            body: Stack(children: <Widget>[
              _buildWords(),
              _buildList(context),
            ])));
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.grey[50].withOpacity(0.5),
            Colors.grey.withOpacity(0.5)
          ])),
//      color: Colors.transparent,
      padding: EdgeInsets.only(bottom: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Material(
            color: Colors.transparent,
            child: Container(
                width: 40,
                height: 40,
                child: new RawMaterialButton(
                  onPressed: () {},
                  child: new Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 20.0,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0))),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(0),
                )),
          ),
          SizedBox(width: 10.0),
          Material(
            color: Colors.transparent,
            child: Container(
                key: _basketKey,
                width: 40,
                height: 40,
                child: new RawMaterialButton(
                  onPressed: () {},
                  child: Badge(
                    shape: BadgeShape.circle,
                    position: BadgePosition.topRight(top: -10, right: -10),
                    animationDuration: Duration(milliseconds: 300),
                    animationType: BadgeAnimationType.slide,
                    badgeContent: Text(
                      count.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    child: IconButton(
                        icon: Icon(Icons.shopping_cart), onPressed: () {}),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0))),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(0),
                )),
          ),
          SizedBox(width: 10.0),
          Material(
            color: Colors.transparent,
            child: Container(
                width: 120,
                height: 40,
                child: new RawMaterialButton(
                  onPressed: () {},
                  child: Text('Checkout',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 15.0)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0))),
                  elevation: 2.0,
                  fillColor: Colors.black,
                  padding: const EdgeInsets.all(0),
                )),
          )
        ],
      ),
    );
  }

  Widget _buildWords() {
    return new PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 34.0),
                  child: Row(
                    children: <Widget>[
                      Text('Healthy',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0)),
                      SizedBox(width: 10.0),
                      Text('Food',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 25.0))
                    ],
                  ))
            ],
          ),
        ));
  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    var hud = new ProgressHUD(
      backgroundColor: Colors.transparent,
      color: Colors.grey,
      containerColor: Colors.grey[50].withOpacity(0.9),
      borderRadius: 20.0,
      text: 'Loading...',
    );

    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Material(
            shadowColor: Colors.transparent,
            color: Colors.black,
            elevation: 0,
            type: MaterialType.transparency,
            child: Center(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              height: 100,
              width: 100,
              child: hud,
            )));
      },
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ),
          child: child,
        );
      },
    );
    await Future.delayed(Duration(milliseconds: 300));
    total = total + batch;
    _refreshController.loadComplete();
    Navigator.pop(context);
    if (mounted) setState(() {});
  }

  Widget _buildBackground() {
    return ListView(
      children: <Widget>[
        SizedBox(height: 44.0),
        Container(
          height: 30,
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
          ),
        )
      ],
    );
  }

  Widget _buildList(BuildContext buildContext) {
    return Padding(
        padding: EdgeInsets.only(top: 35),
        child: Container(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(45.0)),
              ),
              color: Colors.white,
            ),
            padding: EdgeInsets.only(left: 25),
            child: Column(
              children: <Widget>[
                Expanded(
                    child: SmartRefresher(
                        onRefresh: _onRefresh,
                        onLoading: _onLoading,
                        controller: _refreshController,
                        enablePullDown: true,
                        enablePullUp: true,
                        header: WaterDropMaterialHeader(
                          color: Colors.white,
                          backgroundColor: Color(0xFF21BFBD),
                        ),
                        child: ListView.builder(
                          controller: _controller,
                          itemCount: total,
                          itemBuilder: (context, index) {
                            if (index < 1) {
                              return Container(
                                height: 20,
                                color: Colors.transparent,
                              );
                            }
                            var result = new ItemEffect(
                              controller: _animationController,
                              indexedWidgetBuilder: (c, i) {
                                var pic = i % 6 + 1;
                                return _buildFoodItem(
                                    buildContext,
                                    "hero$i",
                                    'assets/plate/s$pic.jpg',
                                    'Salmon bowl$i',
                                    '\$24.00');
                              },
                              duration: _duration,
                              position: index,
                            );
//                    _listBloc.publish(index);
                            return result;
                          },
                        )))
              ],
            )));
  }

  Widget _warp(Widget w) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: w,
      actions: <Widget>[
        IconSlideAction(
          caption: 'Archive',
          color: Colors.blue,
          icon: Icons.archive,
          onTap: () => print("=1="),
        ),
        IconSlideAction(
          caption: 'Share',
          color: Colors.indigo,
          icon: Icons.share,
          onTap: () => print("=2="),
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'More',
          color: Colors.black45,
          icon: Icons.more_horiz,
          onTap: () => print("=3="),
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => print("=4="),
        ),
      ],
    );
  }

  Widget _buildFoodItem(BuildContext context, String heroTag, String imgPath,
      String foodName, String price) {
    GlobalKey btnKey = GlobalKey();
    return Material(
        elevation: 0,
        color: Colors.transparent,
        child: _warp(
          Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Container(
                child: InkWell(
                    borderRadius: new BorderRadius.circular(20.0),
                    radius: 400.0,
                    splashColor: Colors.blueAccent[80],
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsPage(
                              heroTag: heroTag,
                              image: imgPath,
                              foodName: foodName,
                              foodPrice: price)));
                    },
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Hero(
                              key: btnKey,
                              tag: heroTag,
                              child: Container(
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        new BoxShadow(
                                            color: Colors.blueGrey,
                                            blurRadius: 2,
                                            offset: Offset(1, 0.5))
                                      ]),
                                  child: new ClipRRect(
                                    child: Image(
                                        image: AssetImage(imgPath),
                                        fit: BoxFit.cover,
                                        height: 55.0,
                                        width: 55.0),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(27.5),
                                      topRight: Radius.circular(27.5),
                                      bottomLeft: Radius.circular(27.5),
                                      bottomRight: Radius.circular(27.5),
                                    ),
                                  ))),
                          SizedBox(width: 10.0),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(foodName,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold)),
                                Text(price,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 14.0,
                                        color: Colors.grey))
                              ]),
                          Expanded(child: SizedBox()),
                          IconButton(
                              icon: Icon(Icons.add),
                              color: Colors.black,
                              onPressed: () {
                                PopupMove move = PopupMove(target: _basketKey);
                                move.play(
                                    source: btnKey,
                                    item: MoveItem(
                                        moveCallback: (moveItem) {
                                          setState(() {
                                            count++;
                                          });
                                        },
                                        image: Container(
                                            decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                                boxShadow: [
                                                  new BoxShadow(
                                                      color: Colors.blueGrey,
                                                      blurRadius: 2,
                                                      offset: Offset(1, 0.5))
                                                ]),
                                            child: new ClipRRect(
                                              child: Image(
                                                  image: AssetImage(imgPath),
                                                  fit: BoxFit.cover,
                                                  height: 55.0,
                                                  width: 55.0),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(27.5),
                                                topRight: Radius.circular(27.5),
                                                bottomLeft:
                                                    Radius.circular(27.5),
                                                bottomRight:
                                                    Radius.circular(27.5),
                                              ),
                                            ))));
                              })
                        ])),
              )),
        ));
  }
}
