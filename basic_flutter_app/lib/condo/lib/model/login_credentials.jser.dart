// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_credentials.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$LoginCredentialsSerializer
    implements Serializer<LoginCredentials> {
  @override
  Map<String, dynamic> toMap(LoginCredentials model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'login_name', model.loginName);
    setMapValue(ret, 'password', model.password);
    return ret;
  }

  @override
  LoginCredentials fromMap(Map map) {
    if (map == null) return null;
    final obj = LoginCredentials(
        loginName: map['login_name'] as String ?? getJserDefault('loginName'),
        password: map['password'] as String ?? getJserDefault('password'));
    return obj;
  }
}
