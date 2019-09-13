// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$SuccessSerializer implements Serializer<Success> {
  @override
  Map<String, dynamic> toMap(Success model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'result', model.result);
    return ret;
  }

  @override
  Success fromMap(Map map) {
    if (map == null) return null;
    final obj =
        Success(result: map['result'] as String ?? getJserDefault('result'));
    return obj;
  }
}
