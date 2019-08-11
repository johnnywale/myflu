import 'package:fish_redux/fish_redux.dart';
import 'package:we_rate_dogs/movie/models/videolist.dart';

class VideoCellState implements Cloneable<VideoCellState> {

  VideoListResult videodata;
 
  @override
  VideoCellState clone() {
    return VideoCellState()..videodata=videodata;
  }
}

VideoCellState initState(Map<String, dynamic> args) {
  return VideoCellState();
}
