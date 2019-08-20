import 'package:flutter/material.dart';
import 'package:we_rate_dogs/pages/meeting/sidebar.dart';

import 'bottom_navigation_bar.dart';
import 'drawer.dart';
import 'floating_btn.dart';
import 'meeting_profile_first.dart';
import 'meeting_profile_overlay.dart';
import 'meeting_profile_second.dart';

class SizeController {
  double top = 0;
  double topSecond;
  double topFirst = 32;
  double ratio = 313 / 397;
  double widthSecond;
  double widthFirst;
  double resize = 1.0;
  BoxConstraints _boxConstraints;

  void init() {
    double ratio = 345.0 / 533.0;

    var padding = 16 * 2;
    var width = _boxConstraints.maxWidth - padding;
    var height = _boxConstraints.maxHeight - padding;
    if (width > height * ratio) {
      width = height * ratio;
    } else {
      height = width / ratio;
    }
    resize = width / 345.0;
    print("resize $resize");
  }

  SizeController(BoxConstraints boxConstraints) {
    this._boxConstraints = boxConstraints;
    init();
  }
}

class MeetingOnePage extends StatefulWidget {
  @override
  _MeetingOnePageState createState() => _MeetingOnePageState();
}

class _MeetingOnePageState extends State<MeetingOnePage>
    with TickerProviderStateMixin {
  var _scaffoldKey = new GlobalKey<MyDrawerControllerState>();
  var _meetingSecondLayerKey = new GlobalKey<MeetingSecondLayerState>();
  var _meetingFirstLayerKey = new GlobalKey<MeetingFirstLayerState>();
  var _meetingMaskKey = new GlobalKey<MeetingProfileMaskState>();
  var _floatingState = new GlobalKey<FloatingState>();
  Widget _child;
  bool selected = false;
  int currentPeople = 0;

  OverlayEntry _drawerEntry;
  List<String> images = [
    "assets/meeting/meeting1.png",
    "assets/meeting/meeting2.png",
    "assets/meeting/meeting3.png"
  ];

  @override
  void didUpdateWidget(MeetingOnePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final ModalRoute<dynamic> route = ModalRoute.of(context);

    if (mounted) {
//      print("drawerEntry ${_drawerEntry}");
//      try {
//        _drawerEntry?.remove();
//      } catch (e) {
//        print(e.toString());
//      }
      if (_drawerEntry == null) {
        _drawerEntry = OverlayEntry(builder: (context) {
          return buildDrawer(route);
        });
        final overlay = Overlay.of(context);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            overlay.insert(_drawerEntry);
          }
        });
      }
    }
  }

  @override
  void dispose() {
    _rejectAnimationController?.dispose();
    _agreeAnimationController?.dispose();
    try {
      _drawerEntry?.remove();
      print("remove entry");
    } catch (e) {
      print(e.toString());
    }
    _drawerEntry = null;
    super.dispose();
  }

  AnimationController _rejectAnimationController;
  AnimationController _agreeAnimationController;

  Animation<double> agreeBtnMoveToCenter;
  Animation<double> agreeBtnRadius;
  Animation<double> agreeMaskColor;
  Animation<double> agreeShowPercentage;

  Animation<double> agreeBtnHeight;
  Animation<double> congratulationFaction;
  Animation<double> descFaction;
  Animation<double> goChatFaction;

  Animation<double> rejectBtnMoveToCenter;
  Animation<double> rejectBtnRadius;
  Animation<double> rejectMaskColor;
  Animation<double> rejectDisappear;
  Animation<double> rejectBtnHeight;

  @override
  void initState() {
    super.initState();
    _rejectAnimationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _agreeAnimationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    rejectBtnRadius =
        new Tween(begin: 0.0, end: 1.0).animate(new CurvedAnimation(
          parent: _rejectAnimationController,
          curve: new Interval(
            0.0,
            0.2,
            curve: Curves.fastLinearToSlowEaseIn,
          ),
        ));

    rejectBtnMoveToCenter =
        new Tween(begin: 0.0, end: 1.0).animate(new CurvedAnimation(
          parent: _rejectAnimationController,
          curve: new Interval(
            0.0,
            0.5,
            curve: Curves.fastLinearToSlowEaseIn,
          ),
        ));

    rejectMaskColor =
        new Tween(begin: 0.0, end: 1.0).animate(new CurvedAnimation(
          parent: _rejectAnimationController,
          curve: new Interval(
            0.05,
            0.4,
            curve: Curves.linear,
          ),
        ));

    rejectBtnHeight =
        new Tween(begin: 0.0, end: 1.0).animate(new CurvedAnimation(
          parent: _rejectAnimationController,
          curve: new Interval(
            0.4,
            0.7,
            curve: Curves.linearToEaseOut,
          ),
        ));

    rejectDisappear =
        new Tween(begin: 0.0, end: 1.0).animate(new CurvedAnimation(
          parent: _rejectAnimationController,
          curve: new Interval(
            0.4,
            1.0,
            curve: Curves.linear,
          ),
        ));

    double rate = 1.4;

    agreeBtnRadius =
        new Tween(begin: 0.0, end: 1.0).animate(new CurvedAnimation(
          parent: _agreeAnimationController,
          curve: new Interval(
            0.0,
            0.2 / rate,
            curve: Curves.fastLinearToSlowEaseIn,
          ),
        ));

    agreeBtnMoveToCenter =
        new Tween(begin: 0.0, end: 1.0).animate(new CurvedAnimation(
          parent: _agreeAnimationController,
          curve: new Interval(
            0.0 / rate,
            0.4 / rate,
            curve: Curves.fastLinearToSlowEaseIn,
          ),
        ));

    agreeMaskColor =
        new Tween(begin: 0.0, end: 1.0).animate(new CurvedAnimation(
          parent: _agreeAnimationController,
          curve: new Interval(
            0.05 / rate,
            0.4 / rate,
            curve: Curves.linear,
          ),
        ));

    agreeShowPercentage =
        new Tween(begin: 0.0, end: 1.0).animate(new CurvedAnimation(
          parent: _agreeAnimationController,
          curve: new Interval(
            0.4 / rate,
            1.0 / rate,
            curve: Curves.linear,
          ),
        ));

    agreeBtnHeight =
        new Tween(begin: 0.0, end: 0.2).animate(new CurvedAnimation(
            parent: _agreeAnimationController,
            curve: new Interval(
              1.0 / rate,
              1.2 / rate,
              curve: Curves.linear,
            )));

    congratulationFaction =
        new Tween(begin: 3.0, end: 0.0).animate(new CurvedAnimation(
            parent: _agreeAnimationController,
            curve: new Interval(
              1.1 / rate,
              1.25 / rate,
              curve: Curves.linear,
            )));

    descFaction = new Tween(begin: 3.0, end: 0.0).animate(new CurvedAnimation(
        parent: _agreeAnimationController,
        curve: new Interval(
          1.2 / rate,
          1.35 / rate,
          curve: Curves.linear,
        )));

    goChatFaction = new Tween(begin: 3.0, end: 0.0).animate(new CurvedAnimation(
        parent: _agreeAnimationController,
        curve: new Interval(
          1.3 / rate,
          1.4 / rate,
          curve: Curves.linear,
        )));

    _rejectAnimationController.addListener(() {
      if (_rejectAnimationController.status == AnimationStatus.completed) {
        currentPeople++;
        _meetingSecondLayerKey.currentState.setNextImage(getSecondImage());
        _meetingFirstLayerKey.currentState.setNextImage(getFirstImage());
        _meetingMaskKey.currentState.reset();
        _floatingState.currentState.resetReject();
      } else {
        _meetingSecondLayerKey.currentState
            .setPercentage(rejectDisappear.value);
        _meetingFirstLayerKey.currentState.setPercentage(rejectDisappear.value);
        _meetingMaskKey.currentState.setChanges(
          agreePercentage: agreeMaskColor.value,
          rejectPercentage: rejectMaskColor.value,
          chatFaction: goChatFaction.value,
          congratulationFaction: congratulationFaction.value,
          descFaction: descFaction.value,
          rejectOpacityFaction: rejectDisappear.value,
        );
        _floatingState.currentState.setChanges(
            agreeBtnRadius: agreeBtnRadius.value,
            rejectBtnMoveToCenter: rejectBtnMoveToCenter.value,
            rejectBtnHeight: rejectBtnHeight.value,
            rejectBtnRadius: rejectBtnRadius.value,
            rejectDisappear: rejectDisappear.value,
            agreeBtnMoveToCenter: agreeBtnMoveToCenter.value,
            agreeBtnHeight: agreeBtnHeight.value,
            agreeShowPercentage: agreeShowPercentage.value);
      }
    });
    _agreeAnimationController.addListener(() {
      _meetingMaskKey.currentState.setChanges(
        agreePercentage: agreeMaskColor.value,
        rejectPercentage: rejectMaskColor.value,
        chatFaction: goChatFaction.value,
        congratulationFaction: congratulationFaction.value,
        descFaction: descFaction.value,
        rejectOpacityFaction: rejectDisappear.value,
      );

      _floatingState.currentState.setChanges(
          agreeBtnRadius: agreeBtnRadius.value,
          rejectBtnMoveToCenter: rejectBtnMoveToCenter.value,
          rejectBtnHeight: rejectBtnHeight.value,
          rejectBtnRadius: rejectBtnRadius.value,
          rejectDisappear: rejectDisappear.value,
          agreeBtnMoveToCenter: agreeBtnMoveToCenter.value,
          agreeBtnHeight: agreeBtnHeight.value,
          agreeShowPercentage: agreeShowPercentage.value);
    });
  }

  String getFirstImage() {
    return images[currentPeople % 3];
  }

  String getSecondImage() {
    return images[(currentPeople + 1) % 3];
  }

  Widget buildDrawer(ModalRoute<dynamic> route) {
    return LayoutBuilder(builder: (context, reg) {
      return MyDrawerController(
        key: _scaffoldKey,
        router: route,
        child: MeetRequirementSideBar(reg),
      );
    });
  }

  Widget third(sizeController) {
    return new Opacity(
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
        height: 438 * sizeController.resize,
        width: 296 * sizeController.resize,
      ),
//      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("build contenxt==");
    return Container(
      color: Colors.white,
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height,
      child: CustomPaint(
          painter: MyPainter(),
          child: Scaffold(
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
                    _scaffoldKey.currentState.toggle();
                  },
                ),
              ],
              title: Text('Meeting',
                  style: TextStyle(color: Colors.black, fontSize: 23)),
            ),
            bottomNavigationBar: MyBottom(),
            floatingActionButton: (selected)
                ? IgnorePointer()
                : Floating(
                key: _floatingState,
                agreeBtnRadius: agreeBtnRadius.value,
                rejectBtnMoveToCenter: rejectBtnMoveToCenter.value,
                rejectBtnHeight: rejectBtnHeight.value,
                rejectBtnRadius: rejectBtnRadius.value,
                rejectDisappear: rejectDisappear.value,
                agreeBtnMoveToCenter: agreeBtnMoveToCenter.value,
                agreeBtnHeight: agreeBtnHeight.value,
                agreeShowPercentage: agreeShowPercentage.value,
                onReject: () {
                  _rejectAnimationController.forward(from: 0.0);
                },
                onAgree: () {
                  _agreeAnimationController.forward(from: 0.0);
                }),
            body: Container(
                color: Colors.transparent,
                child: Center(
                  child: LayoutBuilder(builder: (context, con) {
                    if (_child == null) {
                      SizeController controller = SizeController(con);
                      _child = Stack(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: third(controller)),
                          MeetingSecondLayer(
                            sizeController: controller,
                            image: getSecondImage(),
                            percentage: rejectDisappear.value,
                            key: _meetingSecondLayerKey,
                          ),
                          MeetingFirstLayer(
                            key: _meetingFirstLayerKey,
                            sizeController: controller,
                            image: getFirstImage(),
                            percentage: rejectDisappear.value,
                          ),
                          MeetingProfileMask(
                            key: _meetingMaskKey,
                            sizeController: controller,
                            agreePercentage: agreeMaskColor.value,
                            rejectPercentage: rejectMaskColor.value,
                            chatFaction: goChatFaction.value,
                            congratulationFaction: congratulationFaction.value,
                            descFaction: descFaction.value,
                            rejectOpacityFaction: rejectDisappear.value,
                          )
                        ],
                        alignment: Alignment.topCenter,
                      );
                    }
                    return _child;
                  }),
                )),
          )),
    );
  }
}

class MyPainter extends CustomPainter {
  final Paint lightBluePaint = Paint()
    ..color = Color.fromARGB(255, 240, 244, 248);
  final Paint bluePaint = Paint()
    ..color = Colors.white;
  final TextPainter textPainter = TextPainter(
    textDirection: TextDirection.ltr,
  );

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromLTWH(55, -674, 1064, 1064);
    final Path smallWhite = Path()
      ..addOval(rect);
    canvas.drawPath(smallWhite, lightBluePaint);

    var rect2 = Rect.fromLTWH(304, -73, 177, 177);
    final Path smallWhite2 = Path()
      ..addOval(rect2);
    canvas.drawPath(smallWhite2, bluePaint);

    var rect3 = Rect.fromLTWH(-661, 406, 1032, 1032);
    final Path bottom = Path()
      ..addOval(rect3);
    canvas.drawPath(bottom, lightBluePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
