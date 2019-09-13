import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:we_rate_dogs/condo/welcome.dart';

import 'condo_service.dart';

class CondoContactUsPage extends StatefulWidget {
  const CondoContactUsPage({Key key}) : super(key: key);

  @override
  CondoContactUsState createState() => CondoContactUsState();
}

class CondoContactUsState extends State<CondoContactUsPage> {
  String html = """
  <p>If you have queries, suggestions or feedback, please feel free to contact our Management Office.</p>
  <h5>Management Office</h5>
  <p><strong>Address:</strong><br>
  Mi Casa<br>
  MCST 3879<br>
  329 Choa Chu Kang Ave 3 #01-37<br>
  Singapore 689868</p>
  <p><strong>Tel:</strong> <a href="tel:+6566842752">+65 6684 2752</a><br>
  <strong>Fax:</strong> +65 6684 2756<br>
  <strong>Email:</strong> <a href="mailto:management.micasa@gmail.com">management.micasa@gmail.com</a></p>

  <p><strong>Working Hours:</strong><br>
  Monday to Friday: 9:00 am to 5:30 pm<br>
  Wednesday: 9:00 am to 8:00 pm<br>
  Saturday: 9:00 am to 12:30 pm<br>
  Sunday and Public Holidays: Closed</p>
  """;

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
    print("build==");
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          userFocusNode.unfocus();
          passwordFocusNode.unfocus();
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Color(0xfff9f7ea)),
          child: Html(
            data: html,
            padding: EdgeInsets.all(20),
            linkStyle: const TextStyle(
              color: Color(0xff9C671A),
              decorationColor: Colors.redAccent,
//              decoration: TextDecoration.underline,
            ),
            customTextStyle: (node, style) {
              if (node is dom.Element) {
                if (node.localName == "h5") {
                  return style.copyWith(color: Color(0xff9c671a));
                }
              }
              return style;
            },

            defaultTextStyle: TextStyle(height: 1.5),

//            renderNewlines: true,

            customRender: (node, children) {
              print("$node");
              if (node is dom.Element) {
                if (node.localName == "h5") {
                  print("===found h5 ==");
                  return DefaultTextStyle.merge(
                    child: Container(
                      width: 40,
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
//                          children: _parseNodeList(node.nodes),
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
              }

//              if (node.)
//
//              if (node is dom.Element) {
//                switch (node.localName) {
//                  case "custom_tag":
//                    return Column(children: children);
//                }
//              }
              return null;
            },
            onLinkTap: (url) {
              print("Opening $url...");
            },
            onImageTap: (src) {
              print(src);
            },
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
