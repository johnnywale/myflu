// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_zone.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$CountryZoneSerializer implements Serializer<CountryZone> {
  @override
  Map<String, dynamic> toMap(CountryZone model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'code', model.code);
    setMapValue(ret, 'status', model.status);
    setMapValue(ret, 'all_zone', model.allZone);
    return ret;
  }

  @override
  CountryZone fromMap(Map map) {
    if (map == null) return null;
    final obj = CountryZone(
        id: map['id'] as int ?? getJserDefault('id'),
        name: map['name'] as String ?? getJserDefault('name'),
        code: map['code'] as String ?? getJserDefault('code'),
        status: map['status'] as bool ?? getJserDefault('status'),
        allZone: map['all_zone'] as bool ?? getJserDefault('allZone'));
    return obj;
  }
}
