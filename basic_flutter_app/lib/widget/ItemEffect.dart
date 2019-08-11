import 'dart:async';

import 'package:flutter/material.dart';

import 'list_animation_controller.dart';

class ItemEffect extends StatefulWidget {
  final int position;
  final IndexedWidgetBuilder indexedWidgetBuilder;
  final ListAnimationController controller;
  final Duration duration;

  ItemEffect(
      {this.position,
      this.indexedWidgetBuilder,
      this.duration,
      this.controller});

  _ItemEffect createState() => new _ItemEffect();
}

class _ItemEffect extends State<ItemEffect> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _offsetFloat;
  Animation<double> _opacity;
  bool animated = false;
  bool disposed = false;
  StreamSubscription str;
  double opacity = 1;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _offsetFloat = Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset.zero)
        .animate(_controller);
    _opacity = Tween<double>(begin: 0, end: 0.8).animate(_controller);
    _controller.addListener(() async {
      if (_controller.status == AnimationStatus.completed) {
        if (mounted) {
          animated = true;
        }
      }
    });
  }

  @override
  void dispose() {
    disposed = true;
    str.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget built = widget.indexedWidgetBuilder(context, widget.position);
    if (!animated) {
      var stream = widget.controller.listenAnimation;
      str = stream.listen((event) {
        if (mounted) {
          var isme = (event == widget.position);
          if (isme) {
            print("call  ${isme} ${event} second ${widget.position} build");
            _controller.forward();
          }
        }
      });
      widget.controller.publish(widget.position);
    }
    print("build is call ${widget.position}");
    return FadeTransition(
        opacity: _opacity,
        child: SlideTransition(
          position: _offsetFloat,
          child: built,
          textDirection: TextDirection.rtl,
        ));
  }
}
