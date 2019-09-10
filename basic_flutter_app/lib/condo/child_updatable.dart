import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

abstract class Fragment {
  void play();
}

class ChildUpdatable extends RenderObjectWidget {
  const ChildUpdatable({
    Key key,
    this.keepFirst = false,
    @required this.builder,
    @required this.notifier,
  })  : assert(builder != null),
        super(key: key);

  final LayoutWidgetBuilder builder;
  final ValueNotifier<Widget> notifier;
  final bool keepFirst;

  @override
  _LayoutBuilderElement createElement() {
    print("create element is called");
    _LayoutBuilderElement element = _LayoutBuilderElement(this);
    if (this.notifier != null) {
      this.notifier.addListener(() {
        element.setChild(notifier.value);
      });
    }
    return element;
  }

  @override
  _RenderLayoutBuilder createRenderObject(BuildContext context) {
    print("create render layout builder is called");
    return _RenderLayoutBuilder();
  }
}

class _LayoutBuilderElement extends RenderObjectElement {
  _LayoutBuilderElement(ChildUpdatable widget)
      : this.initialElement = !widget.keepFirst,
        this.initRemoved = widget.keepFirst,
        super(widget);

  @override
  ChildUpdatable get widget => super.widget;

  @override
  _RenderLayoutBuilder get renderObject => super.renderObject;

  Element _currentChild;
  Widget _pendingWidget;
  Map<Key, Element> caches = HashMap();
  Map<Key, int> slots = HashMap();
  Element _previous;

  //  Initial element
  bool initialElement = true;
  bool initRemoved = false;

  void setChild(Widget newWidget) {
    this._pendingWidget = newWidget;
    renderObject.callback = _layout;
    renderObject.markNeedsLayout();
    this.markNeedsBuild();
  }

  @override
  void visitChildren(ElementVisitor visitor) {
    if (initialElement) {
      visitor(_currentChild);
    } else {
      caches.entries.forEach((e) {
        var element = e.value;
        visitor(element);
      });
    }
  }

  @override
  void forgetChild(Element child) {
    assert(child == _currentChild);
    _currentChild = null;
  }

  @override
  void mount(Element parent, dynamic newSlot) {
    super.mount(parent, newSlot); // Creates the renderObject.
    renderObject.callback = _layout;
  }

  @override
  void update(ChildUpdatable newWidget) {
    assert(widget != newWidget);
    super.update(newWidget);
    assert(widget == newWidget);
    renderObject.callback = _layout;
    renderObject.markNeedsLayout();
  }

  @override
  void performRebuild() {
    print("perform rebuild");
    // This gets called if markNeedsBuild() is called on us.
    // That might happen if, e.g., our builder uses Inherited widgets.
    renderObject.markNeedsLayout();
    super
        .performRebuild(); // Calls widget.updateRenderObject (a no-op in this case).
  }

  int count = 0;
  static const int FRONT = 1;
  static const int BACK = 0;

  void _layout(BoxConstraints constraints) {
    print("call _layout ==");

    if (_pendingWidget == null) {
      owner.buildScope(this, () {
        Widget built;
        if (widget.builder != null) {
          try {
            built = widget.builder(this, constraints);
            debugWidgetBuilderValue(widget, built);
          } catch (e, stack) {
            built = ErrorWidget.builder(_debugReportException(
                ErrorDescription('building $widget'), e, stack));
          }
        }
        try {
//          assert(_currentChild != null);

          if (widget.keepFirst) {
            _currentChild = updateChild(_currentChild, built, FRONT);
            caches[built.key] = _currentChild;
            slots[built.key] = slot;

//            caches[_pendingWidget.key]
          } else {
            _currentChild = updateChild(_currentChild, built, null);
          }
        } catch (e, stack) {
          built = ErrorWidget.builder(_debugReportException(
              ErrorDescription('building $widget'), e, stack));
          _currentChild = updateChild(null, built, slot);
        }
      });
    } else {
      owner.buildScope(this, () {
        Element element = caches[_pendingWidget.key];
        if (element == null) {
          if (initialElement) {
            element = updateChild(_currentChild, _pendingWidget, FRONT);
            initialElement = false;
          } else {
            if (_currentChild == null) {
              element = updateChild(null, _pendingWidget, FRONT);
            } else {
              element = updateChild(null, _pendingWidget, FRONT);
            }
          }
          caches[_pendingWidget.key] = element;
          slots[_pendingWidget.key] = slot;

          if (initRemoved) {
            if (_previous != null) {
              _previous?.detachRenderObject();
            }
          }
        } else {
          if (_currentChild == element) {
            return;
          }
          if (_previous == element) {
          } else {
            print("detach object $_previous");
            _previous?.detachRenderObject();
            element.attachRenderObject(1);
          }
        }

        if (!initRemoved) {
          initRemoved = true;
        } else {
          _previous = _currentChild;
        }
        _currentChild = element;
        if (_previous != null) {
          if (_previous.slot != BACK) {
            updateSlotForChild(_previous, BACK);
          }
        }
        if (_currentChild != null) {
          if (_currentChild.slot != 1) {
            updateSlotForChild(_currentChild, FRONT);
          }
        }
      });
    }
  }

  @override
  void insertChildRenderObject(RenderObject child, dynamic slot) {
    renderObject.child = child;
//    assert(renderObject == this.renderObject);
  }

  @override
  void moveChildRenderObject(RenderObject child, dynamic slot) {
    if (slot == BACK) {
      renderObject.movePrevious(child);
    } else if (slot == FRONT) {
      renderObject.moveCurrent(child);
    } else {
      assert(false);
    }
  }

  @override
  void removeChildRenderObject(RenderObject child) {
    print("removeChildRenderObject 2 ==");

    final _RenderLayoutBuilder renderObject = this.renderObject;
    if (renderObject.child == child) {
      renderObject.child = null;
    } else {
      if (renderObject.previous == child) {
        renderObject.previous = null;
      }
    }
  }
}

class _RenderLayoutBuilder extends RenderBox {
  _RenderLayoutBuilder({
    LayoutCallback<BoxConstraints> callback,
  }) : _callback = callback;

  LayoutCallback<BoxConstraints> get callback => _callback;
  LayoutCallback<BoxConstraints> _callback;

  RenderBox _child;
  RenderBox _previous;

  /// The render object's unique child
  RenderBox get child => _child;

  RenderBox get previous => _previous;

  set child(RenderBox value) {
    if (_child != null) dropChild(_child);
    _child = value;
    if (_child != null) adoptChild(_child);
  }

  set previous(RenderBox value) {
    if (_previous != null) dropChild(_previous);
    _previous = value;
    if (_previous != null) adoptChild(_previous);
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    if (_child != null) _child.attach(owner);

    if (_previous != null) _previous.attach(owner);
  }

  @override
  void detach() {
    super.detach();
    if (_child != null) _child.detach();
    if (_previous != null) _previous.detach();
  }

  @override
  void redepthChildren() {
    if (_child != null) redepthChild(_child);
    if (_previous != null) redepthChild(_previous);
  }

  @override
  void visitChildren(RenderObjectVisitor visitor) {
    if (_child != null) visitor(_child);
    if (_previous != null) visitor(_previous);
  }

  @override
  List<DiagnosticsNode> debugDescribeChildren() {
    return child != null
        ? <DiagnosticsNode>[child.toDiagnosticsNode(name: 'child')]
        : <DiagnosticsNode>[];
  }

  set callback(LayoutCallback<BoxConstraints> value) {
    if (value == _callback) return;
    _callback = value;
    markNeedsLayout();
  }

  bool _debugThrowIfNotCheckingIntrinsics() {
    assert(() {
      if (!RenderObject.debugCheckingIntrinsics) {
        throw FlutterError(
            'LayoutBuilder does not support returning intrinsic dimensions.\n'
            'Calculating the intrinsic dimensions would require running the layout '
            'callback speculatively, which might mutate the live render object tree.');
      }
      return true;
    }());
    return true;
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    assert(_debugThrowIfNotCheckingIntrinsics());
    return 0.0;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    assert(_debugThrowIfNotCheckingIntrinsics());
    return 0.0;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    assert(_debugThrowIfNotCheckingIntrinsics());
    return 0.0;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    assert(_debugThrowIfNotCheckingIntrinsics());
    return 0.0;
  }

  @override
  void performLayout() {
    print("performLayout   ==");
    assert(callback != null);
    invokeLayoutCallback(callback);
    if (child != null) {
      child.layout(constraints, parentUsesSize: true);
      size = constraints.constrain(child.size);
    } else {
      size = constraints.biggest;
    }
    if (previous != null) {
      previous.layout(constraints, parentUsesSize: true);
    }

    print("set size $size");
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {Offset position}) {
    print("hitTestChildren   ==");
    if (child == null) {
      return false;
    }
    return child?.hitTest(result, position: position) ?? false;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (previous != null) {
      context.paintChild(previous, offset);
    }
    if (child != null) {
      context.paintChild(child, offset);
    }
  }

  void movePrevious(RenderObject child) {
    print("move previous");
    if (_previous != child) {
      _previous = child;
      if (child.parent == null) {
        adoptChild(_previous);
      }
    }
  }

  void moveCurrent(RenderObject child) {
    print("move current");
    if (_child != child) {
      _child = child;
      if (child.parent == null) {
        adoptChild(_previous);
      }
    }
  }
}

FlutterErrorDetails _debugReportException(
  DiagnosticsNode context,
  dynamic exception,
  StackTrace stack,
) {
  final FlutterErrorDetails details = FlutterErrorDetails(
    exception: exception,
    stack: stack,
    library: 'widgets library',
    context: context,
  );
  FlutterError.reportError(details);
  return details;
}
