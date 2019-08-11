import 'package:fish_redux/fish_redux.dart';
import 'package:we_rate_dogs/movie/models/peopledetail.dart';

class PersonalInfoState implements Cloneable<PersonalInfoState> {
 
  PeopleDetailModel peopleDetailModel;
  int creditcount;

  PersonalInfoState({this.peopleDetailModel,this.creditcount});

  @override
  PersonalInfoState clone() {
    return PersonalInfoState()
    ..peopleDetailModel=peopleDetailModel
    ..creditcount=creditcount;
  }
}

PersonalInfoState initState(Map<String, dynamic> args) {
  return PersonalInfoState();
}
