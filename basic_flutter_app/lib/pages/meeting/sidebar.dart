import 'package:flutter/material.dart';
import 'package:we_rate_dogs/pages/meeting/slider.dart';

import 'meeting_widgets.dart';

class MeetRequirementSideBar extends StatefulWidget {
  MeetRequirementSideBar(this.constraints);

  final BoxConstraints constraints;

  @override
  _MeetRequirementSideBarState createState() => _MeetRequirementSideBarState();
}

class _MeetRequirementSideBarState extends State<MeetRequirementSideBar> {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        Container(
            child: Material(
                child: Container(
                    padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          new Text("Filter", style: TextStyle(fontSize: 23)),
                          Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 30),
                            child: new Text("Who are you looking for?",
                                style: TextStyle(fontSize: 18)),
                          ),
                          SingleSelector(),
                          SizedBox(
                            height: 30,
                          ),
                          new Container(
                            color: Colors.grey,
                            height: 0.5,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          new Text("Interests", style: TextStyle(fontSize: 23)),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              MeetingChoice(
                                  height: 43,
                                  width: 85,
                                  text: "Cinema",
                                  selected: true),
                              MeetingChoice(
                                  height: 43,
                                  width: 85,
                                  text: "Bowling",
                                  selected: true),
                              MeetingChoice(
                                  height: 43,
                                  width: 85,
                                  text: "Tattoo",
                                  selected: true),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              MeetingChoice(
                                  height: 43,
                                  width: 85,
                                  text: "Billiards",
                                  selected: true),
                              MeetingChoice(
                                  height: 43,
                                  width: 135,
                                  text: "To drink coffee",
                                  selected: true),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 320,
                            padding: EdgeInsets.only(
                              top: 15,
                              bottom: 15,
                              left: 30,
                              right: 30,
                            ),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 0.5)),
                            child:
                                Center(child: Text("Choose other interests")),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          IntrinsicHeight(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Text("Distance",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20)),
                                    ),
                                  ),
                                  Expanded(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Icon(Icons.location_on,
                                          size: 12, color: Colors.grey),
                                      Text("15 km",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 14))
                                    ],
                                  )),
                                ]),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          MySlider(),
                          SizedBox(
                            height: 30,
                          ),
                          IntrinsicHeight(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Text("Distance",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20)),
                                    ),
                                  ),
                                  Expanded(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Icon(Icons.location_on,
                                          size: 12, color: Colors.grey),
                                      Text("15 km",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 14))
                                    ],
                                  )),
                                ]),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          MySlider()
                        ])))),
      ],
    );
    ;
  }
}
