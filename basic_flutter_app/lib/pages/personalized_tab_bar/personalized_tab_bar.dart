import 'package:flutter/material.dart';
import 'package:we_rate_dogs/pages/personalized_tab_bar/dash_box_decoration.dart';
import 'package:we_rate_dogs/pages/personalized_tab_bar/tab_item.dart';

import 'icon_target.dart';

typedef ItemCallback = List<TabItem> Function();

class PersonalizedTabController extends ChangeNotifier {
  PersonalizedTabController();
}

class PersonalizedTab extends StatefulWidget {
  final double barHeight;
  final double barRadius;
  final double menuHeight;
  final PersonalizedTabController controller;
  final List<TabItem> selectedItem;
  final List<TabItem> notSelectedItem;

  PersonalizedTab(
      {Key key,
      barHeight,
      barRadius,
      menuHeight,
      controller,
      selectedItem,
      notSelectedItem})
      : this.barHeight = barHeight ?? 90,
        this.barRadius = barRadius ?? 25,
        this.menuHeight = menuHeight ?? 270,
        this.controller = controller ?? PersonalizedTabController(),
        this.selectedItem = selectedItem ?? [],
        this.notSelectedItem = notSelectedItem ?? [],
        super(key: key);

  @override
  PersonalizedTabState createState() => PersonalizedTabState();
}

class PersonalizedTabState extends State<PersonalizedTab>
    with TickerProviderStateMixin {
  double tabHeight;
  Color background = Color.fromARGB(255, 254, 212, 0);
  Color tabColor = Color.fromARGB(255, 255, 249, 222);
  double left = 0;
  AnimationController animationControllerExplore;
  double backGroundHeight;

  double offsetExplore = 0;
  bool open = false;
  double configBtnWidth = 100;
  double leftPadding = 25.0;
  double topPadding = 25.0;
  double percentage = 0;

  @override
  void initState() {
    animationControllerExplore = AnimationController(vsync: this);
    super.initState();
  }

  void animateBar(bool open) {
    if (!animationControllerExplore.isAnimating) {
      animationControllerExplore.dispose();
      animationControllerExplore = AnimationController(
          duration: Duration(milliseconds: 300), vsync: this);
      CurvedAnimation curve = CurvedAnimation(
          parent: animationControllerExplore, curve: Curves.ease);
      var animation =
          Tween(begin: offsetExplore, end: open ? -1 * configBtnWidth : 0.0)
              .animate(curve);
      animationControllerExplore.addListener(() {
        setState(() {
          offsetExplore = animation.value.toDouble();
          percentage = offsetExplore / configBtnWidth * -1;
          backGroundHeight = widget.barHeight +
              (percentage * (widget.menuHeight - widget.barHeight));
        });
      });
      animationControllerExplore.forward();
    }
  }

  Widget icons() {
    return Positioned(
      // icons
      top: backGroundHeight - tabHeight,
      height: tabHeight,
      width: MediaQuery.of(context).size.width,
      left: offsetExplore,
      child: GestureDetector(
          onHorizontalDragUpdate: (e) {
            offsetExplore += e.delta.dx;
            if (offsetExplore < -configBtnWidth - 20) {
              offsetExplore = -configBtnWidth - 20;
            } else if (offsetExplore > 0) {
              offsetExplore = 0;
            }

            if (offsetExplore == 0) {
              backGroundHeight = widget.barHeight;
            } else {
              percentage = offsetExplore / configBtnWidth * -1;
              backGroundHeight = widget.barHeight +
                  (percentage * (widget.menuHeight - widget.barHeight));
            }
            setState(() {});
          },
          onHorizontalDragCancel: () {
            print("cancel");
          },
          onPanDown: (e) {
            animationControllerExplore?.stop();
          },
          onHorizontalDragEnd: (e) {
            if (offsetExplore > -50) {
              animateBar(false);
            } else {
              animateBar(true);
            }
          },
          child: Container(
              decoration: BoxDecoration(
                  color: tabColor,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(widget.barRadius))),
              child: Center(
                child: Row /*or Column*/ (
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: buildSelected()),
              ))),
    );
  }

  List<Widget> buildSelected() {
    if (backGroundHeight > tabHeight) {
      return widget.selectedItem
          .map((a) => IconTarget(data: a.data, size: 40))
          .toList(growable: true)
            ..add(IconTarget(size: 40));
    } else {
      return widget.selectedItem.map((a) => Icon(a.data, size: 40)).toList();
    }
  }

  List<Widget> buildNotSelected() {
    return widget.notSelectedItem.map((a) => getChoose(a)).toList();
  }

  Widget getChoose(TabItem tabItem) {
    return Padding(
        padding: EdgeInsets.only(left: 20),
        child: LongPressDraggable(
            data: tabItem,
            hapticFeedbackOnStart: false,
            child: Container(
                decoration: DashBoxDecoration(
                  color: tabColor,
                  dashBorder: new Border(
                    top: new BorderSide(width: 0.5, color: Colors.grey),
                    bottom: new BorderSide(width: 0.5, color: Colors.grey),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                width: 80,
                height: 80,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(tabItem.data, size: 30),
                      Text(tabItem.text, style: TextStyle(fontSize: 16))
                    ],
                  ),
                )),
            feedback: Container(
                decoration: DashBoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                width: 70,
                height: 70,
                child: Center(
                  child: Icon(
                    tabItem.data,
                    size: 60,
                    color: background,
                  ),
                )),
            childWhenDragging: Container(
              width: 20,
              color: Colors.red,
            ),
            onDragCompleted: () {}));
  }

  Widget getMenuDescription() {
    if (backGroundHeight - tabHeight - topPadding < 60) {
      return Container();
    }
    return Material(
        color: Colors.transparent,
        child: Container(
            width: MediaQuery.of(context).size.width - leftPadding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Your menu',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 249, 222)
                                .withOpacity(percentage > 1 ? 1 : percentage),
                            fontSize: 24 * percentage)),
                    Text('Drag and drop options ',
                        style: TextStyle(
                            color: Color.fromARGB(255, 245, 205, 2)
                                .withOpacity(percentage > 1 ? 1 : percentage),
                            fontSize: 12 * percentage))
                  ],
                )),
                Container(
                    width: 100,
                    // color: Colors.lightGreenAccent,
                    child: FlatButton(
                      textColor: Colors.black,
                      color: background,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20.0 * percentage)),
                      onPressed: () {
                        animateBar(false);
                      },
                      child: new Text("Done",
                          style: TextStyle(fontSize: 16 * percentage)),
                    )),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    tabHeight = widget.barHeight;
    if (backGroundHeight == null) {
      backGroundHeight = tabHeight;
    }
    return Container(
        height: backGroundHeight,
        child: Stack(
          children: <Widget>[
            Positioned(
              height: backGroundHeight,
              width: MediaQuery.of(context).size.width,
              child: Container(
                  height: backGroundHeight,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                            height: backGroundHeight - tabHeight,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: leftPadding, top: topPadding),
                                child: Column(children: [
                                  getMenuDescription(),
                                  (backGroundHeight - tabHeight - topPadding <
                                          105)
                                      ? Container()
                                      : Container(
                                          height: percentage > 1
                                              ? 90
                                              : 90 * percentage,
                                          color: Colors.transparent,
                                          padding: EdgeInsets.only(top: 20),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              45,
                                          child: ListView(
                                            scrollDirection: Axis.horizontal,
                                            children: buildNotSelected(),
                                          )),
                                  Expanded(
                                      child: Container(
//                                        width:
//                                            MediaQuery.of(context).size.width -
//                                                45,
//                                        color: Colors.white,
                                          )),
                                ])),
                          ),
                          GestureDetector(
                            onTap: () {
                              animateBar(false);
                            },
                            child: Container(
                                width: configBtnWidth,
                                height: tabHeight,
                                child: Center(
                                  child: IconButton(
                                    onPressed: () {
                                      animateBar(false);
                                    },
                                    icon: Icon(Icons.close,
                                        size: 40,
                                        color:
                                            Color.fromARGB(255, 254, 212, 0)),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(widget.barRadius)))),
            ),
            icons()
          ],
        ));
  }
}
