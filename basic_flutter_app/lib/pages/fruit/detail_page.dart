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

  Widget _buildBackground() {
    return Container(
        height: MediaQuery.of(context).size.height - 54.0,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent);
  }

  Widget _buildWhiteBackground() {
    return Positioned(
        top: 75.0,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45.0),
                  topRight: Radius.circular(45.0),
                ),
                color: Colors.white),
            height: MediaQuery.of(context).size.height - 100.0,
            width: MediaQuery.of(context).size.width));
  }

  Widget _buildHeroImage() {
    var diameter = 140.0;
    return Positioned(
      top: 20.0,
      left: (MediaQuery.of(context).size.width / 2) - diameter / 2,
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

  Widget _buildDetail() {
    return Positioned(
        top: 200.0,
        left: 25.0,
        right: 25.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(widget.foodName,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 20.0),
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
                height: 65.0,
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
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(bottom: 0.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0)),
                    color: Colors.black),
                height: 50.0,
                child: ListView(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Center(
                          child: Text('\$52.00',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat')),
                        )),
                    Row(children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(top: 1, left: 20),
                          child: Shimmer.fromColors(
                            baseColor: Colors.white70,
                            highlightColor: Colors.yellow,
                            child: Text(
                              '>>>>>>',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ))
                    ])
                  ],
                ),
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: ListView(children: [
        Stack(children: [
          _buildBackground(),
          _buildWhiteBackground(),
          _buildHeroImage(),
          _buildDetail()
        ])
      ]),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Details',
            style: TextStyle(
                fontFamily: 'Montserrat', fontSize: 18.0, color: Colors.white)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
            color: Colors.white,
          )
        ],
      ),
    );
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
            height: 50.0,
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
