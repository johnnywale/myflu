import 'package:flutter/widgets.dart';

class StatefulText extends StatefulWidget {
  final String data;

  const StatefulText({Key key, this.data}) : super(key: key);

  @override
  StatefulTextState createState() => StatefulTextState();
}

class StatefulTextState extends State<StatefulText> {
  String data;

  @override
  void initState() {
    super.initState();
    this.data = widget.data;
  }

  void changeText(String data) {
    if (this.data != data) {
      this.data = data;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(data);
  }
}
