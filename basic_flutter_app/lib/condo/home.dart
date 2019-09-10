import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'child_updatable.dart';
import 'condo_config.dart';

class CondoHome extends StatefulWidget {
  @override
  CondoHomeStatus createState() => CondoHomeStatus();
  final ValueChanged<int> valueChanged;

  const CondoHome({Key key, this.valueChanged}) : super(key: key);
}

class CondoHomeStatus extends State<CondoHome>
    with TickerProviderStateMixin
    implements Fragment {
  int i = 0;
  AnimationController _controller;
  Animation<Offset> position;
  Animation<double> resize;

  void play() {
    _controller.forward(from: 0.0);
  }

  @override
  void initState() {
    super.initState();
    this._controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 400));
    position = Tween(begin: Offset(1, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    resize = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.50,
        1.00,
        curve: Curves.linear,
      ),
    ));

    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward(from: 0.0);
  }

  List<Widget> buildIcon() {
    return CondoMenus.asMap().entries.map((condoMenuEntry) {
      var condoMenu = condoMenuEntry.value;
      if (condoMenu.title == "HOME") {
        return Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              Text("WELCOME",
                  style: TextStyle(color: condorTextColor, fontSize: 26)),
              Image.asset("assets/condo/mi-casa.jpg")
            ]));
      }

      return Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            widget.valueChanged(condoMenuEntry.key);
          },
          child: Ink(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(1, 3),
                  spreadRadius: 1,
                )
              ],
            ),
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(condoMenu.iconData, color: condorTextColor),
                  SizedBox(
                    height: 5,
                  ),
                  Text(condoMenu.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(color: condorTextColor))
                ],
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  List<StaggeredTile> buildStaggeredTile() {
    List<StaggeredTile> result = [];
    for (int i = 0; i < CondoMenus.length; i++) {
      if (i == 0) {
        result.add(StaggeredTile.extent(2, 160.0));
      } else {
        result.add(StaggeredTile.extent(1, 120.0));
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: position,
      child: ScaleTransition(
          scale: resize,
          child: Material(
              color: condoBackgroundColor,
              elevation: 16,
              child: StaggeredGridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                staggeredTiles: buildStaggeredTile(),
                children: buildIcon(),
              ))),
    );
  }
}
