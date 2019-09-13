import 'package:flutter/material.dart';
import 'package:we_rate_dogs/condo/welcome.dart';

import 'condo_config.dart';
import 'condo_service.dart';
import 'lib/api/open_api.dart';
import 'lib/model/login_credentials.dart';
import 'lib/model/member.dart';
import 'lib/model/token_member_response.dart';

class CondoLoginPage extends StatefulWidget {
  @override
  CondoLoginState createState() => CondoLoginState();
}

class CondoLoginState extends State<CondoLoginPage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _formKey = new GlobalKey<FormState>();
  bool selected = false;
  FocusNode userFocusNode;
  FocusNode passwordFocusNode;
  Color color = Color(0xffeb8d37);
  String username;
  String password;
  CondoService condoService;
  VoidCallback callback;

  @override
  void initState() {
    print("init state");
    super.initState();
    callback = check;
    condoService = CondoService();
    userFocusNode = FocusNode();
    passwordFocusNode = FocusNode();

    condoService.notifier.addListener(callback);
  }

  void check() {
    if (condoService.notifier.value.isPresent) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return CondoWelcomePage();
      }));
    } else {}
  }

  @override
  void dispose() {
    userFocusNode.dispose();
    passwordFocusNode.dispose();
    print("dispose login");
    condoService.notifier.removeListener(callback);
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
          height: MediaQuery
              .of(context)
              .size
              .height,
          decoration: BoxDecoration(color: Color(0xfff9f7ea)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Image.asset("assets/condo/mi-casa.jpg"),
                    ),
                    TextFormField(
                      initialValue: "johnny",
                      focusNode: userFocusNode,
                      cursorColor: color,
                      textDirection: TextDirection.ltr,
                      onSaved: (String value) {
                        username = value;
                      },
                      decoration: InputDecoration(
                        disabledBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, style: BorderStyle.solid),
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                        //    contentPadding: EdgeInsets.only(top: 40, left: 40),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: color,
                                width: 1,
                                style: BorderStyle.solid),
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
                        labelText: 'Username',
                        //    prefixStyle: TextStyle(color: Colors.grey)
                      ),
                    ),
                    TextFormField(

                      initialValue: "johnny",

                      focusNode: passwordFocusNode,
                      obscureText: true,
                      cursorColor: color,
                      onSaved: (String value) {
                        password = value;
                      },
                      textDirection: TextDirection.ltr,
                      decoration: InputDecoration(
                        disabledBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(width: 1, style: BorderStyle.solid),
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                        //contentPadding: EdgeInsets.only(top: 40, left: 40),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: color,
                                width: 1,
                                style: BorderStyle.solid),
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
                          _formKey.currentState.save();
                          if (remote) {
                            showLoading(context);
                            OpenApi openApi =
                            condoService.jaguarApiGen.getOpenApi();
                            openApi
                                .openUserLoginPost(LoginCredentials(
                                loginName: username, password: password))
                                .then((TokenMemberResponse res) {
                              condoService.setToken(res.token);
                              var userApi = condoService.jaguarApiGen
                                  .getUserApi();
                              userApi.userMeGet().then((Member member) {
                                loadingDismiss(context);
                                condoService.setMember(member);
                              }).catchError((e) {
                                loadingDismiss(context);
                              });
                            }).catchError((e) {
                              loadingDismiss(context);
                              print("got exception $e ");
                            }).whenComplete(() {
                              print("complete");
                            });
                          } else {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(builder: (context) {
                              return CondoWelcomePage();
                            }));
                          }
                        }))
                  ],
                )),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
