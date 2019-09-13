// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$ErrorSerializer implements Serializer<Error> {
  Serializer<Meta> __metaSerializer;
  Serializer<Meta> get _metaSerializer => __metaSerializer ??= MetaSerializer();
  Serializer<ErrorContent> __errorContentSerializer;
  Serializer<ErrorContent> get _errorContentSerializer =>
      __errorContentSerializer ??= ErrorContentSerializer();
  @override
  Map<String, dynamic> toMap(Error model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'meta', _metaSerializer.toMap(model.meta));
    setMapValue(ret, 'error', _errorContentSerializer.toMap(model.error));
    return ret;
  }

  @override
  Error fromMap(Map map) {
    if (map == null) return null;
    final obj = Error(
        meta: _metaSerializer.fromMap(map['meta'] as Map) ??
            getJserDefault('meta'),
        error: _errorContentSerializer.fromMap(map['error'] as Map) ??
            getJserDefault('error'));
    return obj;
  }
}
