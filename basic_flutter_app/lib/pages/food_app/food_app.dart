import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:we_rate_dogs/widget/list_animation_controller.dart';

import 'home_page.dart';

class FoodAppPage extends StatefulWidget {
  @override
  _FoodAppPageState createState() => _FoodAppPageState();
}

class _FoodAppPageState extends State<FoodAppPage> {
  ScrollController _controller;
  Duration _duration;
  ListAnimationController _animationController;
  RefreshController _refreshController;
  int total = 20;
  int batch = 40;
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
            backgroundColor: Colors.white,
//            appBar: new AppBar(
//              backgroundColor: Color(0xFF21BFBD),
//              elevation: 0.0,
//              title: const Text('Fruit'),
//              leading: new IconButton(
//                onPressed: () => Navigator.of(context).pop(),
//                icon: const Icon(Icons.arrow_back_ios),
//              ),
////              actions: <Widget>[
////                IconButton(
////                  icon: Icon(Icons.filter_list),
////                  color: Colors.white,
////                  onPressed: () {},
////                ),
////                IconButton(
////                  icon: Icon(Icons.menu),
////                  color: Colors.white,
////                  onPressed: () {},
////                )
//              // ],
//            ),
            floatingActionButtonLocation:
            FloatingActionButtonLocation.miniStartTop,
            floatingActionButton: Padding(
                padding: EdgeInsets.only(top: 100),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back_ios),
                )),
            body: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 2,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset("assets/food_app/ic-onboarding.png"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.5),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 2,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        width: 270,
                        child: Text(
                          "Sed do eiusmod tempor incididunt ut labore",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        width: 270,
                        child: Text(
                          "At vero eos et et iusto odio dignissimos",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        width: 310,
                        height: 133,
                        child: Column(
                          children: <Widget>[
                            Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, 11),
                                          blurRadius: 14,
                                          color:
                                          Color(0xffA8AEC9).withAlpha(11))
                                    ],
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: <Color>[
                                        Color(0xFFF6915C),
                                        Color(0xFFf37552),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(26.5))),
                                child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FoodAppHomePage()));
                                          print("========");
                                        },
                                        splashColor:
                                        Colors.black.withOpacity(0.1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(26.5)),
                                        child: Container(
                                            height: 50,
                                            child: Center(
                                              child: Text('Sign Up',
                                                  style: TextStyle(
                                                      fontSize: 21,
                                                      color: Colors.white)),
                                            ))))),
                            Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(top: 11),
                                decoration: BoxDecoration(
                                    color: Colors.white,
//                                    border: Border.all(
//                                        color: Colors.white, width: 1),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, 9),
                                          blurRadius: 14,
                                          color:
                                          Color(0xffA8AEC9).withAlpha(40))
                                    ],
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(26.5))),
                                child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                        onTap: () {
                                          print("========");
                                        },
                                        splashColor: Color(0xffA8AEC9),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(26.5)),
                                        child: Container(
                                            height: 50,
                                            child: Center(
                                              child: Text('Login',
                                                  style: TextStyle(
                                                      fontSize: 21,
                                                      color: Colors.black)),
                                            )))))
//                            Container(
//                                width: double.infinity,
//                                decoration: BoxDecoration(
//                                    gradient: LinearGradient(
//                                      colors: <Color>[
//                                        Color(0xFFF6915C),
//                                        Color(0xFFf37552),
//                                      ],
//                                    ),
//                                    borderRadius: BorderRadius.all(
//                                        Radius.circular(40.0))),
//                                child: Material(
//                                    color: Colors.transparent,
//                                    child: InkWell(
//                                        onTap: () {
//                                          print("========");
//                                        },
//                                        splashColor:
//                                            Colors.black.withOpacity(0.1),
//                                        borderRadius: BorderRadius.all(
//                                            Radius.circular(80.0)),
//                                        child: Container(
//                                            height: 50,
//                                            child: Center(
//                                              child: Text('Sign Up',
//                                                  style: TextStyle(
//                                                      fontSize: 20,
//                                                      color: Colors.white)),
//                                            ))))),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],

//              color: Colors.pink,
            )));
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
}
