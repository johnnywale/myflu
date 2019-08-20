import 'package:flutter/material.dart';
import 'package:we_rate_dogs/pages/meeting/meeting_one.dart';

class ProfileSlider extends StatefulWidget {
  const ProfileSlider({
    Key key,
    this.image,
    this.imageOnly = false,
    this.sizeController,
  }) : super(key: key);

  @override
  ProfileSliderState createState() => ProfileSliderState();
  final String image;
  final bool imageOnly;
  final SizeController sizeController;
}

class ProfileSliderState extends State<ProfileSlider> {
  PageController scrollController;
  var indicatorKey = new GlobalKey<IndicatorState>();
  int currentPage = 0;
  double imageHeight;
  double imageWidth;

  @override
  void initState() {
    super.initState();
    imageHeight = 397 * widget.sizeController.resize;
    imageWidth = 313 * widget.sizeController.resize;

    scrollController = new PageController(initialPage: 0);
    scrollController.addListener(() {
      int page = scrollController.page.round();
      indicatorKey.currentState.setCurrentPage(page);
    });
  }

  Widget getImageOnly() {
    return Container(
        height: imageHeight,
        width: imageWidth,
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(widget.image),
          // ...
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 31 * widget.sizeController.resize),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            border: new Border.all(width: 0.1, color: Colors.transparent),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 24,
                  spreadRadius: 0,
                  color: Colors.black.withAlpha(10)),
            ]),
        height: 533 * widget.sizeController.resize,
        width: 352 * widget.sizeController.resize,
        child: Padding(
            padding: EdgeInsets.all(16 * widget.sizeController.resize),
            child: Column(
              children: <Widget>[
                FractionallySizedBox(
                    widthFactor: 1,
                    child: widget.imageOnly
                        ? getImageOnly()
                        : Container(
                            height: imageHeight,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: <Widget>[
                                PageView(
                                  controller: scrollController,
                                  physics: ClampingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    Container(
                                        height: imageHeight,
                                        width: imageWidth,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(widget.image),
                                          // ...
                                        ))),
                                    Container(
                                        height: imageHeight,
                                        width: imageWidth,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(widget.image),
                                        ))),
                                    Container(
                                        height: imageHeight,
                                        width: imageWidth,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(widget.image),
                                          // ...
                                        )))
                                  ],
                                ),
                                Positioned(
                                  top: 33,
                                  //  left: (320 - 104) / 2,
                                  child: Indicator(
                                    total: 3,
                                    height: 2,
                                    currentPage: currentPage,
                                    key: indicatorKey,
                                  ),
                                )
                              ],
                            ))),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.only(
                            top: 10 * widget.sizeController.resize),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text("Svetland Henderson, 21",
                                    style: TextStyle(
                                        fontSize:
                                            19 * widget.sizeController.resize,
                                        fontWeight: FontWeight.w700)),
                                Container(
                                  margin: EdgeInsets.only(left: 4),
                                  decoration: new BoxDecoration(
                                      color: Color.fromARGB(255, 204, 233, 240),
                                      shape: BoxShape.circle),
                                  padding: EdgeInsets.all(3),
                                  child: Icon(Icons.check,
                                      size: 15 * widget.sizeController.resize,
                                      color: Colors.white),
                                )
                              ],
                            ),
                            SizedBox(height: 10 * widget.sizeController.resize),
                            Row(
                              children: <Widget>[
                                Icon(Icons.location_on,
                                    size: 15 * widget.sizeController.resize,
                                    color: Colors.grey),
                                Text("Russian,Moscow (7km)",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize:
                                            14 * widget.sizeController.resize,
                                        fontWeight: FontWeight.w300))
                              ],
                            ),
                            SizedBox(height: 10 * widget.sizeController.resize),
                            Container(
                              height: 0.5 * widget.sizeController.resize,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 10 * widget.sizeController.resize),
                            Text("Cinema, Photo, Tattoo, Bicycle, Cooking",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14 * widget.sizeController.resize,
                                    fontWeight: FontWeight.w300)),
                          ],
                        )))
              ],
            )),
      ),
    );
  }
}

class Indicator extends StatefulWidget {
  final int currentPage;
  final double height;
  final int total;

  const Indicator(
      {Key key, this.currentPage, this.height = 2, @required this.total})
      : super(key: key);

  @override
  IndicatorState createState() => IndicatorState();
}

class IndicatorState extends State<Indicator> {
  int currentPage;

  setCurrentPage(int currentPage) {
    if (this.currentPage != currentPage) {
      setState(() {
        this.currentPage = currentPage;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    currentPage = widget.currentPage;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    for (int i = 0; i < widget.total; i++) {
      widgets.add(Container(
        color: (currentPage == i) ? Colors.white : Colors.grey.withOpacity(0.8),
        height: widget.height,
        width: 32,
      ));
    }
    return Container(
      width: 104,
      height: widget.height,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: widgets,
      ),
    );
  }
}
