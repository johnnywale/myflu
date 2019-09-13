import 'package:flutter/material.dart';
import 'package:optional/optional.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'lib/api.dart';
import 'lib/model/member.dart';

class CondoService {
  static final CondoService _singleton = new CondoService._internal();
  JaguarApiGen jaguarApiGen;
  Member member;
  SharedPreferences sharedPreferences;
  final ValueNotifier<Optional<Member>> notifier =
      ValueNotifier(Optional.empty());

  factory CondoService() {
    return _singleton;
  }

  CondoService._internal() {
    jaguarApiGen = JaguarApiGen(baseUrl: "https://www.micasa.com.sg/v1");
    _initToken();
  }

  void clearMember() {
    sharedPreferences.remove("member").whenComplete(() {});
    sharedPreferences.remove("token").whenComplete(() {});
  }

  void setMember(Member member) {
    this.member = member;
    sharedPreferences.setString("member", jsonJaguarRepo.encode(member));
    notifier.value = Optional.of(member);
  }

  void setToken(String token) {
    jaguarApiGen.setApiKey("jovx", "jovx $token");
    sharedPreferences.setString("token", token);
  }

  void _initToken() async {
    this.sharedPreferences = await SharedPreferences.getInstance();
    var member = sharedPreferences.getString("member");
    String token = sharedPreferences.get("token");
    if (token != null) {
      setToken(token);
    }
    if (member != null) {
      this.member = jsonJaguarRepo.decodeOne<Member>(member);
      notifier.value = Optional.of(this.member);
    }
  }
}
