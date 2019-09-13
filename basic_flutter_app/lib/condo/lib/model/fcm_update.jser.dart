// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_update.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$FcmUpdateSerializer implements Serializer<FcmUpdate> {
  @override
  Map<String, dynamic> toMap(FcmUpdate model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'token', model.token);
    return ret;
  }

  @override
  FcmUpdate fromMap(Map map) {
    if (map == null) return null;
    final obj =
        FcmUpdate(token: map['token'] as String ?? getJserDefault('token'));
    return obj;
  }
}
