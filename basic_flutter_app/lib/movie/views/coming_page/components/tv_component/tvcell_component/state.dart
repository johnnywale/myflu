import 'package:fish_redux/fish_redux.dart';
import 'package:we_rate_dogs/movie/models/videolist.dart';

class TVCellState implements Cloneable<TVCellState> {
  VideoListResult tvResult;
  int index;
  TVCellState({this.tvResult,this.index});

  @override
  TVCellState clone() {
    return TVCellState()
    ..tvResult=tvResult
    ..index=index;
  }
}

TVCellState initState(Map<String, dynamic> args) {
  return TVCellState();
}
