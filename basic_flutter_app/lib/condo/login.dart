import 'package:flutter/material.dart';

class CondoLoginPage extends StatelessWidget {
  Color colorUsername = Colors.orange;
  Color colorUnit = Colors.purple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {},
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
                TextFormField(
                  cursorColor: colorUsername,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: 20, right: 20, top: 40),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.pink,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(2))),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: colorUsername,
                          width: 4,
                          style: BorderStyle.solid),
                      //    borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: colorUsername,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    labelStyle: TextStyle(
                      color: colorUsername,
                    ),
                    labelText: 'Username',
                  ),
                ),
                TextFormField(
                  cursorColor: colorUnit,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: 20, right: 20, top: 40),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: colorUnit, width: 4, style: BorderStyle.solid),
                      //    borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: colorUnit,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    labelStyle: TextStyle(
                      color: colorUnit,
                    ),
                    labelText: 'Unit',
                  ),
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
