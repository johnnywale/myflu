import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailsPage extends StatefulWidget {
  final heroTag;
  final foodName;
  final foodPrice;
  final image;

  DetailsPage({this.heroTag, this.foodName, this.foodPrice, this.image});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var selectedCard = 'WEIGHT';
  var color = Color(0xFF7A9BEE);

  ScrollController _scrollController;
  ColorTween colorTween = ColorTween(begin: Colors.black, end: Colors.white);
  Color titleColor = Colors.black;
  double diameter;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      var size = (MediaQuery
          .of(context)
          .size
          .width / 5 * 3 + 100) / 2;
      if (mounted) {
        setState(() {
          if (_scrollController.offset > size) {
            titleColor = Colors.white;
          } else {
            titleColor = colorTween.lerp(_scrollController.offset / size);
          }
          print(" ${_scrollController.offset}");
        });
      }
    });

    super.initState();
  }

  //

  Widget _buildHeroImage() {
    return Container(
      height: diameter,
      child: Hero(
          tag: widget.heroTag,
          child: Container(
              decoration: new BoxDecoration(shape: BoxShape.circle, boxShadow: [
                new BoxShadow(
                    color: Colors.blueGrey,
                    blurRadius: 2,
                    offset: Offset(1, 0.5))
              ]),
              child: new ClipRRect(
                child: Image(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover,
                    height: diameter,
                    width: diameter),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(diameter / 2),
                  topRight: Radius.circular(diameter / 2),
                  bottomLeft: Radius.circular(diameter / 2),
                  bottomRight: Radius.circular(diameter / 2),
                ),
              ))),
    );
  }

  Widget material(Widget widget) {
    return Material(
        elevation: 0,
        child: Container(
          //    height: 2.0,
          width: 25.0,
          color: color,
          child: widget,
        ));
  }

  Widget _buildBottom() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(top: 20.0, left: 30, right: 30, bottom: 30),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0)),
              color: Colors.black),
          height: 50.0,
          child: Center(
            child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Stack(children: <Widget>[
                  Align(
                    widthFactor: 1.0,
                    child: Shimmer.fromColors(
                      baseColor: Colors.white70,
                      highlightColor: Colors.yellow,
                      child: Text(
                        '> > > >',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text('\$52.00',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Montserrat')),
                  )
                ])),
          ),
        ),
      ),
    );
  }

  Widget _buildDetail() {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height - 70,
      color: Colors.white,
      padding: EdgeInsets.all(30),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(widget.foodPrice,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20.0,
                        color: Colors.grey)),
                Container(height: 25.0, color: Colors.grey, width: 1.0),
                Container(
                  width: 125.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17.0),
                      color: Color(0xFF7A9BEE)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      material(InkWell(
                        onTap: () {
                          print("---||----");
                        },
                        child: Container(
                          height: 25.0,
                          width: 25.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              color: color),
                          child: Center(
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 20.0,
                            ),
                          ),
                        ),
                      )),
                      Text('2',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: 15.0)),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 25.0,
                          width: 25.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              color: Colors.white),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: color,
                              size: 20.0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 20.0),
            Container(
                height: 120.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _buildInfoCard('WEIGHT', '300', 'G'),
                    SizedBox(width: 10.0),
                    _buildInfoCard('CALORIES', '267', 'CAL'),
                    SizedBox(width: 10.0),
                    _buildInfoCard('VITAMINS', 'A, B6', 'VIT'),
                    SizedBox(width: 10.0),
                    _buildInfoCard('AVAIL', 'NO', 'AV')
                  ],
                )),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    diameter = MediaQuery
        .of(context)
        .size
        .width / 5 * 3;
    var textHeight = 44;
    print("diameter is $diameter");
    double totalHeight = diameter + textHeight;
    print("total is $totalHeight");
    double top = 20 + diameter / 2;
    double bottom = textHeight - 20 + diameter / 2;
    print("top is $top , bottom is $bottom");

    EdgeInsets padding = MediaQuery
        .of(context)
        .padding;

//          var   safeTop = math.max(top ? padding.top : 0.0, minimum.top),

    return Material(
        type: MaterialType.canvas,
        color: Colors.white,
        child: Scaffold(
          bottomNavigationBar: Material(child: _buildBottom()),
          body: CustomScrollView(
              physics: new ClampingScrollPhysics(),
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )
                  ],
                  expandedHeight: totalHeight,
                  backgroundColor: color,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(widget.foodName,
                            style: TextStyle(fontSize: 12, color: titleColor))
                    ),
//                    titlePadding: EdgeInsets.all(0.0),
                    centerTitle: false,
                    background: Container(
                      // height: diameter + 100,
                      color: Colors.transparent,
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                              child: Column(
                                children: <Widget>[
                                  SafeArea(
                                    child: new LayoutBuilder(builder:
                                        (BuildContext context,
                                        BoxConstraints constraints) {
                                      // constraints variable has the size info
                                      return Container();
                                    }),
                                  ),
                                  Container(
                                      height: top,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(45.0),
                                            topRight: Radius.circular(45.0),
                                          ),
                                          color: Colors.transparent)),
                                  Container(
                                      height: bottom,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(45.0),
                                            topRight: Radius.circular(45.0),
                                          ),
                                          color: Colors.white))
                                ],
                              )),
                          _buildHeroImage()
                        ],
                      ),
                    ),
                  ),
                  elevation: 0,
                  forceElevated: true,
                  pinned: true,
                  floating: true,
                ),
//            SliverPersistentHeader(
//              delegate: _FruitAppBarDelegate(
//                  topArea(),
//              ),
//              pinned: true,
//            ),
                new SliverList(
                  delegate: new SliverChildListDelegate(
                    new List.generate(1, (int index) => _buildDetail()),
                  ),
                )
              ]),
          // _buildFab(),
        ));
  }

  Widget _buildInfoCard(String cardTitle, String info, String unit) {
    return InkWell(
        onTap: () {
          selectCard(cardTitle);
        },
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color:
              cardTitle == selectedCard ? Color(0xFF7A9BEE) : Colors.white,
              border: Border.all(
                  color: cardTitle == selectedCard
                      ? Colors.transparent
                      : Colors.grey.withOpacity(0.3),
                  style: BorderStyle.solid,
                  width: 0.75),
            ),
            height: 120.0,
            width: 80.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                    child: Text(cardTitle,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          color: cardTitle == selectedCard
                              ? Colors.white
                              : Colors.grey.withOpacity(0.7),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(info,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14.0,
                                color: cardTitle == selectedCard
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text(unit,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              color: cardTitle == selectedCard
                                  ? Colors.white
                                  : Colors.black,
                            ))
                      ],
                    ),
                  )
                ])));
  }

  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}

class _FruitAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _FruitAppBarDelegate(this.child);

  @override
  double get minExtent => 151;

  @override
  double get maxExtent => 151;

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return new Container(
      child: child,
      color: Colors.white,
    );
  }

  @override
  bool shouldRebuild(_FruitAppBarDelegate oldDelegate) {
    return false;
  }
}
