import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: 0);
  }

  Widget topArea() => Material(
      type: MaterialType.canvas,
      color: Colors.white,
      child: Card(
        margin: EdgeInsets.only(left: 25, top: 10, right: 25, bottom: 10.0),
        elevation: 1.0,
//        shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.all(Radius.circular(50.0))),
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue, Colors.red])),
            padding: EdgeInsets.all(5.0),
            // color: Color(0xFF015FFF),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onTap: () {
                        print("xxxxx");
                      },
                    ),
                    Text("Savings",
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(r"$ 95,940.00",
                        style: TextStyle(color: Colors.white, fontSize: 24.0)),
                  ),
                ),
                SizedBox(height: 35.0),
              ],
            )),
      ));

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.canvas,
        color: Colors.white,
        child: new Stack(
          children: <Widget>[
            new CustomScrollView(

                // controller: scrollController,
                slivers: [
                  SliverAppBar(
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      )
                    ],
                    expandedHeight: 170.0,
                    backgroundColor: Colors.red,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text('Accounts'),
                      background: SizedBox.expand(
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Image.asset('assets/shoes1.png'),
                            Container(color: Colors.black26)
                          ],
                        ),
                      ),
                    ),
                    elevation: 2.0,
                    forceElevated: true,
                    pinned: true,
                    floating: true,
                  ),
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                      topArea(),
                    ),
                    pinned: true,
                  ),
                  new SliverList(
                    delegate: new SliverChildListDelegate(
                      new List.generate(
                          30,
                          (int index) => accountItems("Trevello App $index",
                              r"+ $ 4,946.00", "28-04-16", "credit")),
                    ),
                  )
                ]),
            // _buildFab(),
          ],
        ));
  }

  Widget accountItems(
          String item, String charge, String dateString, String type) =>
      Material(
          type: MaterialType.transparency,
          //color: Colors.white,
          child: Card(
              elevation: 8.0,
          //    color: Colors.white,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: InkWell(

                child: Padding(
                  padding: EdgeInsets.all(10),
//                      decoration:
//                          BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(item, style: TextStyle(fontSize: 16.0)),
                          Text(charge, style: TextStyle(fontSize: 16.0))
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(dateString,
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 14.0)),
                          Text(type,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14.0))
                        ],
                      ),
                    ],
                  ),
                ),
                onTap: (){

                  print("---tapped");


                },
              )));
//)));
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => 151;

  @override
  double get maxExtent => 151;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
      color: Colors.white,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
