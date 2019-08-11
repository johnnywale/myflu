import 'package:fish_redux/fish_redux.dart';
import 'package:we_rate_dogs/movie/models/videolist.dart';

//TODO replace with your own action
enum AccountPageAction { action,login,init,logout,navigatorPush}

class AccountPageActionCreator {
  static Action onAction() {
    return const Action(AccountPageAction.action);
  }
  static Action onLogin() {
    return Action(AccountPageAction.login);
  }
  static Action onInit(String name,String avatar,bool islogin,int acountIdV3,String acountIdV4) {
    return Action(AccountPageAction.init,payload:[name,avatar,islogin,acountIdV3,acountIdV4]);
  }
  static Action onLogout() {
    return Action(AccountPageAction.logout);
  }
  static Action navigatorPush(String routeName, {Object arguments}) {
    return Action(AccountPageAction.navigatorPush,payload: [routeName,arguments]);
  }
}
