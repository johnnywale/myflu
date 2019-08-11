import 'dart:math';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:we_rate_dogs/movie/actions/Adapt.dart';
import 'package:we_rate_dogs/movie/actions/imageurl.dart';
import 'package:we_rate_dogs/movie/customwidgets/keepalive_widget.dart';
import 'package:we_rate_dogs/movie/generated/i18n.dart';
import 'package:we_rate_dogs/movie/models/enums/genres.dart';
import 'package:we_rate_dogs/movie/models/enums/imagesize.dart';
import 'package:we_rate_dogs/movie/models/videolist.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ComingPageState state, Dispatch dispatch, ViewService viewService) {
  

  return DefaultTabController(
    length: 2,
    child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          brightness: Brightness.light,
          title: Container(
              child: TabBar(
            onTap: (i) {
              if (i == 0)
                dispatch(ComingPageActionCreator.onFilterChanged(true));
              else
                dispatch(ComingPageActionCreator.onFilterChanged(false));
            },
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle:
                TextStyle(fontSize: Adapt.px(35), fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(color: Colors.grey),
            tabs: <Widget>[
              Tab(
                text: I18n.of(viewService.context).movies,
              ),
              Tab(
                text: I18n.of(viewService.context).tvShows,
              )
            ],
          )),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            viewService.buildComponent('movielist'),
            viewService.buildComponent('tvlist'),
          ],
        )),
  );
}
