import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'child_updatable.dart';
import 'condo_config.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => ProfilePageState();

  const ProfilePage({Key key}) : super(key: key);
}

class ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin
    implements Fragment {
  int i = 0;
  AnimationController _controller;
  ScrollController _scrollController;

  Animation<Offset> position;
  Animation<double> resize;

  void play() {
    _controller.forward(from: 0.0);
  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

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
    _refreshController = RefreshController(initialRefresh: false);
  }

  RefreshController _refreshController;
  Color canceledColor = Color(0xffcccccc);

  Widget buildRow({String title, String value}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(value),
          )
        ],
      ),
    );
  }

  Widget buildFacilityBooking() {
    return Container(
//      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          buildRow(title: "Name", value: "Johnny"),
          buildRow(title: "User Id", value: "Johnny"),
          buildRow(title: "Mobile No.", value: "Johnny"),
          buildRow(title: "Home Tel No.", value: "Johnny"),
          buildRow(title: "Email", value: "Johnny"),
          buildRow(title: "Vehicle No.", value: "Johnny"),
          buildRow(title: "Unit No.", value: "Johnny"),
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: CondoBotton("CHANGE PASSWORD"),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, top: 30, right: 30),
            child: CondoBotton("EDIT PROFILE"),
          )

//          CondoBotton("EDIT PROFILE")
        ],
      ),
    );
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
                child: Container(
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: buildFacilityBooking(),
                    )))));
  }
}
