// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_field.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$ErrorFieldSerializer implements Serializer<ErrorField> {
  @override
  Map<String, dynamic> toMap(ErrorField model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'field', model.field);
    setMapValue(ret, 'message', model.message);
    return ret;
  }

  @override
  ErrorField fromMap(Map map) {
    if (map == null) return null;
    final obj = ErrorField(
        field: map['field'] as String ?? getJserDefault('field'),
        message: map['message'] as String ?? getJserDefault('message'));
    return obj;
  }
}
