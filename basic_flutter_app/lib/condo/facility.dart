import 'package:flutter/material.dart';
import 'package:progress_hud/progress_hud.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'child_updatable.dart';
import 'condo_config.dart';
import 'facility_booking.dart';

class FacilityPage extends StatefulWidget {
  @override
  FacilityPageState createState() => FacilityPageState();

  const FacilityPage({Key key}) : super(key: key);
}

class FacilityPageState extends State<FacilityPage>
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

  Widget buildFacilityCard() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return new FacilityBookingPage();
        }));
      },
      child: Ink(
        padding: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Container(
              color: Colors.orange,
              width: double.infinity,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  Container(
                    child: Image.asset(
                        "assets/condo/facilities/img-facilities-gym.jpg",
                        fit: BoxFit.contain),
                    width: double.infinity,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                            child: Text(
                              "GYMNASIUM",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            padding: EdgeInsets.only(left: 20, bottom: 5)),
                        Container(
                          height: 11,
                          width: double.infinity,
                          color: Color(0xff3c0e13),
                        )
                      ],
                    ),
                  ),
                ],
              )),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(2)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.14),
                    offset: Offset(0, 2),
                    blurRadius: 2,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, 0),
                    blurRadius: 0,
                  )
                ]),
//                        padding: EdgeInsets.all(24),

            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 12),
                  child: Text(
                    "For Residents Only",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 12),
                  child: Text(
                    "Open Daily 06:00 - 23:00",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 24),
                  child: RichText(
                    text: new TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: new TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        new TextSpan(
                            text: 'Remarks:',
                            style: new TextStyle(fontWeight: FontWeight.bold)),
                        new TextSpan(
                            text:
                                ' Children under 12 years old should be accompanied by adult.',
                            style: new TextStyle()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
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
                    child: SingleChildScrollView(
                      child: buildFacilityCard(),
                    )))));
  }
}
