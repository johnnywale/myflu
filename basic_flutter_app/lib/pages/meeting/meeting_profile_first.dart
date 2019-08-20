import 'package:flutter/widgets.dart';
import 'package:we_rate_dogs/pages/meeting/meeting_one.dart';
import 'package:we_rate_dogs/pages/meeting/profile_slide.dart';

class MeetingFirstLayer extends StatefulWidget {
  const MeetingFirstLayer(
      {Key key, this.image, this.percentage, this.sizeController})
      : super(key: key);

  @override
  MeetingFirstLayerState createState() => MeetingFirstLayerState();

  final String image;
  final double percentage;
  final SizeController sizeController;
}

class MeetingFirstLayerState extends State<MeetingFirstLayer> {
  String image;
  double percentage;

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
    this.image = widget.image;
    this.percentage = widget.percentage;
  }

  @override
  Widget build(BuildContext context) {
    if (percentage == 0) {
      return ProfileSlider(
          sizeController: widget.sizeController,
          image: image,
          imageOnly: false);
    } else {
      return Transform.scale(
          scale: 1 - 0.2 * percentage,
          alignment: Alignment.bottomCenter,
          child: new Opacity(
              opacity: 1 - percentage,
              child: ProfileSlider(
                  sizeController: widget.sizeController,
                  image: image,
                  imageOnly: true)));
      ;
    }
  }
}
