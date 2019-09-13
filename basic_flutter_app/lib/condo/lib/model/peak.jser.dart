// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peak.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$PeakSerializer implements Serializer<Peak> {
  @override
  Map<String, dynamic> toMap(Peak model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'weekday_start',
        dateTimeUtcProcessor.serialize(model.weekdayStart));
    setMapValue(
        ret, 'weekday_end', dateTimeUtcProcessor.serialize(model.weekdayEnd));
    setMapValue(ret, 'weekend_start',
        dateTimeUtcProcessor.serialize(model.weekendStart));
    setMapValue(
        ret, 'weekend_end', dateTimeUtcProcessor.serialize(model.weekendEnd));
    return ret;
  }

  @override
  Peak fromMap(Map map) {
    if (map == null) return null;
    final obj = Peak(
        name: map['name'] as String ?? getJserDefault('name'),
        weekdayStart:
            dateTimeUtcProcessor.deserialize(map['weekday_start'] as String) ??
                getJserDefault('weekdayStart'),
        weekdayEnd:
            dateTimeUtcProcessor.deserialize(map['weekday_end'] as String) ??
                getJserDefault('weekdayEnd'),
        weekendStart:
            dateTimeUtcProcessor.deserialize(map['weekend_start'] as String) ??
                getJserDefault('weekendStart'),
        weekendEnd:
            dateTimeUtcProcessor.deserialize(map['weekend_end'] as String) ??
                getJserDefault('weekendEnd'));
    return obj;
  }
}
