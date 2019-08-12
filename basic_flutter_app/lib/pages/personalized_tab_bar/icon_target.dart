import 'package:flutter/material.dart';
import 'package:we_rate_dogs/pages/personalized_tab_bar/tab_item.dart';

import 'dash_box_decoration.dart';

class IconTarget extends StatefulWidget {
  final IconData data;
  final double size;

  IconTarget({
    Key key,
    @required this.data,
    this.size,
  }) : super(key: key);

  @override
  IconTargetState createState() => IconTargetState();
}

class IconTargetState extends State<IconTarget> {
  IconData data;
  bool accept = false;

  @override
  void initState() {
    data = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget(
        builder: (context, List<TabItem> candidateData, rejectedData) {
      if (this.data == null) {
        return new Container(
            width: widget.size,
            height: widget.size,
            decoration: DashBoxDecoration(
              dashBorder: new Border(
                top: new BorderSide(width: 0.5, color: Colors.grey),
                bottom: new BorderSide(width: 0.5, color: Colors.grey),
              ),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ));
      } else {
        Icon icon = Icon(data, size: widget.size);
        if (accept) {
          return Container(
            decoration: DashBoxDecoration(
              color: Colors.transparent,
              dashBorder: new Border(
                top: new BorderSide(width: 0.5, color: Colors.grey),
                bottom: new BorderSide(width: 0.5, color: Colors.grey),
              ),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            width: 80,
            height: 80,
            child: icon,
          );
        } else {
          return icon;
        }
      }
    }, onWillAccept: (data) {
      this.accept = true;
      setState(() {});
      return true;
    }, onAccept: (data) {
      TabItem d = data as TabItem;
      this.data = d.data;
      this.accept = false;
      setState(() {});
    }, onLeave: (data) {
      this.accept = false;
    });
  }
}
