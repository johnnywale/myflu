// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$MetaSerializer implements Serializer<Meta> {
  @override
  Map<String, dynamic> toMap(Meta model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'time_zone', model.timeZone);
    setMapValue(ret, 'transaction_id', model.transactionId);
    setMapValue(ret, 'currency', model.currency);
    setMapValue(ret, 'processing_time', model.processingTime);
    return ret;
  }

  @override
  Meta fromMap(Map map) {
    if (map == null) return null;
    final obj = Meta(
        timeZone: map['time_zone'] as String ?? getJserDefault('timeZone'),
        transactionId:
            map['transaction_id'] as String ?? getJserDefault('transactionId'),
        currency: map['currency'] as String ?? getJserDefault('currency'),
        processingTime:
            map['processing_time'] as int ?? getJserDefault('processingTime'));
    return obj;
  }
}
