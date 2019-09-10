import 'package:flutter/material.dart';

import 'child_updatable.dart';
import 'condo_config.dart';

class AboutUsPage extends StatefulWidget {
  @override
  AboutUsPageState createState() => AboutUsPageState();

  const AboutUsPage({Key key}) : super(key: key);
}

class AboutUsPageState extends State<AboutUsPage>
    with TickerProviderStateMixin
    implements Fragment {
  int i = 0;
  AnimationController _controller;
  Animation<Offset> position;
  Animation<double> resize;

  void play() {
//    Facilities.

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
                      child: Container(
                    child: Column(
                        children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(15),
                        child: Image.asset(
                          "assets/condo/about.jpg",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                            "Mi Casa, or “My Home” in Spanish, is just five minutes’ walk from the Choa Chu Kang MRT and LRT stations, bus interchange, community library and the bustling Lot 1 Shoppers’ Mall. Mi Casa, which comprises 457 units, offers the perfect mix of convenience, accessibility and quiet sanctuary. The development encompasses 2, 2+1, 3, 3+1 and 4 bedroom units to suit your needs."),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                            "While well connected with major arterial roads and expressways like Choa Chu Kang Way, Choa Chu Kang Road and Kranji Expressway (KJE), Mi Casa still preserves an air of serenity with Choa Chu Kang Park at its border. It is also the first new private condominium project that the Choa Chu Kang town centre has seen in eight years. Choa Chu Kang, part of the West Region of the Urban Redevelopment Authority’s Masterplan 2008, is also slated for enhancement and growth."),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                            "In addition to the numerous schools that Choa Chu Kang already has, like Bukit Panjang Government High School and Pioneer Junior College, it will soon be home of the second regional campus of the Institute of Technical Education (ITE)."),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                            "Mi Casa, designed to look like the picturesque stark white homes on Greek islands like Santorini and Mykonos, will bring the Mediterranean right to our local shores. To capture the feeling of the Mediterranean, there are purpose-built private islands in the development. These literally float on the water, with a small causeway joining them to the “mainland”. On these private islands, couples can spend romantic time together, or families can hold barbecue cookouts – these islands come complete with a fully-equipped kitchen, stoves, and refrigerators included."),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Mi Casa Facilities",
                            style:
                                TextStyle(fontSize: 24, color: condorTextColor),
                          ),
                        ),
                      ),
                    ]..addAll(Facilities.map((condoMenu) {
                            return Container(
                              padding:
                                  EdgeInsets.only(left: 15, top: 5, bottom: 5),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "\u2022  $condoMenu",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            );
                          }))),
                  )),
                ))));
  }
}
