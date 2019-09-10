import 'package:flutter/material.dart';
import 'package:we_rate_dogs/condo/welcome.dart';

import 'condo_config.dart';

class CondoLoginPage extends StatefulWidget {
  @override
  CondoLoginState createState() => CondoLoginState();
}

class CondoLoginState extends State<CondoLoginPage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool selected = false;
  FocusNode userFocusNode;
  FocusNode passwordFocusNode;
  Color color = Color(0xffeb8d37);

  @override
  void initState() {
    super.initState();
    userFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    userFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: GestureDetector(
        onTap: () {
          userFocusNode.unfocus();
          passwordFocusNode.unfocus();
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Color(0xfff9f7ea)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image.asset("assets/condo/mi-casa.jpg"),
                ),
                TextFormField(
                  focusNode: userFocusNode,
                  cursorColor: color,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    disabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(2))),
                    //    contentPadding: EdgeInsets.only(top: 40, left: 40),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: color, width: 1, style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(2))),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.pink,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(2))),

                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: color, width: 4, style: BorderStyle.solid),
                      //    borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    fillColor: Colors.pink,
                    focusColor: Colors.pink,
                    hoverColor: Colors.pink,
                    labelStyle: TextStyle(
                      color: color,
                      decorationColor: Colors.grey,
                      //     backgroundColor: Colors.purpleAccent,
                      decorationStyle: TextDecorationStyle.double,
                    ),
                    labelText: 'Username',
                    //    prefixStyle: TextStyle(color: Colors.grey)
                  ),
                ),
                TextFormField(
                  focusNode: passwordFocusNode,
                  obscureText: true,
                  cursorColor: color,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    disabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(2))),
                    //contentPadding: EdgeInsets.only(top: 40, left: 40),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: color, width: 1, style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(2))),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.pink,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(2))),

                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: color, width: 4, style: BorderStyle.solid),
                      //    borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    fillColor: Colors.pink,
                    focusColor: Colors.pink,
                    hoverColor: Colors.pink,
                    labelStyle: TextStyle(
                      color: color,
                      decorationColor: Colors.grey,
                      decorationStyle: TextDecorationStyle.double,
                    ),

                    labelText: 'Password',
                    //    prefixStyle: TextStyle(color: Colors.grey)
                  ),
                ),
                SizedBox(height: 50),
                Material(
                    child: CondoBotton("LOGIN", onTap: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return CondoWelcomePage();
                  }));
                })

                )
              ],
            )),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
