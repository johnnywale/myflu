import 'package:flutter/material.dart';
import 'package:progress_hud/progress_hud.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'child_updatable.dart';
import 'condo_config.dart';

class EventPage extends StatefulWidget {
  @override
  EventPageState createState() => EventPageState();

  const EventPage({Key key}) : super(key: key);
}

class EventPageState extends State<EventPage>
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

  void _onLoading() async {
    var hud = new ProgressHUD(
      backgroundColor: Colors.transparent,
      color: Colors.grey,
      containerColor: Colors.grey[50].withOpacity(0.9),
      borderRadius: 20.0,
      text: 'Loading...',
    );

    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Material(
            shadowColor: Colors.transparent,
            color: Colors.black,
            elevation: 0,
            type: MaterialType.transparency,
            child: Center(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              height: 100,
              width: 100,
              child: hud,
            )));
      },
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ),
          child: child,
        );
      },
    );
    await Future.delayed(Duration(milliseconds: 300));
    //  total = total + batch;
    _refreshController.loadComplete();
    Navigator.pop(context);
    if (mounted) setState(() {});
  }

  Widget generate() {
    return SmartRefresher(
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropMaterialHeader(
          color: Colors.white,
          backgroundColor: Color(0xFF21BFBD),
        ),
        child: ListView.builder(
            controller: _scrollController,
            itemCount: 20,
            itemBuilder: (context, index) {
              if (index < 1) {
                return Container(
                  height: 20,
                  color: Colors.transparent,
                );
              }
              return Container(
                height: 20,
                color: Colors.yellow,
              );
            }));
  }

  Color canceledColor = Color(0xffcccccc);

  Widget buildFacilityBooking() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: () {
          print("||");
        },

        child: Container(
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 0.5, color: canceledColor))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Ink(
                  color: condoBackgroundColor,
                  child: Ink(
                    decoration: BoxDecoration(
                      color: condoBackgroundColor,
                    ),
                    padding: EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          "1 DAY DESARU - NATURE TOUR-",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                        RichText(
                            text: TextSpan(
                                text: 'Fri Nov 24 2017 GMT+0800',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Color(0xfffbb041),
                                )),
                            textDirection: TextDirection.rtl),
                      ],
                    ),
                  )),
              Icon(
                Icons.arrow_forward_ios,
                color: condoActionbarColor,
              )
            ],
          ),
        ),
//        ),
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
