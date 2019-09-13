import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'child_updatable.dart';
import 'condo_config.dart';
import 'condo_service.dart';

typedef LoadList<T> = Future<List<T>> Function();

abstract class BaseCondoPageState<G extends StatefulWidget, T> extends State<G>
    with TickerProviderStateMixin
    implements Fragment {
  int i = 0;
  AnimationController _controller;
  ScrollController _scrollController;
  CondoService condoService;
  Animation<Offset> position;
  Animation<double> resize;

  LoadList<T> get loadAll;

  List<T> items = [];

  void play() {
    _controller.forward(from: 0.0);
  }

  @override
  void initState() {
    super.initState();
    condoService = CondoService();
    _scrollController = ScrollController();
    this._controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 400));
    position = Tween(begin: Offset(1, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    resize = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.50,
        1.00,
        curve: Curves.linear,
      ),
    ));

    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward(from: 0.0);
    refreshController = RefreshController(initialRefresh: true);
  }

  RefreshController refreshController;

  void _onLoading() async {
    showLoading(context);
    await Future.delayed(Duration(milliseconds: 300));
    //  total = total + batch;
    refreshController.loadNoData();
    Navigator.pop(context);
    if (mounted) setState(() {});
  }

  void _onRefresh() async {
    loadAll().then((List<T> facilities) {
      print("load item done");
      items = facilities;
      refreshController.refreshCompleted();
      setState(() {});
    });
  }

  Widget generate() {
    return SmartRefresher(
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        controller: refreshController,
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropMaterialHeader(
          color: Colors.white,
          backgroundColor: condoActionbarColor,
        ),
        child: ListView.builder(
            controller: _scrollController,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return buildItem(items[index]);
            }));
  }

  Widget buildItem(T facility);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: position,
        child: ScaleTransition(
            scale: resize,
            child: Material(
                color: condoBackgroundColor,
                elevation: 16,
                child: generate())));
  }
}
