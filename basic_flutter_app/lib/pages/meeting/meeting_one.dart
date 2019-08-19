import 'package:flutter/material.dart';

import 'bottom_navigation_bar.dart';
import 'meeting_chat.dart';

class MeetingOnePage extends StatefulWidget {
  @override
  _MeetingOnePageState createState() => _MeetingOnePageState();
}

const CURVE_HEIGHT = 160.0;
const AVATAR_RADIUS = CURVE_HEIGHT * 0.28;
const AVATAR_DIAMETER = AVATAR_RADIUS * 2;

class _MeetingOnePageState extends State<MeetingOnePage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool selected = false;
  PageController scrollController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    scrollController = new PageController(initialPage: 0);
    scrollController.addListener(() {
      int page = scrollController.page.round();
      if (page != currentPage) {
        setState(() {
          print("change status =====");
          currentPage = page;
        });
      }
    });
  }

  @override
  void dispose() {
    scrollController?.dispose();
    super.dispose();
  }

  Widget third() {
    return Padding(
      padding: EdgeInsets.only(left: 38),
      child: new Opacity(
        opacity: 0.87,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: new Border.all(width: 0.0, color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 24,
                    spreadRadius: 0,
                    color: Colors.black.withAlpha(10)),
              ]),
          height: 438,
          width: 296,
        ),
      ),
    );
  }

  Widget second() {
    return Padding(
      padding: EdgeInsets.only(left: 24, top: 15),
      child: new Opacity(
        opacity: 1,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: new Border.all(width: 0.0, color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 24,
                    spreadRadius: 0,
                    color: Colors.black.withAlpha(10)),
              ]),
          height: 414,
          width: 324,
        ),
      ),
    );
  }

  Widget first() {
    return Padding(
      padding: EdgeInsets.only(left: 17, top: 31),
      child: Container(
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                FractionallySizedBox(
                    widthFactor: 1,
                    child: Container(
                        height: 397,
                        child: Stack(
                          children: <Widget>[
                            PageView(
                              controller: scrollController,
                              physics: ClampingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Container(
                                    height: 397,
                                    width: 320,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/meeting/meeting1.png'),
                                      // ...
                                    ))),
                                Container(
                                    height: 397,
                                    width: 320,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/meeting/meeting1.png'),
                                    ))),
                                Container(
                                    height: 397,
                                    width: 320,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/meeting/meeting1.png'),
                                      // ...
                                    )))
                              ],
                            ),
                            Positioned(
                              top: 33,
                              left: (320 - 104) / 2,
                              child: Container(
                                width: 104,
                                height: 2,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      color: (currentPage == 0)
                                          ? Colors.white
                                          : Colors.grey.withOpacity(0.8),
                                      height: 2,
                                      width: 32,
                                    ),
                                    Container(
                                      color: (currentPage == 1)
                                          ? Colors.white
                                          : Colors.grey.withOpacity(0.8),
                                      height: 2,
                                      width: 32,
                                    ),
                                    Container(
                                      color: (currentPage == 2)
                                          ? Colors.white
                                          : Colors.grey.withOpacity(0.8),
                                      height: 2,
                                      width: 32,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ))),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text("Svetland Henderson, 21",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w700)),
                                Container(
                                  margin: EdgeInsets.only(left: 4),
                                  decoration: new BoxDecoration(
                                      color: Color.fromARGB(255, 204, 233, 240),
                                      shape: BoxShape.circle),
                                  padding: EdgeInsets.all(3),
                                  child: Icon(Icons.check,
                                      size: 15, color: Colors.white),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                Icon(Icons.location_on,
                                    size: 15, color: Colors.grey),
                                Text("Russian,Moscow (7km)",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300))
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 0.5,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 10),
                            Text("Cinema, Photo, Tattoo, Bicycle, Cooking",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300)),
                          ],
                        )))
              ],
            )),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            border: new Border.all(width: 0.1, color: Colors.transparent),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 24,
                  spreadRadius: 0,
                  color: Colors.black.withAlpha(10)),
            ]),
        height: 533,
        width: 345,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: CustomPaint(
        painter: MyPainter(),
        child: Scaffold(
            key: _scaffoldKey,
            endDrawer: new AppDrawer(),
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                color: Colors.black,
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back, color: Colors.black),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.filter_list),
                  color: Colors.black,
                  onPressed: () {
                    _scaffoldKey.currentState.openEndDrawer(); // right s
                  },
                ),
              ],
              title: Text('Meeting',
                  style: TextStyle(color: Colors.black, fontSize: 23)),
            ),
            bottomNavigationBar: MyBottom(),
            floatingActionButton: (selected)
                ? IgnorePointer()
                : new Floating(
                    onChoose: () {
                      setState(() {
                        this.selected = true;
                      });
                    },
                  ),
            body: Container(
              color: Colors.transparent,
              child: Center(
                  child: GestureDetector(
                child: Stack(
                    children: <Widget>[
                  third(),
                  second(),
                  first(),
                ]..add(selected
                        ? Padding(
                            padding: EdgeInsets.only(left: 17, top: 31),
                            child: Container(
                              child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Container(
                                    height: 397,
                                    width: 314,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          height: 90,
                                          width: 90,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 3)),
                                          child: Icon(
                                            Icons.done,
                                            color: Colors.white,
                                            size: 50,
                                          ),
                                        ),
                                        Container(
                                            padding: EdgeInsets.only(top: 20),
                                            child: Text("Congratulations!",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18))),
                                        Container(
                                            padding: EdgeInsets.only(
                                                top: 20, left: 15, right: 15),
                                            child: Text(
                                                "You can chat with Kristina according to your interests",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ))),
                                        SizedBox(height: 25),
                                        Material(
                                          color: Colors.transparent,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3)),
                                              color:
                                                  Colors.white.withOpacity(0.9),
                                            ),
                                            child: InkWell(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(3)),
                                                onTap: () => Navigator.of(
                                                        context)
                                                    .push(MaterialPageRoute(
                                                        builder: (_) =>
                                                            MeetingChatPage())),
//                                                  MeetingChatPage

                                                child: Center(
                                                  child: Text("Go to chat",
                                                      style: TextStyle(
                                                          fontSize: 16)),
                                                )),
                                            width: 157,
                                            height: 43,
                                          ),
                                        ),
                                      ],
                                    ),
                                    color: Color(0xFFFE5F63).withOpacity(0.9),
                                  )),
                            ))
                        : IgnorePointer())),
              )),
            )),
      ),
    );
  }
}

class Floating extends StatelessWidget {
  final VoidCallback onChoose;

  const Floating({
    Key key,
    this.onChoose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
            alignment: Alignment(-1.2, 0.1),
            child: Container(
              child: Material(
                color: Colors.transparent,
                shadowColor: const Color(0x44000000),
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: BorderRadius.all(Radius.circular(44)),
                  ),
                  width: 88,
                  height: 88,
                  child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(44)),
                      child: Align(
                        alignment: Alignment(0.0, 0.0),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      splashColor: const Color(0x44000000),
                      radius: 400.0,
                      onTap: () {
                        print("=========");
                      }),
                ),
              ),
            )),
        Align(
          alignment: Alignment(1.1, 0.1),
          child: Material(
            color: Colors.transparent,
            child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFE5F63).withOpacity(0.9),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(44),
                      bottomLeft: Radius.circular(44)),
                ),
                width: 90,
                height: 88,
                child: InkWell(
                  onTap: () {
                    if (this.onChoose != null) {
                      this.onChoose();
                    }

//                    print("======|| x===");
                  },
                  radius: 400,
                  child: Align(
                    alignment: Alignment(0.5, 0.0),
                    child: Icon(
                      Icons.done,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  splashColor: const Color(0x44000000),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(44),
                      bottomLeft: Radius.circular(44)),
                )),
          ),
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  final Paint lightBluePaint = Paint()
    ..color = Color.fromARGB(255, 240, 244, 248);
  final Paint bluePaint = Paint()..color = Colors.white;
  final TextPainter textPainter = TextPainter(
    textDirection: TextDirection.ltr,
  );

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromLTWH(55, -674, 1064, 1064);
    final Path smallWhite = Path()..addOval(rect);
    canvas.drawPath(smallWhite, lightBluePaint);

    var rect2 = Rect.fromLTWH(304, -73, 177, 177);
    final Path smallWhite2 = Path()..addOval(rect2);
    canvas.drawPath(smallWhite2, bluePaint);

    var rect3 = Rect.fromLTWH(-661, 406, 1032, 1032);
    final Path bottom = Path()..addOval(rect3);
    canvas.drawPath(bottom, lightBluePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => new _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  Color active = Color(0xFFFE5F63);
  RangeValues _values = RangeValues(0.3, 0.7);

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
        width: MediaQuery.of(context).size.width * 0.85, //20.0,
        child: Drawer(
          elevation: 12,
          child: new ListView(
            children: <Widget>[
              Container(
                  height: 800.0,
                  child: new Container(
                      padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            new Text("Filter", style: TextStyle(fontSize: 23)),
                            Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 30),
                              child: new Text("Who are you looking for?",
                                  style: TextStyle(fontSize: 18)),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  height: 43,
                                  width: 138,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(2)),
                                      border: Border.all(
                                          color: Colors.grey, width: 0.5)),
                                  child: Center(
                                    child: Text("Man",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black)),
                                  ),
                                ),
                                Container(
                                  height: 43,
                                  width: 138,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(2)),
                                      color: active,
                                      border: Border.all(
                                          color: Colors.transparent)),
                                  child: Center(
                                    child: Text("Woman",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white)),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            new Container(
//                              padding: EdgeInsets.only(top: 30),
                              color: Colors.grey,
                              height: 0.5,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            new Text("Interests",
                                style: TextStyle(fontSize: 23)),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  height: 43,
                                  width: 85,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(2)),
                                      color: active,
                                      border: Border.all(
                                          color: Colors.transparent)),
                                  child: Center(
                                    child: Text("Cinema",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white)),
                                  ),
                                ),
                                Container(
                                  height: 43,
                                  width: 85,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(2)),
                                      color: active,
                                      border: Border.all(
                                          color: Colors.transparent)),
                                  child: Center(
                                    child: Text("Bowling",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white)),
                                  ),
                                ),
                                Container(
                                  height: 43,
                                  width: 85,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(2)),
                                      color: active,
                                      border: Border.all(
                                          color: Colors.transparent)),
                                  child: Center(
                                    child: Text("Tattoo",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  height: 43,
                                  width: 85,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(2)),
                                      color: active,
                                      border: Border.all(
                                          color: Colors.transparent)),
                                  child: Center(
                                    child: Text("Billiards",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white)),
                                  ),
                                ),
                                Container(
                                  height: 43,
                                  width: 135,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(2)),
                                      color: active,
                                      border: Border.all(
                                          color: Colors.transparent)),
                                  child: Center(
                                    child: Text("To drink coffee",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 320,
                              padding: EdgeInsets.only(
                                top: 15,
                                bottom: 15,
                                left: 30,
                                right: 30,
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey, width: 0.5)),
                              child:
                                  Center(child: Text("Choose other interests")),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            IntrinsicHeight(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: Text("Distance",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20)),
                                      ),
                                    ),
                                    Expanded(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Icon(Icons.location_on,
                                            size: 12, color: Colors.grey),
                                        Text("15 km",
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 14))
                                      ],
                                    )),
                                  ]),
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            SliderTheme(
                              data: SliderThemeData(
                                  rangeThumbShape: _CustomRangeThumbShape(),
                                  inactiveTrackColor: Colors.grey
                                  // ...
                                  ),
                              child: RangeSlider(
                                values: _values,
                                activeColor: active,
                                onChanged: (RangeValues values) {
                                  setState(() {
                                    _values = values;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            IntrinsicHeight(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: Text("Distance",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20)),
                                      ),
                                    ),
                                    Expanded(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Icon(Icons.location_on,
                                            size: 12, color: Colors.grey),
                                        Text("15 km",
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 14))
                                      ],
                                    )),
                                  ]),
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            SliderTheme(
                              data: SliderThemeData(
                                  rangeThumbShape: _CustomRangeThumbShape(),
                                  inactiveTrackColor: Colors.grey
                                  // ...
                                  ),
                              child: RangeSlider(
                                values: _values,
                                activeColor: active,
                                onChanged: (RangeValues values) {
                                  setState(() {
                                    _values = values;
                                  });
                                },
                              ),
                            )
                          ]))),
            ],
          ),
        ));
  }
}

class _CustomRangeThumbShape extends RangeSliderThumbShape {
  static const double _thumbSize = 4.0;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) =>
      Size(_thumbSize, _thumbSize);

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    @required Animation<double> activationAnimation,
    @required Animation<double> enableAnimation,
    bool isDiscrete = false,
    bool isEnabled = false,
    bool isOnTop,
    @required SliderThemeData sliderTheme,
    TextDirection textDirection,
    Thumb thumb,
  }) {
    final Canvas canvas = context.canvas;
    final Paint lightBluePaint = Paint()
      ..color = Color(0xFFFE5F63).withOpacity(0.5);
    canvas.drawCircle(center, 29 / 2, lightBluePaint);

    final Paint white = Paint()..color = Colors.white;
    canvas.drawCircle(center, 27 / 2, white);
    final Paint cen = Paint()..color = Color(0xFFFE5F63);
    canvas.drawCircle(center, 13 / 2, cen);

//    Path thumbPath;
//    switch (textDirection) {
//      case TextDirection.rtl:
//        switch (thumb) {
//          case Thumb.start:
//            thumbPath = _rightTriangle(_thumbSize, center);
//            break;
//          case Thumb.end:
//            thumbPath = _leftTriangle(_thumbSize, center);
//            break;
//        }
//        break;
//      case TextDirection.ltr:
//        switch (thumb) {
//          case Thumb.start:
//            thumbPath = _leftTriangle(_thumbSize, center);
//            break;
//          case Thumb.end:
//            thumbPath = _rightTriangle(_thumbSize, center);
//            break;
//        }
//        break;
//    }
//    canvas.drawPath(thumbPath, Paint()
//      ..color = sliderTheme.thumbColor);
  }
}

Path _rightTriangle(double size, Offset thumbCenter, {bool invert = false}) {
  final Path thumbPath = Path();
  final double halfSize = size / 2.0;
  final double sign = invert ? -1.0 : 1.0;
  thumbPath.moveTo(thumbCenter.dx + halfSize * sign, thumbCenter.dy);
  thumbPath.lineTo(thumbCenter.dx - halfSize * sign, thumbCenter.dy - size);
  thumbPath.lineTo(thumbCenter.dx - halfSize * sign, thumbCenter.dy + size);
  thumbPath.close();
  return thumbPath;
}

Path _leftTriangle(double size, Offset thumbCenter) =>
    _rightTriangle(size, thumbCenter, invert: true);
