import 'package:flutter/material.dart';
import 'package:we_rate_dogs/pages/meeting/meeting_one.dart';

import 'meeting_chat.dart';

class MeetingProfileMask extends StatefulWidget {
  const MeetingProfileMask(
      {Key key,
      this.agreePercentage,
      this.rejectPercentage,
      this.chatFaction,
      this.congratulationFaction,
      this.rejectOpacityFaction,
      this.descFaction,
      this.sizeController})
      : super(key: key);

  @override
  MeetingProfileMaskState createState() => MeetingProfileMaskState();

  final double agreePercentage;
  final double rejectPercentage;
  final double chatFaction;
  final double congratulationFaction;
  final double rejectOpacityFaction;
  final double descFaction;
  final SizeController sizeController;
}

class MeetingProfileMaskState extends State<MeetingProfileMask> {
  double agreePercentage;
  double chatFaction;
  double congratulationFaction;
  double descFaction;
  double rejectPercentage;
  double rejectOpacityFaction;

  @override
  void initState() {
    super.initState();

    this.agreePercentage = widget.agreePercentage;
    this.rejectPercentage = widget.rejectPercentage;
    this.chatFaction = widget.chatFaction;
    this.congratulationFaction = widget.congratulationFaction;
    this.rejectOpacityFaction = widget.rejectOpacityFaction;
  }

  void setChanges(
      {double agreePercentage,
      double rejectPercentage,
      double chatFaction,
      double congratulationFaction,
      double rejectOpacityFaction,
      double descFaction}) {
    bool changed = false;
    //
    if (this.agreePercentage != agreePercentage) {
      this.agreePercentage = agreePercentage;
      changed = true;
    }
    //
    if (this.rejectPercentage != rejectPercentage) {
      this.rejectPercentage = rejectPercentage;
      changed = true;
    }
    //

    if (this.chatFaction != chatFaction) {
      this.chatFaction = chatFaction;
      changed = true;
    }
    //
    if (this.congratulationFaction != congratulationFaction) {
      this.congratulationFaction = congratulationFaction;
      changed = true;
    }
    //
    if (this.rejectOpacityFaction != rejectOpacityFaction) {
      this.rejectOpacityFaction = rejectOpacityFaction;
      changed = true;
    }
    //

    if (this.descFaction != descFaction) {
      this.descFaction = descFaction;
      changed = true;
    }

    if (changed) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (agreePercentage > 0) {
      return choosenWidget();
    }
    if (rejectPercentage > 0) {
      return new Opacity(
          opacity: 1 - rejectOpacityFaction, child: rejectWidget());
    }
    return IgnorePointer();
  }

  Widget rejectWidget() {
    return Padding(
        padding: EdgeInsets.only(top: 31 * widget.sizeController.resize),
        child: Container(
          width: 352 * widget.sizeController.resize,
          child: Padding(
              padding: EdgeInsets.all(16 * widget.sizeController.resize),
              child: Container(
                height: 397 * widget.sizeController.resize,
                width: 314 * widget.sizeController.resize,
                color: Colors.black.withOpacity(0.6 * rejectPercentage),
              )),
        ));
  }

  Widget choosenWidget() {
    return Padding(
        padding: EdgeInsets.only(top: 31 * widget.sizeController.resize),
        child: Container(
          width: 352 * widget.sizeController.resize,
          child: Padding(
              padding: EdgeInsets.all(16 * widget.sizeController.resize),
              child: Container(
                height: 397 * widget.sizeController.resize,
                width: 314 * widget.sizeController.resize,
                color: Color(0xFFFE5F63).withOpacity(0.9 * agreePercentage),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 60 * widget.sizeController.resize,
                    ),
                    Opacity(
                      opacity: (3 - congratulationFaction) / 3,
                      child: FractionalTranslation(
                          translation: Offset(0, congratulationFaction),
                          child: Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Text("Congratulations!",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18)))),
                    ),
                    Opacity(
                        opacity: (3 - descFaction) / 3,
                        child: FractionalTranslation(
                          translation: Offset(0, descFaction),
                          child: Container(
                              padding:
                                  EdgeInsets.only(top: 20, left: 15, right: 15),
                              child: Text(
                                  "You can chat with Kristina according to your interests",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ))),
                        )),
                    SizedBox(height: 25),
                    Opacity(
                        opacity: (3 - chatFaction) / 3,
                        child: FractionalTranslation(
                            translation: Offset(0, chatFaction),
                            child: Material(
                              color: Colors.transparent,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3)),
                                  color: Colors.white.withOpacity(0.9),
                                ),
                                child: InkWell(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                    onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) => MeetingChatPage())),
                                    child: Center(
                                      child: Text("Go to chat",
                                          style: TextStyle(fontSize: 16)),
                                    )),
                                width: 157,
                                height: 43,
                              ),
                            ))),
                  ],
                ),
              )),
        ));
  }

  void reset() {
    agreePercentage = 0.0;
    chatFaction = 0.0;
    congratulationFaction = 0.0;
    descFaction = 0.0;
    rejectPercentage = 0.0;
    rejectOpacityFaction = 0.0;
    setState(() {});
  }
}
