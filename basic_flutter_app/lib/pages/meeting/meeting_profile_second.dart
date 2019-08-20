import 'package:flutter/material.dart';
import 'package:we_rate_dogs/pages/meeting/meeting_one.dart';
import 'package:we_rate_dogs/pages/meeting/profile_slide.dart';

class MeetingSecondLayer extends StatefulWidget {
  const MeetingSecondLayer(
      {Key key, this.percentage, this.image, this.sizeController})
      : super(key: key);

  @override
  MeetingSecondLayerState createState() => MeetingSecondLayerState();
  final double percentage;
  final String image;
  final SizeController sizeController;
}

class MeetingSecondLayerState extends State<MeetingSecondLayer> {
  double percentage;
  String image;

  setPercentage(double percentage) {
    if (this.percentage != percentage) {
      setState(() {
        this.percentage = percentage;
      });
    }
  }

  setImage(String image) {
    if (this.image != image) {
      setState(() {
        print("second change profile==$image");

        this.image = image;
      });
    }
  }

  setNextImage(String image) {
    this.image = image;
    this.percentage = 0;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    percentage = widget.percentage;
    image = widget.image;
  }

  @override
  Widget build(BuildContext context) {
    if (percentage == 0) {
      return Padding(
        padding: EdgeInsets.only(top: 15* widget.sizeController.resize),
        child: new Opacity(
          opacity: 1,
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: new Border.all(width: 0.0, color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 24,
                        spreadRadius: 0,
                        color: Colors.black.withAlpha(10)),
                  ]),
              height: 414 * widget.sizeController.resize,
              width: 324 * widget.sizeController.resize),
        ),
      );
    } else {
      return Transform.scale(
          scale: 0.8 + 0.2 * percentage,
          alignment: Alignment.center,
          child: new Opacity(
            opacity: 0.8 + 0.2 * percentage,
            child: ProfileSlider(
              sizeController: widget.sizeController,
              image: this.image,
              imageOnly: true,
            ),
          ));
    }
  }
}
