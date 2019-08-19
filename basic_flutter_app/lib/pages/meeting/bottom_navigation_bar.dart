import 'package:flutter/material.dart';

class MyBottom extends StatefulWidget {
  @override
  _MyBottomState createState() => _MyBottomState();
}

const CURVE_HEIGHT = 160.0;
const AVATAR_RADIUS = CURVE_HEIGHT * 0.28;
const AVATAR_DIAMETER = AVATAR_RADIUS * 2;

class _MyBottomState extends State<MyBottom> {
  int currentIndex = 1;
  Color normal = Color(0xFFA1B7CB);
  Color active = Color(0xFFFE5F63);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Material(
              color: Colors.transparent,
              child: IconButton(
                onPressed: () {
                  currentIndex = 1;
                  setState(() {});
                },
                icon: Icon(Icons.access_time,
                    size: 23, color: (currentIndex == 1) ? active : normal),
              )),
          IconButton(
            onPressed: () {
              currentIndex = 2;
              setState(() {});
            },
            icon: Icon(Icons.chat,
                size: 23, color: (currentIndex == 2) ? active : normal),
          ),
          IconButton(
            onPressed: () {
              currentIndex = 3;
              setState(() {});
            },
            icon: Icon(Icons.person,
                size: 23, color: (currentIndex == 3) ? active : normal),
          )
        ],
      ),
    );
  }
}