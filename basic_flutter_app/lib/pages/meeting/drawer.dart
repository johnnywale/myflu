import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
    this.elevation = 16.0,
    this.child,
    this.semanticLabel,
  })  : assert(elevation != null && elevation >= 0.0),
        super(key: key);

  final double elevation;
  final Widget child;
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    String label = semanticLabel;
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        label = semanticLabel;
        break;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        label = semanticLabel ?? MaterialLocalizations.of(context)?.drawerLabel;
    }
    return Semantics(
      scopesRoute: true,
      namesRoute: true,
      explicitChildNodes: true,
      label: label,
      child: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Material(
          color: Colors.transparent,
          elevation: elevation,
          child: child,
        ),
      ),
    );
  }
}

typedef DrawerCallback = void Function(bool isOpened);

class MyDrawerController extends StatefulWidget {
  const MyDrawerController({
    GlobalKey key,
    @required this.child,
    this.drawerCallback,
    this.dragStartBehavior = DragStartBehavior.start,
    this.router,
  })  : assert(child != null),
        assert(dragStartBehavior != null),
        super(key: key);
  final Widget child;
  final DrawerCallback drawerCallback;
  final DragStartBehavior dragStartBehavior;
  final ModalRoute router;

  @override
  MyDrawerControllerState createState() => MyDrawerControllerState();
}

class MyDrawerControllerState extends State<MyDrawerController>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void didUpdateWidget(MyDrawerController oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _historyEntry?.remove();
    _controller.dispose();
    super.dispose();
  }

  Animation<double> _radius;
  Animation<double> _width;
  Animation<double> _opacity;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this)
          ..addListener(_animationChanged)
          ..addStatusListener(_animationStatusChanged);

    _opacity = new Tween(begin: 0.0, end: 1.0).animate(new CurvedAnimation(
      parent: _controller,
      curve: new Interval(
        0.8,
        1,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    ));

    _radius = new Tween(begin: 500.0, end: 10.0).animate(new CurvedAnimation(
      parent: _controller,
      curve: new Interval(
        0.3,
        1,
        curve: Curves.easeInOutCubic,
      ),
    ));

    _width =
        new Tween(begin: 0.0, end: 400 * 4 / 5).animate(new CurvedAnimation(
      parent: _controller,
      curve: new Interval(
        0.0,
        0.3,
        curve: Curves.linear,
      ),
    ));
  }

  void _animationChanged() {
    setState(() {});
  }

  LocalHistoryEntry _historyEntry;

  void _ensureHistoryEntry() {
    if (_historyEntry == null) {
      print("ensure history");
      if (widget.router != null) {
        _historyEntry = LocalHistoryEntry(onRemove: _handleHistoryEntryRemoved);
        widget.router.addLocalHistoryEntry(_historyEntry);
      }
    }
  }

  void _animationStatusChanged(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.forward:
        _ensureHistoryEntry();
        break;
      case AnimationStatus.reverse:
        _historyEntry?.remove();
        _historyEntry = null;
        break;
      case AnimationStatus.dismissed:
        break;
      case AnimationStatus.completed:
        break;
    }
  }

  void _handleHistoryEntryRemoved() {
    _historyEntry = null;
    opened = false;
    close();
  }

  void toggle() {
    if (opened) {
      close();
      opened = false;
    } else {
      open();
      opened = true;
    }
  }

  bool opened = false;

  void open() {
    _controller.forward(from: 0.0);
    if (widget.drawerCallback != null) widget.drawerCallback(true);
  }

  /// Starts an animation to close the drawer.
  void close() {
    _controller.reverse(from: 1.0);
    if (widget.drawerCallback != null) widget.drawerCallback(false);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
          top: 0,
          left: 0,
          width: _width.value > 0 ? MediaQuery.of(context).size.width : 0,
          // - _width.value
          height: MediaQuery.of(context).size.height,
          child: GestureDetector(
            onTap: () {
              opened = false;
              close();
            },
            child: Container(
              color: Colors.black54.withOpacity(
                  _width.value / MediaQuery.of(context).size.width),
              width: double.infinity,
              height: double.infinity,
            ),
          )),
      Positioned(
        child: MyDrawer(
            elevation: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(_radius.value),
                      bottomLeft: Radius.circular(_radius.value))),
              height: MediaQuery.of(context).size.height,
              child: Opacity(
                opacity: _opacity.value,
                child: widget.child,
              ),
            )),
        top: 0,
        right: 0,
        width: _width.value,
        height: MediaQuery.of(context).size.height,
      )
    ]);
  }
}
