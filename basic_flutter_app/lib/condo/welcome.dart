import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:we_rate_dogs/condo/stateful_text.dart';

import 'child_updatable.dart';
import 'condo_config.dart';

class CondoWelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<CondoWelcomePage> {
  GlobalKey<ScaffoldState> key = GlobalKey();
  GlobalKey<StatefulTextState> title = GlobalKey();
  ValueNotifier<Widget> firstNotify = new ValueNotifier(null);
  ValueNotifier<Widget> secondNotify = new ValueNotifier(null);
  List<Widget> widgets = List(CondoMenus.length);
  int previous = 0;
  bool firstPushed = false;

  Widget getWidget(int i) {
    Widget widget = widgets[i];
    if (widget == null) {
      ValueChanged<int> val = push;

      widget = CondoMenus.asMap()[i].builder(GlobalKey(), val);
      widgets[i] = widget;
    }
    return widget;
  }

  void pushFromMenu(int i) {
    push(i);
    Navigator.of(context).pop();
  }

  void push(int i) {
    if (previous == i) {
      Navigator.of(context).pop();
      return;
    }
    Widget widget = getWidget(i);
    firstNotify.value = widget;
    GlobalKey globalKey = firstNotify.value.key;
    if (globalKey.currentState is Fragment) {
      Fragment state2 = globalKey.currentState as Fragment;
      state2.play();
    }
    print("Title");
    title.currentState.changeText(CondoMenus.asMap()[i].title);
    previous = i;
  }

  @override
  void initState() {
    super.initState();
  }

  List<Widget> buildMenu() {
    List<Widget> result = [];
    CondoMenus.asMap().forEach((index, x) {
      result.add(ListTile(
        onTap: () {
          pushFromMenu(index);
        },
        leading: Icon(
          x.iconData,
          size: 28,
          color: Colors.white,
        ),
        title: Text(
          x.title,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ));
      result.add(Container(height: 0.5, color: Colors.white));
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    print("build welcome");
    return Scaffold(
      key: key,
      drawer: Material(
          child: Drawer(
        child: Ink(
            color: condoActionbarColor,
            child: ListView(
              children: buildMenu(),
            )),
      )),
      appBar: AppBar(
        backgroundColor: condoActionbarColor,
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              key.currentState.openDrawer();
            }),
        title: StatefulText(
          data: "Home",
          key: title,
        ),
      ),
      body: Stack(
        children: <Widget>[
          Opacity(
            opacity: 1.0,
            child: ChildUpdatable(
              keepFirst: true,
              notifier: firstNotify,
              builder: (con, gc) {
                return getWidget(0);
              },
            ),
          )
        ],
      ),
    );
  }
}
