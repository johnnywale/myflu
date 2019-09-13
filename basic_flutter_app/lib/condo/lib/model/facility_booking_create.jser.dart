// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_booking_create.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$FacilityBookingCreateSerializer
    implements Serializer<FacilityBookingCreate> {
  @override
  Map<String, dynamic> toMap(FacilityBookingCreate model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'day', dateTimeUtcProcessor.serialize(model.day));
    setMapValue(ret, 'purpose', model.purpose);
    return ret;
  }

  @override
  FacilityBookingCreate fromMap(Map map) {
    if (map == null) return null;
    final obj = FacilityBookingCreate(
        day: dateTimeUtcProcessor.deserialize(map['day'] as String) ??
            getJserDefault('day'),
        purpose: map['purpose'] as String ?? getJserDefault('purpose'));
    return obj;
  }
}
