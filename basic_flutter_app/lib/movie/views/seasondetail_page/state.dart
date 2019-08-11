import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:we_rate_dogs/movie/globalbasestate/state.dart';
import 'package:we_rate_dogs/movie/models/episodemodel.dart';
import 'package:we_rate_dogs/movie/models/seasondetail.dart';

import 'components/seasoncast_component/state.dart';

class SeasonDetailPageState implements GlobalBaseState<SeasonDetailPageState> {

 SeasonDetailModel seasonDetailModel;
 SeasonCastState seasonCastState;
 ScrollController scrollController;
 String name;
 String seasonpic;
 int tvid;
 int seasonNumber;

  @override
  SeasonDetailPageState clone() {
    return SeasonDetailPageState()
    ..seasonDetailModel=seasonDetailModel
    ..tvid=tvid
    ..seasonNumber=seasonNumber
    ..seasonCastState=seasonCastState
    ..name=name
    ..seasonpic=seasonpic
    ..scrollController;
  }

  @override
  Color themeColor;
}

SeasonDetailPageState initState(Map<String, dynamic> args) {
  SeasonDetailPageState state=SeasonDetailPageState();
  state.tvid=args['tvid'];
  state.seasonNumber=args['seasonNumber'];
  state.name=args['name'];
  state.seasonpic=args['posterpic'];
  state.seasonDetailModel=SeasonDetailModel.fromParams(episodes: List<Episode>());
  state.seasonCastState=SeasonCastState();
  return state;
}
