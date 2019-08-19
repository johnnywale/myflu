import 'package:flutter/material.dart';
import 'package:we_rate_dogs/pages/personalized_tab_bar/personalized_tab_bar.dart';
import 'package:we_rate_dogs/pages/personalized_tab_bar/tab_item.dart';

class PersonalizedTabBarPage extends StatefulWidget {
  @override
  _PersonalizedTabBarPageState createState() => _PersonalizedTabBarPageState();
}

class _PersonalizedTabBarPageState extends State<PersonalizedTabBarPage> {
  Color background = Color.fromARGB(255, 254, 212, 0);
  PersonalizedTabController _controller;

  @override
  void initState() {
    _controller = new PersonalizedTabController(tabBarItem: [
      TabItem(data: Icons.airplay, size: 40, text: "Airplay"),
      TabItem(data: Icons.person_outline, size: 40, text: "Time"),
      TabItem(data: Icons.access_time, size: 40, text: "Time"),
      TabItem(data: Icons.person_outline, size: 40, text: "Outline"),
    ], menuItems: [
      TabItem(data: Icons.zoom_out, size: 40, text: "Zoomout"),
      TabItem(data: Icons.zoom_out_map, size: 40, text: "MapOut"),
      TabItem(data: Icons.favorite_border, size: 40, text: "Favorite"),
      TabItem(data: Icons.aspect_ratio, size: 40, text: "Aspect"),
      TabItem(data: Icons.all_out, size: 40, text: "All"),
      TabItem(data: Icons.desktop_windows, size: 40, text: "Windows")
    ]);
    _controller.addListener(() {
      print("${_controller.tabBarItem}");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: background,
          leading: IconButton(
            color: Colors.black,
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back, color: Colors.black),
          ),
          title: Text('Sample',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
        ),
        bottomNavigationBar: PersonalizedTab(
          controller: _controller,
        ),
        body: Container(color: background));
  }
}
