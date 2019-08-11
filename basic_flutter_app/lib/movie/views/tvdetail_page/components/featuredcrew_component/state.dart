import 'package:fish_redux/fish_redux.dart';
import 'package:we_rate_dogs/movie/models/tvdetail.dart';
import 'package:we_rate_dogs/movie/views/tvdetail_page/state.dart';

class FeatureCrewState implements Cloneable<FeatureCrewState> {
 
List<CreatedBy> createdBy;

  @override
  FeatureCrewState clone() {
    return FeatureCrewState();
  }
}

class FeatureCrewConnector extends ConnOp<TVDetailPageState,FeatureCrewState>{
  @override
  FeatureCrewState get(TVDetailPageState state) {
    FeatureCrewState substate=new FeatureCrewState();
    substate.createdBy=state.tvDetailModel.created_by??List<CreatedBy>();
    return substate;
  }
}
