import 'package:flutter/material.dart';

typedef ValueShouldChanged<T> = bool Function(T value);

class WidgetTest extends StatefulWidget {
  @override
  _WidgetTestState createState() => _WidgetTestState();
}

class _WidgetTestState extends State<WidgetTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.purple,
            child: Center(
                child: Material(
                    child: InkWell(
                        onTap: () {
                          print("==xx==|| ===");
                        },
                        child: Ink(
                            width: 400,
                            height: 300,
                            decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                gradient: RadialGradient(colors: [
                                  Colors.orange,
                                  Colors.brown,
                                ])),
                            child: Container(child: MeetSlider())))))));
  }
}

class MeetSlider extends StatefulWidget {
  @override
  _MeetSliderState createState() => _MeetSliderState();
}

class _MeetSliderState extends State<MeetSlider> {
  double value = 1.0;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        inactiveTrackColor: Colors.grey,
        activeTrackColor: active,
        thumbShape: MeetSliderThumbShape(),
//                                trackShape: _CustomThumbShape(),
      ),
      child: Slider(
        value: value,
        onChanged: (val) {
          this.value = val;
          setState(() {});
        },
      ),
    );
  }
}

class MeetRangeSlider extends StatefulWidget {
  @override
  MeetRangeSliderState createState() => MeetRangeSliderState();
}

const Color active = Color(0xFFFE5F63);

class MeetRangeSliderState extends State<MeetRangeSlider> {
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

class MeetSliderThumbShape extends RoundSliderThumbShape {
  static const double _thumbSize = 4.0;

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double> activationAnimation,
    @required Animation<double> enableAnimation,
    bool isDiscrete,
    TextPainter labelPainter,
    RenderBox parentBox,
    @required SliderThemeData sliderTheme,
    TextDirection textDirection,
    double value,
  }) {
    assert(context != null);
    assert(center != null);
    assert(enableAnimation != null);
    assert(sliderTheme != null);
    assert(sliderTheme.disabledThumbColor != null);
    assert(sliderTheme.thumbColor != null);

    final Canvas canvas = context.canvas;
    final Tween<double> radiusTween = Tween<double>(
      begin: enabledThumbRadius,
      end: enabledThumbRadius,
    );
    final Paint lightBluePaint = Paint()
      ..color = Color(0xFFFE5F63).withOpacity(0.5);
    canvas.drawCircle(center, 29 / 2, lightBluePaint);
    final Paint white = Paint()..color = Colors.white;
    canvas.drawCircle(center, 26 / 2, white);
    final Paint cen = Paint()..color = Color(0xFFFE5F63);
    canvas.drawCircle(center, 13 / 2, cen);
  }
}

class MeetingChoice extends StatefulWidget {
  const MeetingChoice(
      {Key key,
      this.text,
      this.width,
      this.height,
      this.selected,
      this.onChange})
      : super(key: key);

  @override
  _MeetingChoiceState createState() => _MeetingChoiceState();
  final String text;
  final double width;
  final double height;
  final bool selected;
  final ValueShouldChanged<bool> onChange;
}

class _MeetingChoiceState extends State<MeetingChoice>
    with TickerProviderStateMixin {
  bool selected;
  AnimationController animationController;

  Animation<Color> backgroundColor;
  Animation<Color> fontColor;
  Animation<Color> borderColor;

  @override
  void initState() {
    super.initState();
    this.selected = widget.selected;
    initAnimation();
  }

  void setChange(bool selected) {
    if (this.selected != selected) {
      this.selected = selected;
      if (!selected) {
        animationController.forward(from: 0.0);
      } else {
        animationController.reverse(from: 1.0);
      }
    }
  }

  void initAnimation() {
    this.animationController = new AnimationController(
        duration: Duration(milliseconds: 400),
        value: (!selected) ? 1.0 : 0,
        vsync: this);

    borderColor = new ColorTween(begin: Colors.transparent, end: Colors.grey)
        .animate(new CurvedAnimation(
      parent: animationController,
      curve: new Interval(
        0.0,
        1.0,
        curve: Curves.easeInToLinear,
      ),
    ));

    fontColor = new ColorTween(begin: Colors.white, end: Colors.black)
        .animate(new CurvedAnimation(
      parent: animationController,
      curve: new Interval(
        0.0,
        1.0,
        curve: Curves.easeInToLinear,
      ),
    ));

    backgroundColor = new ColorTween(begin: active, end: Colors.transparent)
        .animate(new CurvedAnimation(
      parent: animationController,
      curve: new Interval(
        0.0,
        0.5,
        curve: Curves.linearToEaseOut,
      ),
    ));
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Ink container = Ink(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          color: backgroundColor.value,
          borderRadius: BorderRadius.all(Radius.circular(2)),
          border: Border.all(color: borderColor.value, width: 0.5)),
      child: Center(
        child: Text(widget.text,
            style: TextStyle(fontSize: 16, color: fontColor.value)),
      ),
    );

    return InkWell(
      onTap: () {
        if (widget.onChange != null) {
          bool should = widget.onChange(!this.selected);
          if (should) {
            setChange(!this.selected);
          }
        } else {
          setChange(!this.selected);
        }
      },
      child: container,
    );
  }
}

class SingleSelector extends StatefulWidget {
  @override
  _SingleSelectorState createState() => _SingleSelectorState();
}

class _SingleSelectorState extends State<SingleSelector> {
  String selected;
  double height = 43;
  double width = 138;
  var one = new GlobalKey<_MeetingChoiceState>();
  var two = new GlobalKey<_MeetingChoiceState>();

  @override
  void initState() {
    super.initState();
    this.selected = "Man";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        MeetingChoice(
            key: one,
            height: height,
            onChange: (newValue) {
              two.currentState.setChange(!newValue);
              return true;
            },
            width: width,
            text: "Man",
            selected: false),
        MeetingChoice(
            onChange: (newValue) {
              one.currentState.setChange(!newValue);
              return true;
            },
            key: two,
            height: height,
            width: width,
            text: "Woman",
            selected: true)
      ],
    );
  }
}
