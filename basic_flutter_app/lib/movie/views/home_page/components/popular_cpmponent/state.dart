import 'package:fish_redux/fish_redux.dart';
import 'package:we_rate_dogs/movie/models/videolist.dart';

import '../../state.dart';

class PopularState implements Cloneable<PopularState> {

 VideoListModel popularMoives;
 VideoListModel popularTVShows;
 bool showmovie;
  @override
  PopularState clone() {
    return PopularState()
    ..popularMoives=popularMoives
    ..popularTVShows=popularTVShows
    ..showmovie=showmovie;
  }
}

class PopularConnector
    extends ConnOp<HomePageState, PopularState> {
  @override
  PopularState get(HomePageState state) {
    PopularState mstate = PopularState();
    mstate.popularMoives=state.popularMovies;
    mstate.popularTVShows = state.popularTVShows;
    mstate.showmovie=state.showmovie;
    return mstate;
  }
}
