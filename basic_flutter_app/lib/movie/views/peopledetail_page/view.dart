import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:we_rate_dogs/movie/actions/Adapt.dart';
import 'package:we_rate_dogs/movie/actions/imageurl.dart';
import 'package:we_rate_dogs/movie/models/enums/imagesize.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    PeopleDetailPageState state, Dispatch dispatch, ViewService viewService) {
      var adapter=viewService.buildAdapter();
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      elevation: 0.0,
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      centerTitle: false,
      title: Text('Profile',style: TextStyle(color:Colors.black),),
    ),
    body: ListView.builder(
      itemBuilder:adapter.itemBuilder ,
      itemCount: adapter.itemCount,
      physics: state.pageScrollPhysics,
    ),
  );
}
