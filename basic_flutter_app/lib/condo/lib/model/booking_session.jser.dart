// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_session.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$BookingSessionSerializer
    implements Serializer<BookingSession> {
  Serializer<Facility> __facilitySerializer;
  Serializer<Facility> get _facilitySerializer =>
      __facilitySerializer ??= FacilitySerializer();
  @override
  Map<String, dynamic> toMap(BookingSession model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(
        ret, 'begin_time', dateTimeUtcProcessor.serialize(model.beginTime));
    setMapValue(ret, 'end_time', model.endTime);
    setMapValue(ret, 'facility', _facilitySerializer.toMap(model.facility));
    setMapValue(ret, 'session_scope', model.sessionScope);
    setMapValue(ret, 'weekend_skip', model.weekendSkip);
    setMapValue(ret, 'sequence', model.sequence);
    setMapValue(ret, 'start_time', model.startTime);
    setMapValue(
        ret, 'stop_time', dateTimeUtcProcessor.serialize(model.stopTime));
    return ret;
  }

  @override
  BookingSession fromMap(Map map) {
    if (map == null) return null;
    final obj = BookingSession(
        id: map['id'] as int ?? getJserDefault('id'),
        name: map['name'] as String ?? getJserDefault('name'),
        beginTime:
            dateTimeUtcProcessor.deserialize(map['begin_time'] as String) ??
                getJserDefault('beginTime'),
        endTime: map['end_time'] as String ?? getJserDefault('endTime'),
        facility: _facilitySerializer.fromMap(map['facility'] as Map) ??
            getJserDefault('facility'),
        sessionScope:
            map['session_scope'] as String ?? getJserDefault('sessionScope'),
        weekendSkip:
            map['weekend_skip'] as bool ?? getJserDefault('weekendSkip'),
        sequence: map['sequence'] as int ?? getJserDefault('sequence'),
        startTime: map['start_time'] as String ?? getJserDefault('startTime'),
        stopTime:
            dateTimeUtcProcessor.deserialize(map['stop_time'] as String) ??
                getJserDefault('stopTime'));
    return obj;
  }
}
