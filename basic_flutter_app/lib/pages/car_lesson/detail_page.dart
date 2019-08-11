import 'package:flutter/material.dart';
import 'package:we_rate_dogs/model/lesson.dart';

class DetailPage extends StatelessWidget {
  final Lesson lesson;

  DetailPage({Key key, this.lesson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final levelIndicator = Container(
      child: Container(
        child: LinearProgressIndicator(
            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
            value: lesson.indicatorValue,
            valueColor: AlwaysStoppedAnimation(Colors.green)),
      ),
    );

    final coursePrice = Container(
      padding: const EdgeInsets.all(4.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text(
        "\$" + lesson.price.toString(),
        style: TextStyle(color: Colors.white),
      ),
    );

//    50+40+15  + 8

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 50.0),
        Icon(
          Icons.directions_car,
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: 0.0),
        Text(
          lesson.title,
          style: TextStyle(color: Colors.white, fontSize: 15.0),
        ),
        SizedBox(height: 0.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(flex: 1, child: levelIndicator),
            Expanded(
                flex: 6,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      lesson.level,
                      style: TextStyle(color: Colors.white),
                    ))),
            Expanded(flex: 1, child: coursePrice)
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: 190,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/drive-steering-wheel.jpg"),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          padding: EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 30.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      lesson.content + lesson.content + lesson.content + lesson.content,
      style: TextStyle(fontSize: 16.0),
    );

    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 0),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () => {},
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child:
              Text("TAKE THIS LESSON", style: TextStyle(color: Colors.white)),
        ));

    final bottomContent = new Container(
      child: new Column(
        children: <Widget>[
          topContent,
          new Expanded(
            flex: 1,
            child: new SingleChildScrollView(
                child: Padding(
              padding: new EdgeInsets.all(16.0),
              child: bottomContentText,
            )
                //  child: bottomContentText,
                ),
          ),
          readButton
        ],
      ),
    );

    //)

    //     );

    return Scaffold(
      body: bottomContent,
    );
  }
}
