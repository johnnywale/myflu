// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_password_update.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$MemberPasswordUpdateSerializer
    implements Serializer<MemberPasswordUpdate> {
  @override
  Map<String, dynamic> toMap(MemberPasswordUpdate model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'old_password', model.oldPassword);
    setMapValue(ret, 'password', model.password);
    setMapValue(ret, 'confirm_password', model.confirmPassword);
    return ret;
  }

  @override
  MemberPasswordUpdate fromMap(Map map) {
    if (map == null) return null;
    final obj = MemberPasswordUpdate(
        oldPassword:
            map['old_password'] as String ?? getJserDefault('oldPassword'),
        password: map['password'] as String ?? getJserDefault('password'),
        confirmPassword: map['confirm_password'] as String ??
            getJserDefault('confirmPassword'));
    return obj;
  }
}
