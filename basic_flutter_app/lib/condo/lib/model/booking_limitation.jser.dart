// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_limitation.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$BookingLimitationSerializer
    implements Serializer<BookingLimitation> {
  @override
  Map<String, dynamic> toMap(BookingLimitation model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'value', model.value);
    setMapValue(ret, 'limit_type', model.limitType);
    return ret;
  }

  @override
  BookingLimitation fromMap(Map map) {
    if (map == null) return null;
    final obj = BookingLimitation(
        id: map['id'] as int ?? getJserDefault('id'),
        name: map['name'] as String ?? getJserDefault('name'),
        value: map['value'] as int ?? getJserDefault('value'),
        limitType: map['limit_type'] as String ?? getJserDefault('limitType'));
    return obj;
  }
}
