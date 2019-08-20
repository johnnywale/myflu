import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  @override
  _MyBottomState createState() => _MyBottomState();
}

const Color active = Color(0xFFFE5F63);

class _MyBottomState extends State<MySlider> {
  RangeValues rangeValue = RangeValues(0.3, 0.7);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
          rangeThumbShape: _CustomRangeThumbShape(),
          inactiveTrackColor: Colors.grey
// ...
          ),
      child: RangeSlider(
        values: rangeValue,
        activeColor: active,
        onChanged: (RangeValues values) {
          setState(() {
            rangeValue = values;
          });
        },
      ),
    );
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
  }
}
