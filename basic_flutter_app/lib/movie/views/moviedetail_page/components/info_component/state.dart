import 'package:fish_redux/fish_redux.dart';
import 'package:we_rate_dogs/movie/models/moviedetail.dart';

import '../../state.dart';

class InfoState implements Cloneable<InfoState> {

 MovieDetailModel movieDetailModel;

  @override
  InfoState clone() {
    return InfoState();
  }
}
class InfoConnector extends ConnOp<MovieDetailPageState,InfoState>{
  @override
  InfoState get(MovieDetailPageState state) {
    InfoState substate=new InfoState();
    substate.movieDetailModel=state.movieDetailModel;
    return substate;
  }
}
