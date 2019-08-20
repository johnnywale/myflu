library popup_menu;

import 'dart:async';
import 'dart:core';
import 'dart:ui';

import 'package:flutter/material.dart';

abstract class ItemProvider {
  Widget get menuImage;
}

class MoveItem extends ItemProvider {
  Widget image;
  var userInfo;
  Movecallback moveCallback;
  OverlayEntry _entry;

  MoveItem({this.image, this.userInfo, this.moveCallback});

  @override
  Widget get menuImage => image;
}

typedef Movecallback = Function(MoveItem item);

class PopupMove {
  GlobalKey target;

  PopupMove({this.target});

  void play({GlobalKey source, MoveItem item}) {
    var moveTarget = PopupMove.getWidgetGlobalRect(target);
    var showRect = PopupMove.getWidgetGlobalRect(source);
    OverlayEntry _entry = OverlayEntry(builder: (context) {
      return buildPopupMenuLayout(item, moveTarget, showRect);
    });

    item._entry = _entry;
    Overlay.of(source.currentContext).insert(_entry);
  }

  static Rect getWidgetGlobalRect(GlobalKey key) {
    RenderBox renderBox = key.currentContext.findRenderObject();
    var offset = renderBox.localToGlobal(Offset.zero);
    return Rect.fromLTWH(
        offset.dx, offset.dy, renderBox.size.width, renderBox.size.height);
  }

  LayoutBuilder buildPopupMenuLayout(
      MoveItem moveItem, Rect target, Rect rect) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: <Widget>[
          _MenuItemWidget(
            startLeft: rect.topLeft.dx,
            startTop: rect.topLeft.dy,
            endLeft: target.center.dx,
            endTop: target.center.dy,
            item: moveItem,
          ),
        ],
      );
    });
  }

  double get screenWidth {
    double width = window.physicalSize.width;
    double ratio = window.devicePixelRatio;
    return width / ratio;
  }
}

class _MenuItemWidget extends StatefulWidget {
  final MoveItem item;
  final double startTop;
  final double endTop;
  final double startLeft;
  final double endLeft;
  final Function(ItemProvider item) clickCallback;

  _MenuItemWidget(
      {this.startLeft,
      this.startTop,
      this.endLeft,
      this.endTop,
      this.item,
      this.clickCallback});

  @override
  State<StatefulWidget> createState() {
    return _MenuItemWidgetState();
  }
}

class _MenuItemWidgetState extends State<_MenuItemWidget>
    with TickerProviderStateMixin {
  var highlightColor = Color(0x55000000);
  var color = Color(0xff232323);

  double currentTop;
  double currentLeft;
  double currentWidth;
  double currentHeight;
  Timer timer;

  @override
  void initState() {
    currentTop = widget.startTop;
    currentLeft = widget.startLeft;
    currentWidth = 70;
    currentHeight = 70;
    super.initState();
    timer = Timer(Duration(milliseconds: 100), () {
      _onRefresh();
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  void _onRefresh() {
    if (mounted) {
      setState(() {
        currentTop = widget.endTop;
        currentLeft = widget.endLeft;
        currentWidth = 0;
        currentHeight = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      MyAnimatedPositioned(
          callback: () {
            widget.item._entry.remove();
            widget.item.moveCallback(widget.item);
          },
          left: currentLeft,
          top: currentTop,
          height: currentHeight,
          width: currentWidth,
          duration: Duration(seconds: 1),
          //easeInOutCirc
          //easeInToLinear
          //Curves.easeInBack,
          curve: Curves.easeInBack,
          child: widget.item.image)
    ]);
  }
}

class MyAnimatedPositioned extends ImplicitlyAnimatedWidget {
  const MyAnimatedPositioned({
    Key key,
    @required this.child,
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.width,
    this.height,
    this.callback,
    Curve curve = Curves.linear,
    @required Duration duration,
    Duration reverseDuration,
  })  : assert(left == null || right == null || width == null),
        assert(top == null || bottom == null || height == null),
        super(
            key: key,
            curve: curve,
            duration: duration,
            reverseDuration: reverseDuration);

  final Widget child;
  final double left;
  final double top;
  final double right;
  final double bottom;
  final double width;
  final double height;
  final VoidCallback callback;

  @override
  _AnimatedPositionedState createState() => _AnimatedPositionedState();
}

class _AnimatedPositionedState
    extends AnimatedWidgetBaseState<MyAnimatedPositioned> {
  Tween<double> _left;
  Tween<double> _top;
  Tween<double> _right;
  Tween<double> _bottom;
  Tween<double> _width;
  Tween<double> _height;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        widget.callback();
      }
    });
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _left = visitor(
        _left, widget.left, (dynamic value) => Tween<double>(begin: value));
    _top = visitor(
        _top, widget.top, (dynamic value) => Tween<double>(begin: value));
    _right = visitor(
        _right, widget.right, (dynamic value) => Tween<double>(begin: value));
    _bottom = visitor(
        _bottom, widget.bottom, (dynamic value) => Tween<double>(begin: value));
    _width = visitor(
        _width, widget.width, (dynamic value) => Tween<double>(begin: value));
    _height = visitor(
        _height, widget.height, (dynamic value) => Tween<double>(begin: value));
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: widget.child,
      left: _left?.evaluate(animation),
      top: _top?.evaluate(animation),
      right: _right?.evaluate(animation),
      bottom: _bottom?.evaluate(animation),
      width: _width?.evaluate(animation),
      height: _height?.evaluate(animation),
    );
  }
}
