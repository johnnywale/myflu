import 'package:flutter/material.dart';
import 'package:we_rate_dogs/pages/personalized_tab_bar/tab_item.dart';

import 'tab_drag_and_drop.dart';

class PersonalizedTabController extends ChangeNotifier {
  List<TabItem> tabBarItem;
  List<TabItem> menuItems;

  PersonalizedTabController({
    this.tabBarItem,
    this.menuItems,
  });
}

class PersonalizedTab extends StatefulWidget {
  final double barHeight;
  final double barRadius;
  final double menuHeight;
  final PersonalizedTabController controller;

  final Map<int, TabItem> selected;
  final Map<int, TabItem> waiting;

  PersonalizedTab({Key key, barHeight, barRadius, menuHeight, controller})
      : this.barHeight = barHeight ?? 90,
        this.barRadius = barRadius ?? 25,
        this.menuHeight = menuHeight ?? 270,
        assert(controller != null),
        this.controller = controller,
        this.selected = Map.of(controller.tabBarItem.asMap()),
        this.waiting = Map.of(controller.menuItems.asMap()),
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
  AnimationController animationController;
  double backGroundHeight;
  double offsetMenu = 0;
  bool open = false;
  double configBtnWidth = 100;
  double leftPadding = 25.0;
  double topPadding = 25.0;
  double percentage = 0;

  Map<int, TabItem> pending;

  @override
  void initState() {
    animationController = AnimationController(vsync: this);
    super.initState();
  }

  void animateBar(bool open) {
    if (!animationController.isAnimating) {
      animationController.dispose();
      animationController = AnimationController(
          duration: Duration(milliseconds: 300), vsync: this);
      CurvedAnimation curve =
          CurvedAnimation(parent: animationController, curve: Curves.ease);
      var animation =
          Tween(begin: offsetMenu, end: open ? -1 * configBtnWidth : 0.0)
              .animate(curve);
      animationController.addListener(() {
        setState(() {
          offsetMenu = animation.value.toDouble();
          percentage = offsetMenu / configBtnWidth * -1;
          backGroundHeight = widget.barHeight +
              (percentage * (widget.menuHeight - widget.barHeight));
        });
      });
      animationController.forward();
    }
  }

  Widget menus() {
    return Positioned(
      top: backGroundHeight - tabHeight,
      height: tabHeight,
      width: MediaQuery.of(context).size.width,
      left: offsetMenu,
      child: GestureDetector(
          onHorizontalDragUpdate: (e) {
            offsetMenu += e.delta.dx;
            if (offsetMenu < -configBtnWidth - 20) {
              offsetMenu = -configBtnWidth - 20;
            } else if (offsetMenu > 0) {
              offsetMenu = 0;
            }
            if (offsetMenu == 0) {
              backGroundHeight = widget.barHeight;
            } else {
              percentage = offsetMenu / configBtnWidth * -1;
              backGroundHeight = widget.barHeight +
                  (percentage * (widget.menuHeight - widget.barHeight));
            }
            setState(() {});
          },
          onPanDown: (e) {
            animationController?.stop();
          },
          onHorizontalDragEnd: (e) {
            if (offsetMenu > -50) {
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

  void updateTab(int index, TabItem item) {
    if (pending == null) {
      pending = Map.of(widget.selected);
    }
    pending[index] = item;
  }

  List<Widget> buildSelected() {
    if (backGroundHeight > tabHeight) {
      List<Widget> result = widget.selected
          .map((index, a) => MapEntry(index, buildIconTarget(index, a)))
          .values
          .toList(growable: true)
            ..insert(0, Container(width: configBtnWidth * percentage));
      for (var i = widget.selected.length; i < 5; i++) {
        result.add(new IconTarget(
          sequence: i,
          size: 40,
          acceptCallback: updateTab,
        ));
      }
      return result;
    } else {
      return widget.selected.values.map((a) => Icon(a.data, size: 40)).toList();
    }
  }

  Widget buildIconTarget(int index, TabItem item) {
    return IconTarget(
        acceptCallback: updateTab,
        sequence: index,
        tabItem: item,
        size: item.size);
  }

  List<Widget> buildNotSelected() {
    return widget.waiting
        .map((index, a) => MapEntry(index, getChoose(index, a)))
        .values
        .toList();
  }

  Widget getChoose(int sequence, TabItem tabItem) {
    return WaitingItem(
      sequence: sequence,
      tabItem: tabItem,
      acceptCallback: (index, item) {},
    );
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
                        if (pending != null) {
                          widget.selected.clear();
                          widget.selected.addAll(pending);
                          widget.controller.tabBarItem =
                              widget.selected.values.toList(growable: false);
                          widget.controller.notifyListeners();
                        }
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
                                          120)
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
                                  Expanded(child: Container()),
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
                                      this.pending = null;
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
            menus()
          ],
        ));
  }
}
