import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DashBoxDecoration extends Decoration {
  const DashBoxDecoration({
    this.color,
    this.image,
    this.border,
    this.borderRadius,
    this.boxShadow,
    this.gradient,
    this.backgroundBlendMode,
    this.dashBorder,
    this.shape = BoxShape.rectangle,
  })  : assert(shape != null),
        assert(
            backgroundBlendMode == null || color != null || gradient != null,
            'backgroundBlendMode applies to BoxDecoration\'s background color or '
            'gradient, but no color or gradient was provided.');

  /// Creates a copy of this object but with the given fields replaced with the
  /// new values.
  DashBoxDecoration copyWith({
    Color color,
    DecorationImage image,
    BoxBorder border,
    BorderRadiusGeometry borderRadius,
    List<BoxShadow> boxShadow,
    Gradient gradient,
    BlendMode backgroundBlendMode,
    BoxShape shape,
  }) {
    return DashBoxDecoration(
      color: color ?? this.color,
      image: image ?? this.image,
      border: border ?? this.border,
      borderRadius: borderRadius ?? this.borderRadius,
      boxShadow: boxShadow ?? this.boxShadow,
      gradient: gradient ?? this.gradient,
      backgroundBlendMode: backgroundBlendMode ?? this.backgroundBlendMode,
      shape: shape ?? this.shape,
    );
  }

  @override
  bool debugAssertIsValid() {
    assert(shape != BoxShape.circle ||
        borderRadius == null); // Can't have a border radius if you're a circle.
    return super.debugAssertIsValid();
  }

  final Color color;
  final DecorationImage image;
  final BoxBorder border;
  final BoxBorder dashBorder;
  final BorderRadiusGeometry borderRadius;
  final List<BoxShadow> boxShadow;
  final Gradient gradient;
  final BlendMode backgroundBlendMode;
  final BoxShape shape;

  @override
  EdgeInsetsGeometry get padding => border?.dimensions;

  DashBoxDecoration scale(double factor) {
    return DashBoxDecoration(
      color: Color.lerp(null, color, factor),
      image: image,
      // TODO(ianh): fade the image from transparent
      border: BoxBorder.lerp(null, border, factor),
      borderRadius: BorderRadiusGeometry.lerp(null, borderRadius, factor),
      boxShadow: BoxShadow.lerpList(null, boxShadow, factor),
      gradient: gradient?.scale(factor),
      shape: shape,
    );
  }

  @override
  bool get isComplex => boxShadow != null;

  @override
  DashBoxDecoration lerpFrom(Decoration a, double t) {
    if (a == null) return scale(t);
    if (a is DashBoxDecoration) return DashBoxDecoration.lerp(a, this, t);
    return super.lerpFrom(a, t);
  }

  @override
  DashBoxDecoration lerpTo(Decoration b, double t) {
    if (b == null) return scale(1.0 - t);
    if (b is DashBoxDecoration) return DashBoxDecoration.lerp(this, b, t);
    return super.lerpTo(b, t);
  }

  /// Linearly interpolate between two box decorations.
  ///
  /// Interpolates each parameter of the box decoration separately.
  ///
  /// The [shape] is not interpolated. To interpolate the shape, consider using
  /// a [ShapeDecoration] with different border shapes.
  ///
  /// If both values are null, this returns null. Otherwise, it returns a
  /// non-null value. If one of the values is null, then the result is obtained
  /// by applying [scale] to the other value. If neither value is null and `t ==
  /// 0.0`, then `a` is returned unmodified; if `t == 1.0` then `b` is returned
  /// unmodified. Otherwise, the values are computed by interpolating the
  /// properties appropriately.
  ///
  /// {@macro dart.ui.shadow.lerp}
  ///
  /// See also:
  ///
  ///  * [Decoration.lerp], which can interpolate between any two types of
  ///    [Decoration]s, not just [BoxDecoration]s.
  ///  * [lerpFrom] and [lerpTo], which are used to implement [Decoration.lerp]
  ///    and which use [BoxDecoration.lerp] when interpolating two
  ///    [BoxDecoration]s or a [BoxDecoration] to or from null.
  static DashBoxDecoration lerp(
      DashBoxDecoration a, DashBoxDecoration b, double t) {
    assert(t != null);
    if (a == null && b == null) return null;
    if (a == null) return b.scale(t);
    if (b == null) return a.scale(1.0 - t);
    if (t == 0.0) return a;
    if (t == 1.0) return b;
    return DashBoxDecoration(
      color: Color.lerp(a.color, b.color, t),
      image: t < 0.5 ? a.image : b.image,
      // TODO(ianh): cross-fade the image
      border: BoxBorder.lerp(a.border, b.border, t),
      borderRadius:
          BorderRadiusGeometry.lerp(a.borderRadius, b.borderRadius, t),
      boxShadow: BoxShadow.lerpList(a.boxShadow, b.boxShadow, t),
      gradient: Gradient.lerp(a.gradient, b.gradient, t),
      shape: t < 0.5 ? a.shape : b.shape,
    );
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final DashBoxDecoration typedOther = other;
    return color == typedOther.color &&
        image == typedOther.image &&
        border == typedOther.border &&
        borderRadius == typedOther.borderRadius &&
        boxShadow == typedOther.boxShadow &&
        gradient == typedOther.gradient &&
        shape == typedOther.shape;
  }

  @override
  int get hashCode {
    return hashValues(
      color,
      image,
      border,
      borderRadius,
      boxShadow,
      gradient,
      shape,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..defaultDiagnosticsTreeStyle = DiagnosticsTreeStyle.whitespace
      ..emptyBodyDescription = '<no decorations specified>';

    properties.add(ColorProperty('color', color, defaultValue: null));
    properties.add(DiagnosticsProperty<DecorationImage>('image', image,
        defaultValue: null));
    properties.add(
        DiagnosticsProperty<BoxBorder>('border', border, defaultValue: null));
    properties.add(DiagnosticsProperty<BorderRadiusGeometry>(
        'borderRadius', borderRadius,
        defaultValue: null));
    properties.add(IterableProperty<BoxShadow>('boxShadow', boxShadow,
        defaultValue: null, style: DiagnosticsTreeStyle.whitespace));
    properties.add(DiagnosticsProperty<Gradient>('gradient', gradient,
        defaultValue: null));
    properties.add(EnumProperty<BoxShape>('shape', shape,
        defaultValue: BoxShape.rectangle));
  }

  @override
  bool hitTest(Size size, Offset position, {TextDirection textDirection}) {
    assert(shape != null);
    assert((Offset.zero & size).contains(position));
    switch (shape) {
      case BoxShape.rectangle:
        if (borderRadius != null) {
          final RRect bounds =
              borderRadius.resolve(textDirection).toRRect(Offset.zero & size);
          return bounds.contains(position);
        }
        return true;
      case BoxShape.circle:
        // Circles are inscribed into our smallest dimension.
        final Offset center = size.center(Offset.zero);
        final double distance = (position - center).distance;
        return distance <= math.min(size.width, size.height) / 2.0;
    }
    assert(shape != null);
    return null;
  }

  @override
  _BoxDecorationPainter createBoxPainter([VoidCallback onChanged]) {
    assert(onChanged != null || image == null);
    return _BoxDecorationPainter(this, onChanged);
  }
}

/// An object that paints a [BoxDecoration] into a canvas.
class _BoxDecorationPainter extends BoxPainter {
  _BoxDecorationPainter(this._decoration, VoidCallback onChanged)
      : assert(_decoration != null),
        super(onChanged);

  final DashBoxDecoration _decoration;

  Paint _cachedBackgroundPaint;
  Rect _rectForCachedBackgroundPaint;

  Paint _getBackgroundPaint(Rect rect, TextDirection textDirection) {
    assert(rect != null);
    assert(
        _decoration.gradient != null || _rectForCachedBackgroundPaint == null);

    if (_cachedBackgroundPaint == null ||
        (_decoration.gradient != null &&
            _rectForCachedBackgroundPaint != rect)) {
      final Paint paint = Paint();
      if (_decoration.backgroundBlendMode != null)
        paint.blendMode = _decoration.backgroundBlendMode;
      if (_decoration.color != null) paint.color = _decoration.color;
      if (_decoration.gradient != null) {
        paint.shader = _decoration.gradient
            .createShader(rect, textDirection: textDirection);
        _rectForCachedBackgroundPaint = rect;
      }
      _cachedBackgroundPaint = paint;
    }

    return _cachedBackgroundPaint;
  }

  void _paintBox(
      Canvas canvas, Rect rect, Paint paint, TextDirection textDirection) {
    switch (_decoration.shape) {
      case BoxShape.circle:
        assert(_decoration.borderRadius == null);
        final Offset center = rect.center;
        final double radius = rect.shortestSide / 2.0;
        canvas.drawCircle(center, radius, paint);
        break;
      case BoxShape.rectangle:
        if (_decoration.borderRadius == null) {
          canvas.drawRect(rect, paint);
        } else {
          canvas.drawRRect(
              _decoration.borderRadius.resolve(textDirection).toRRect(rect),
              paint);
        }
        break;
    }
  }

  void _paintShadows(Canvas canvas, Rect rect, TextDirection textDirection) {
    if (_decoration.boxShadow == null) return;
    for (BoxShadow boxShadow in _decoration.boxShadow) {
      final Paint paint = boxShadow.toPaint();
      final Rect bounds =
          rect.shift(boxShadow.offset).inflate(boxShadow.spreadRadius);
      _paintBox(canvas, bounds, paint, textDirection);
    }
  }

  void _paintBackgroundColor(
      Canvas canvas, Rect rect, TextDirection textDirection) {
    if (_decoration.color != null || _decoration.gradient != null)
      _paintBox(canvas, rect, _getBackgroundPaint(rect, textDirection),
          textDirection);
  }

  DecorationImagePainter _imagePainter;

  void _paintBackgroundImage(
      Canvas canvas, Rect rect, ImageConfiguration configuration) {
    if (_decoration.image == null) return;
    _imagePainter ??= _decoration.image.createPainter(onChanged);
    Path clipPath;
    switch (_decoration.shape) {
      case BoxShape.circle:
        clipPath = Path()..addOval(rect);
        break;
      case BoxShape.rectangle:
        if (_decoration.borderRadius != null)
          clipPath = Path()
            ..addRRect(_decoration.borderRadius
                .resolve(configuration.textDirection)
                .toRRect(rect));
        break;
    }
    _imagePainter.paint(canvas, rect, clipPath, configuration);
  }

  @override
  void dispose() {
    _imagePainter?.dispose();
    super.dispose();
  }

  /// Paint the box decoration into the given location on the given canvas
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size;
    final TextDirection textDirection = configuration.textDirection;
    _paintShadows(canvas, rect, textDirection);
    _paintBackgroundColor(canvas, rect, textDirection);
    _paintBackgroundImage(canvas, rect, configuration);
    _decoration.border?.paint(
      canvas,
      rect,
      shape: _decoration.shape,
      borderRadius: _decoration.borderRadius,
      textDirection: configuration.textDirection,
    );

    final Rect dash = Rect.fromLTWH(
        rect.left + 2, rect.top + 2, rect.width - 4, rect.height - 4);

    Paint paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1.4
      ..style = PaintingStyle.stroke;

    var gap = 3;
    var redis = 3.0;

    double x1 = dash.left + redis;
    double x2 = dash.left + dash.width - redis;
    double y1 = dash.top + redis;
    double y2 = dash.top + dash.height - redis;

    Path _topPath = getDashedPath(
        a: math.Point(x1, y1), b: math.Point(x2, y1), gap: gap, redis: redis);

    Path _rightPath = getDashedPath(
        a: math.Point(x2, y1), b: math.Point(x2, y2), gap: gap, redis: redis);

    Path _leftPath = getDashedPath(
        a: math.Point(x1, y1), b: math.Point(x1, y2), gap: gap, redis: redis);

    Path _bottomPath = getDashedPath(
        a: math.Point(x1, y2), b: math.Point(x2, y2), gap: gap, redis: redis);

    canvas.drawPath(_topPath, paint);
    canvas.drawPath(_rightPath, paint);
    canvas.drawPath(_leftPath, paint);
    canvas.drawPath(_bottomPath, paint);
  }

  Path getDashedPath({
    @required math.Point<double> a,
    @required math.Point<double> b,
    @required gap,
    @required double redis,
  }) {
    Size size = Size(b.x - a.x, b.y - a.y);
    Path path = Path();
    path.moveTo(a.x, a.y);
    bool shouldDraw = true;
    math.Point currentPoint = math.Point(a.x, a.y);

    num radians = math.atan(size.height / size.width);

    num dx = math.cos(radians) * gap < 0
        ? math.cos(radians) * gap * -1
        : math.cos(radians) * gap;

    num dy = math.sin(radians) * gap < 0
        ? math.sin(radians) * gap * -1
        : math.sin(radians) * gap;

    while (currentPoint.x <= b.x && currentPoint.y <= b.y) {
      shouldDraw
          ? path.lineTo(currentPoint.x, currentPoint.y)
          : path.moveTo(currentPoint.x, currentPoint.y);
      shouldDraw = !shouldDraw;
      currentPoint = math.Point(
        currentPoint.x + dx,
        currentPoint.y + dy,
      );
    }
    return path;
  }

  @override
  String toString() {
    return 'BoxPainter for $_decoration';
  }
}
