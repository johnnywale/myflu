import 'package:flutter/material.dart';

class MeetingChatPage extends StatefulWidget {
  @override
  MeetingChatPageState createState() => MeetingChatPageState();
}

class MeetingChatPageState extends State<MeetingChatPage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool selected = false;
  FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: GestureDetector(
          onTap: () {
            myFocusNode.unfocus();

          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/meeting/chat_background.png'),
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(left: 26, right: 26, top: 15),
                    width: double.infinity,
                    height: 59,
                    color: Color(0xffDDF0E8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Your common interst"),
                        Text(
                          "Billiards",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Container(
            height: 77 + MediaQuery
                .of(context)
                .padding
                .bottom,
            color: Colors.white,
            padding: EdgeInsets.only(
                left: 14,
                right: 14,
                bottom: MediaQuery
                    .of(context)
                    .padding
                    .bottom),
            child: Center(
              child: TextField(
                focusNode: myFocusNode,
                cursorColor: Colors.greenAccent,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.4),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.4),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.red, width: 0),
                    ),
                    hoverColor: Colors.deepPurpleAccent,
                    focusColor: Colors.pink,
                    fillColor: Colors.deepOrange,
                    hintText: 'Type a Message'),
              ),
            )),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            color: Colors.black,
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back, color: Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.info_outline,
                size: 30,
                color: Colors.grey,
              ),
              color: Colors.black,
              onPressed: () {},
            ),
          ],
          title: Row(children: [
            Image.asset("assets/meeting/avart.png"),
            SizedBox(
              width: 10,
            ),
            Text(
              "Kristina L.",
              style: TextStyle(color: Colors.black87),
            ),
            SizedBox(
              width: 10,
            ),
          ]),
        ));
  }
}
