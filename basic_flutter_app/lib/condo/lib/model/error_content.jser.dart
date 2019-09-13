// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_content.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$ErrorContentSerializer implements Serializer<ErrorContent> {
  Serializer<ErrorField> __errorFieldSerializer;
  Serializer<ErrorField> get _errorFieldSerializer =>
      __errorFieldSerializer ??= ErrorFieldSerializer();
  @override
  Map<String, dynamic> toMap(ErrorContent model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'type', model.type);
    setMapValue(ret, 'code', model.code);
    setMapValue(ret, 'message', model.message);
    setMapValue(
        ret,
        'fields',
        codeIterable(model.fields,
            (val) => _errorFieldSerializer.toMap(val as ErrorField)));
    return ret;
  }

  @override
  ErrorContent fromMap(Map map) {
    if (map == null) return null;
    final obj = ErrorContent(
        type: map['type'] as String ?? getJserDefault('type'),
        code: map['code'] as int ?? getJserDefault('code'),
        message: map['message'] as String ?? getJserDefault('message'),
        fields: codeIterable<ErrorField>(map['fields'] as Iterable,
                (val) => _errorFieldSerializer.fromMap(val as Map)) ??
            getJserDefault('fields'));
    return obj;
  }
}
