import 'dart:ui';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:we_rate_dogs/movie/globalbasestate/state.dart';
import 'package:we_rate_dogs/movie/models/searchresult.dart';

class SearchPageState implements GlobalBaseState<SearchPageState> {

  SearchResultModel searchResultModel;
  FocusNode focus;

  @override
  SearchPageState clone() {
    return SearchPageState()
      ..focus = focus
      ..searchResultModel = searchResultModel;
  }

  @override
  Color themeColor;
}

SearchPageState initState(Map<String, dynamic> args) {
  SearchPageState state = SearchPageState();
  state.searchResultModel=SearchResultModel.fromParams(results:List<SearchResult>());
  state.focus = FocusNode();
  return state;
}
