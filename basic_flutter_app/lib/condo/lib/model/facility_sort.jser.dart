// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_sort.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$FacilitySortSerializer implements Serializer<FacilitySort> {
  Serializer<BookingLimitation> __bookingLimitationSerializer;
  Serializer<BookingLimitation> get _bookingLimitationSerializer =>
      __bookingLimitationSerializer ??= BookingLimitationSerializer();
  Serializer<Peak> __peakSerializer;
  Serializer<Peak> get _peakSerializer => __peakSerializer ??= PeakSerializer();
  @override
  Map<String, dynamic> toMap(FacilitySort model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(
        ret,
        'booking_limitations',
        codeIterable(
            model.bookingLimitations,
            (val) =>
                _bookingLimitationSerializer.toMap(val as BookingLimitation)));
    setMapValue(ret, 'cancel_before', model.cancelBefore);
    setMapValue(ret, 'description', model.description);
    setMapValue(ret, 'expirt_time', model.expirtTime);
    setMapValue(ret, 'peaks',
        codeIterable(model.peaks, (val) => _peakSerializer.toMap(val as Peak)));
    setMapValue(ret, 'time_unit', model.timeUnit);
    setMapValue(
        ret, 'allow_cancel_after_confirm', model.allowCancelAfterConfirm);
    setMapValue(ret, 'batch_booking', model.batchBooking);
    return ret;
  }

  @override
  FacilitySort fromMap(Map map) {
    if (map == null) return null;
    final obj = FacilitySort(
        id: map['id'] as int ?? getJserDefault('id'),
        name: map['name'] as String ?? getJserDefault('name'),
        bookingLimitations: codeIterable<BookingLimitation>(
                map['booking_limitations'] as Iterable,
                (val) => _bookingLimitationSerializer.fromMap(val as Map)) ??
            getJserDefault('bookingLimitations'),
        cancelBefore:
            map['cancel_before'] as int ?? getJserDefault('cancelBefore'),
        description:
            map['description'] as String ?? getJserDefault('description'),
        expirtTime: map['expirt_time'] as int ?? getJserDefault('expirtTime'),
        peaks: codeIterable<Peak>(map['peaks'] as Iterable,
                (val) => _peakSerializer.fromMap(val as Map)) ??
            getJserDefault('peaks'),
        timeUnit: map['time_unit'] as String ?? getJserDefault('timeUnit'),
        allowCancelAfterConfirm: map['allow_cancel_after_confirm'] as bool ??
            getJserDefault('allowCancelAfterConfirm'),
        batchBooking:
            map['batch_booking'] as bool ?? getJserDefault('batchBooking'));
    return obj;
  }
}
