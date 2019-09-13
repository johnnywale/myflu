// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_session_status.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$BookingSessionStatusSerializer
    implements Serializer<BookingSessionStatus> {
  @override
  Map<String, dynamic> toMap(BookingSessionStatus model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(
        ret, 'begin_time', dateTimeUtcProcessor.serialize(model.beginTime));
    setMapValue(ret, 'end_time', model.endTime);
    setMapValue(ret, 'status', model.status);
    setMapValue(ret, 'start_time', model.startTime);
    setMapValue(
        ret, 'stop_time', dateTimeUtcProcessor.serialize(model.stopTime));
    return ret;
  }

  @override
  BookingSessionStatus fromMap(Map map) {
    if (map == null) return null;
    final obj = BookingSessionStatus(
        id: map['id'] as int ?? getJserDefault('id'),
        name: map['name'] as String ?? getJserDefault('name'),
        beginTime:
            dateTimeUtcProcessor.deserialize(map['begin_time'] as String) ??
                getJserDefault('beginTime'),
        endTime: map['end_time'] as String ?? getJserDefault('endTime'),
        status: map['status'] as String ?? getJserDefault('status'),
        startTime: map['start_time'] as String ?? getJserDefault('startTime'),
        stopTime:
            dateTimeUtcProcessor.deserialize(map['stop_time'] as String) ??
                getJserDefault('stopTime'));
    return obj;
  }
}
