import 'package:flutter/material.dart';
import 'package:we_rate_dogs/pages/personalized_tab_bar/tab_item.dart';

import 'dash_box_decoration.dart';

typedef ItemCallback = void Function(int, TabItem);

class WaitingItem extends StatefulWidget {
  final TabItem tabItem;
  final ItemCallback acceptCallback;
  final int sequence;

  WaitingItem({
    Key key,
    @required this.sequence,
    @required this.tabItem,
    this.acceptCallback,
  }) : super(key: key);

  @override
  PendingItemState createState() => PendingItemState();
}

class PendingItemState extends State<WaitingItem>
    with TickerProviderStateMixin {
  Color tabColor = Color.fromARGB(255, 255, 249, 222);
  Color background = Color.fromARGB(255, 254, 212, 0);
  AnimationController sizeAnimationController;

  Animation<double> newSizeAnimation() {
    sizeAnimationController = new AnimationController(
        duration: Duration(milliseconds: 300), vsync: this);
    CurvedAnimation curve =
        CurvedAnimation(parent: sizeAnimationController, curve: Curves.ease);
    var animation = Tween(begin: 1.0, end: 0.0).animate(curve);
    return animation;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (mounted) {
      sizeAnimationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20),
        child: LongPressDraggable(
            data: widget.tabItem,
            hapticFeedbackOnStart: false,
            child: Container(
                decoration: DashBoxDecoration(
                  color: tabColor,
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
                      Icon(widget.tabItem.data, size: 30),
                      Text(widget.tabItem.text, style: TextStyle(fontSize: 16))
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
                    widget.tabItem.data,
                    size: 60,
                    color: background,
                  ),
                )),
            childWhenDragging: SizeTransition(
                axis: Axis.horizontal,
                sizeFactor: newSizeAnimation(),
                child: Container(
                  width: 80,
                  height: 80,
                  color: Colors.transparent,
                )),
            onDragStarted: () {
              sizeAnimationController.forward(from: 0.0);
            },
            onDragCompleted: () {
              if (widget.acceptCallback != null) {
                widget.acceptCallback(widget.sequence, widget.tabItem);
              }
            }));
  }
}

class IconTarget extends StatefulWidget {



  final TabItem tabItem;
  final double size;
  final int sequence;
  final ItemCallback acceptCallback;

  IconTarget({
    Key key,
    @required this.sequence,
    @required this.tabItem,
    this.acceptCallback,
    this.size,
  }) : super(key: key);

  @override
  IconTargetState createState() => IconTargetState();
}

class IconTargetState extends State<IconTarget> with TickerProviderStateMixin {
  IconData data;
  bool accept = false;
  double size = 40.0;

  AnimationController targetAnimationController;

  @override
  void initState() {
    if (widget.tabItem != null) {
      data = widget.tabItem.data;
    }
    targetAnimationController = new AnimationController(
        duration: Duration(milliseconds: 300), vsync: this);
    CurvedAnimation curve = CurvedAnimation(
        parent: targetAnimationController, curve: Curves.easeInOut);
    var animation = Tween(begin: 40.0, end: 80.0).animate(curve);
    targetAnimationController.addListener(() {
      if (mounted) {
        setState(() {
          size = animation.value;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    targetAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget(
        builder: (context, List<TabItem> candidateData, rejectedData) {
      if (accept) {
        return new Container(
            width: size,
            height: size,
            decoration: DashBoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ));
      } else {
        if (this.data == null) {
          double size = widget.size;
          return new Container(
              width: size,
              height: size,
              decoration: DashBoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ));
        } else {
          Icon icon = Icon(data, size: widget.size);
          return icon;
        }
      }
    }, onWillAccept: (data) {
      this.accept = true;
      size = 40;
      targetAnimationController.forward(from: 0.0);
      setState(() {});
      return true;
    }, onAccept: (data) {
      size = 60;
      TabItem d = data as TabItem;
      this.data = d.data;
      this.accept = false;
      if (widget.acceptCallback != null) {
        TabItem tabItem = TabItem(
          data: d.data,
          text: d.text,
          size: 40,
        );
        widget.acceptCallback(widget.sequence, tabItem);
      }
      setState(() {});
    }, onLeave: (data) {
      size = 60;
      this.accept = false;
    });
  }
}
