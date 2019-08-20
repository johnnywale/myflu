import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_rate_dogs/widget/non_scroolable_page_view.dart';

class FoodAppHomePage extends StatefulWidget {
  @override
  _FoodAppHomePageState createState() => _FoodAppHomePageState();
}

class _FoodAppHomePageState extends State<FoodAppHomePage> {
  MyPageController _pageController;
  MyPageScrollPhysics pageScrollPhysics;
  int total = 20;
  int batch = 40;
  int count = 0;
  GlobalKey _basketKey = GlobalKey();
  double ratio = 0.8;
  double currentPage = 0.0;



  @override
  void initState() {
    double fraction = 259 / 378;
    print("fraction $fraction");
    _pageController = new MyPageController(
        initialPage: 0, viewportFraction: fraction, leadingOffset: 42.5);
    pageScrollPhysics = new MyPageScrollPhysics();
    _pageController.addListener(() {
      int cPage = _pageController.page.toInt();
      double diff = _pageController.page - cPage;
      double currentRatio = 0.2 * diff + 0.8;
      setState(() {
        currentPage = _pageController.page;
        print("set status...currentPage $currentPage");

        ratio = currentRatio;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget slideOne() {
    return LayoutBuilder(builder: (context, constrains) {
      print("first ${constrains.maxWidth} || ${constrains.minWidth}");
      return Container(
          alignment: Alignment.centerLeft,
          height: 401,
          width: 259,
          child: Column(
            children: <Widget>[
              Stack(alignment: Alignment.topRight, children: [
                Container(
                    height: 401,
                    width: 259,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                        gradient: LinearGradient(
                            begin: Alignment(-1.0, -1.0),
                            end: Alignment(0.2, 1.1),
                            colors: [
                              Color.fromARGB(255, 255, 176, 132),
                              Color.fromARGB(255, 255, 115, 71),
                            ]))),
                Container(
                  height: 323,
                  width: 259,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32)),
                      image: DecorationImage(
                          alignment: Alignment.topCenter,
                          image: AssetImage("assets/food_app/slide0.jpg"))),
                ),
                Container(
                  height: 401,
                  width: 259,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      gradient: LinearGradient(
                          begin: Alignment(-1.0, -1.0),
                          end: Alignment(0.2, 1.1),
                          colors: [
                            Color.fromARGB(255, 255, 213, 128).withAlpha(52),
                            Color.fromARGB(255, 255, 178, 117).withAlpha(0),
                            Color.fromARGB(0, 250, 150, 108).withAlpha(0),
                            Color.fromARGB(255, 255, 133, 77),
                            Color.fromARGB(255, 255, 121, 73)
                          ])),
                  child: Container(
                    padding: EdgeInsets.only(top: 303, left: 23),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: 24,
                              width: 58,
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Center(
                                child: Text(
                                  "Receipe",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 231, 138, 85),
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Container(
//                              color: Colors.pink,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                      width: 20,
                                      //color: Colors.grey,
                                      child: IconButton(
                                        onPressed: () {
                                          print("=1==");
                                        },
                                        icon: Icon(
                                          Icons.phonelink_ring,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      )),
                                  Container(
                                      width: 34,
                                      //color: Colors.grey,
                                      child: IconButton(
                                        onPressed: () {
                                          print("=2==");
                                        },
                                        icon: Icon(Icons.arrow_back_ios,
                                            color: Colors.white, size: 13),
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 48,
                          child: Text(
                            "Sed do eiusmod tempor incididunt ut labore",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ])
            ],
          ));
    });
  }

  Widget second(index) {
    double diff = currentPage - index;
    bool beMax = diff >= 0.0;
    bool beMin = diff <= -1;
    print("my index is $index diff is diff $diff");

    double drawRadio = ratio;
    if (beMax) {
      drawRadio = 1.0;
    } else if (beMin) {
      drawRadio = 0.8;
    } else {
      drawRadio = ratio;
    }

    return LayoutBuilder(builder: (context, constrains) {
//      print(
//          "second ==current ratio is $drawRadio ,  ${constrains.maxWidth} || ${constrains.minWidth}");
      return Container(
          //    color: Colors.pink,
          padding: EdgeInsets.only(
              top: 401 * (1 - drawRadio), right: constrains.maxWidth - 259),
          height: 401 * drawRadio,
          width: 259 * drawRadio,
          child: Stack(alignment: Alignment.topRight, children: [
            Container(
                height: 401 * drawRadio,
                width: 259 * drawRadio,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                    gradient: LinearGradient(
                        begin: Alignment(-1.0, -1.0),
                        end: Alignment(0.2, 1.1),
                        colors: [
                          Color.fromARGB(255, 255, 242, 200),
                          Color.fromARGB(255, 255, 236, 168),
                        ]))),
            Container(
              height: 323 * drawRadio,
              width: 259,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      image: AssetImage("assets/food_app/slide1.jpg"))),
            ),
            Container(
                height: 401 * drawRadio,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                    gradient: LinearGradient(
                        begin: Alignment(-0.6, -1.0),
                        end: Alignment(-0.6, 1.0),
                        colors: [
                          Color.fromARGB(255, 255, 242, 200),
                          Color.fromARGB(255, 255, 241, 191).withAlpha(0),
                          Color.fromARGB(255, 255, 239, 184).withAlpha(0),
                          Color.fromARGB(255, 255, 238, 179),
                          Color.fromARGB(255, 255, 236, 168)
                        ])))
          ]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
      child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniStartTop,
          floatingActionButton: Container(
              child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios),
          )),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 42.5),
                child: Center(
                    child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Recipes",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    Icon(Icons.dehaze)
                  ],
                )),
              ),
              Container(
                  margin: EdgeInsets.only(top: 60),
                  child: Container(
                    height: 401,
                    child: MyPageView.builder(
                      controller: _pageController,
                      physics: pageScrollPhysics,
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return slideOne();
                        } else {
                          return second(index);
                        }
                      },
                    ),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 20, left: 42.5, right: 42.5),
                  height: 18.5,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 18.5,
                        child: Image.asset("assets/food_app/hand.png"),
                      ),
                      Text("  Popular",
                          style: TextStyle(
                              color: Color(0xffffab82), fontSize: 17)),
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(top: 20, left: 42.5, right: 42.5),
                height: 115,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xffA8AEC9).withAlpha(14),
                          offset: Offset(0, 4),
                          blurRadius: 6)
                    ]),
              )
            ],
          )),
    ));
  }
}
