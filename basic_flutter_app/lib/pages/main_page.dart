import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'collapsing_toolbar/collapsing_profile.dart';
import 'collapsing_toolbar/collapsing_tab.dart';
import 'shop_items_page.dart';
import 'list_page.dart';
import 'account_page.dart';
import 'main_two.dart';
import '../data/data.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentIndex = 0;
  final charts = Data.charts;

  static final List<String> chartDropdownItems = [
    'Last 7 days',
    'Last month',
    'Last year'
  ];
  String actualDropdown = chartDropdownItems[0];
  int actualChart = 0;
  PageController _pageController;

  @override
  void initState() {
     super.initState();
     _pageController = PageController();
  }
  @override
  void dispose() {
     super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        title: Text('Hello',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 30.0)),
        leading: IconButton(
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('beclothed.com',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.0)),
                new Container(
                  child: DropdownButton(
                      isDense: true,
                      value: actualDropdown,
                      onChanged: (String value) =>
                          setState(() {
                            actualDropdown = value;
                            actualChart = chartDropdownItems
                                .indexOf(value); // Refresh the chart
                          }),
                      items: chartDropdownItems.map((String title) {
                        return DropdownMenuItem(
                          value: title,
                          child: Text(title,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0)),
                        );
                      }).toList()),
//        margin: EdgeInsets.only(top: 25.0),
                )
              ],
            ),
          )
        ],
      ),
      body:  StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: <Widget>[
          _buildTile(
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Container(
//              margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(1.0),
                      decoration: new BoxDecoration(
//                          border: new Border.all(color: Colors.blueAccent),

//                  borderRadius: BorderRadius.all(
//                    Radius.circular(25.0) //                 <--- border radius here
//                ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Total Views',
                              style: TextStyle(color: Colors.blueAccent)),
                          Text('265K',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 34.0))
                        ],
                      ),
                    ),
                    Material(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(24.0),
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(Icons.timeline,
                                  color: Colors.white, size: 30.0),
                            )))
                  ]),
            ),
              onTap: () =>
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => Account()))
          ),
          _buildTile(
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Material(
                        color: Colors.teal,
                        shape: CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(Icons.settings_applications,
                              color: Colors.white, size: 30.0),
                        )),
                    Padding(padding: EdgeInsets.only(bottom: 16.0)),
                    Text('General',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 24.0)),
                    Text('Images, Videos',
                        style: TextStyle(color: Colors.black45)),
                  ]),
            ),

              onTap: () =>
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => ListPage( title: "Lession", )))
          ),
          _buildTile(
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Material(
                        color: Colors.amber,
                        shape: CircleBorder(),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Icon(Icons.notifications,
                              color: Colors.white, size: 30.0),
                        )),
                    Padding(padding: EdgeInsets.only(bottom: 16.0)),
                    Text('Alerts',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 24.0)),
                    Text('All ', style: TextStyle(color: Colors.black45)),
                  ]),
            ),
              onTap: () =>
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => Dashboard()))
          ),
          _buildTile(
            Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Revenue',
                                style: TextStyle(color: Colors.green)),
                            Text('\$16K',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 34.0)),
                          ],
                        ),
                        DropdownButton(
                            isDense: true,
                            value: actualDropdown,
                            onChanged: (String value) =>
                                setState(() {
                                  actualDropdown = value;
                                  actualChart = chartDropdownItems
                                      .indexOf(value); // Refresh the chart
                                }),
                            items: chartDropdownItems.map((String title) {
                              return DropdownMenuItem(
                                value: title,
                                child: Text(title,
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.0)),
                              );
                            }).toList())
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 4.0)),
                    Sparkline(
                      data: charts[actualChart],
                      lineWidth: 5.0,
                      lineColor: Colors.greenAccent,
                    )
                  ],
                )),
          ),
          _buildTile(
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Shop Items',
                            style: TextStyle(color: Colors.redAccent)),
                        Text('173',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 34.0))
                      ],
                    ),
                    Material(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(24.0),
                        child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Icon(Icons.store,
                                  color: Colors.white, size: 30.0),
                            )))
                  ]),
            ),
            onTap: () =>
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => ShopItemsPage())),
          )
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 110.0),
          StaggeredTile.extent(1, 180.0),
          StaggeredTile.extent(1, 180.0),
          StaggeredTile.extent(2, 220.0),
          StaggeredTile.extent(2, 110.0),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        currentIndex: currentIndex,
        onItemSelected: (index) =>
            setState(() {
              currentIndex = index;
            }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Colors.red,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.people),
              title: Text('Users'),
              activeColor: Colors.purpleAccent
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.message),
              title: Text('Messages'),
              activeColor: Colors.pink
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              activeColor: Colors.blue
          ),
        ],
      ),

    )
    ;
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0, //
    borderRadius: BorderRadius.circular(12.0),
    shadowColor: Color(0x802196F3),
    child: InkWell(
          // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null
                ? () => onTap()
                : () {
              print('Not set yet');
            },
            child: child));
  }
}
