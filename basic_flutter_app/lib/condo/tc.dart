import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:we_rate_dogs/condo/lib/model/facility.dart';

import 'condo_config.dart';

class TcPage extends StatefulWidget {
  TcPage({Key key, this.facility}) : super(key: key);

  final Facility facility;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<TcPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.facility.termsAndConditions);

    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: condoActionbarColor,
        title: new Text("TC"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: SingleChildScrollView(
            child: Html(
              data: widget.facility.termsAndConditions,
              //Optional parameters:
              padding: EdgeInsets.all(8.0),
              linkStyle: const TextStyle(
                color: Colors.redAccent,
                decorationColor: Colors.redAccent,
                decoration: TextDecoration.underline,
              ),
              onLinkTap: (url) {
                print("Opening $url...");
              },
              onImageTap: (src) {
                print(src);
              },
              //Must have useRichText set to false for this to work
              customRender: (node, children) {
                if (node is dom.Element) {
                  switch (node.localName) {
                    case "custom_tag":
                      return Column(children: children);
                  }
                }
                return null;
              },
              customTextAlign: (dom.Node node) {
                if (node is dom.Element) {
                  switch (node.localName) {
                    case "p":
                      return TextAlign.justify;
                  }
                }
                return null;
              },
              customTextStyle: (dom.Node node, TextStyle baseStyle) {
                if (node is dom.Element) {
                  switch (node.localName) {
                    case "p":
                      return baseStyle
                          .merge(TextStyle(height: 1, fontSize: 14));
                  }
                }
                return baseStyle;
              },
            ),
          ),
        ),
      ),
    );
  }
}
