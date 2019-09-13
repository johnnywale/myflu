// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$FacilitySerializer implements Serializer<Facility> {
  Serializer<FacilitySort> __facilitySortSerializer;
  Serializer<FacilitySort> get _facilitySortSerializer =>
      __facilitySortSerializer ??= FacilitySortSerializer();
  Serializer<BookingSession> __bookingSessionSerializer;
  Serializer<BookingSession> get _bookingSessionSerializer =>
      __bookingSessionSerializer ??= BookingSessionSerializer();
  Serializer<BookingLimitation> __bookingLimitationSerializer;
  Serializer<BookingLimitation> get _bookingLimitationSerializer =>
      __bookingLimitationSerializer ??= BookingLimitationSerializer();
  @override
  Map<String, dynamic> toMap(Facility model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(
        ret, 'start_time', dateTimeUtcProcessor.serialize(model.startTime));
    setMapValue(ret, 'end_time', dateTimeUtcProcessor.serialize(model.endTime));
    setMapValue(ret, 'description', model.description);
    setMapValue(ret, 'code', model.code);
    setMapValue(ret, 'facility_sort',
        _facilitySortSerializer.toMap(model.facilitySort));
    setMapValue(ret, 'auto_confirm', model.autoConfirm);
    setMapValue(ret, 'price', model.price);
    setMapValue(ret, 'image', model.image);
    setMapValue(ret, 'terms_and_conditions', model.termsAndConditions);
    setMapValue(ret, 'pin', model.pin);
    setMapValue(ret, 'discount_price', model.discountPrice);
    setMapValue(
        ret,
        'booking_sessions',
        codeIterable(model.bookingSessions,
            (val) => _bookingSessionSerializer.toMap(val as BookingSession)));
    setMapValue(
        ret,
        'booking_limitations',
        codeIterable(
            model.bookingLimitations,
            (val) =>
                _bookingLimitationSerializer.toMap(val as BookingLimitation)));
    return ret;
  }

  @override
  Facility fromMap(Map map) {
    if (map == null) return null;
    final obj = Facility(
        id: map['id'] as int ?? getJserDefault('id'),
        name: map['name'] as String ?? getJserDefault('name'),
        startTime: dateTimeUtcProcessor.deserialize(map['start_time'] as String) ??
            getJserDefault('startTime'),
        endTime: dateTimeUtcProcessor.deserialize(map['end_time'] as String) ??
            getJserDefault('endTime'),
        description:
            map['description'] as String ?? getJserDefault('description'),
        code: map['code'] as String ?? getJserDefault('code'),
        facilitySort:
            _facilitySortSerializer.fromMap(map['facility_sort'] as Map) ??
                getJserDefault('facilitySort'),
        autoConfirm:
            map['auto_confirm'] as bool ?? getJserDefault('autoConfirm'),
        price: map['price'] as num ?? getJserDefault('price'),
        image: map['image'] as String ?? getJserDefault('image'),
        termsAndConditions: map['terms_and_conditions'] as String ??
            getJserDefault('termsAndConditions'),
        pin: map['pin'] as bool ?? getJserDefault('pin'),
        discountPrice:
            map['discount_price'] as num ?? getJserDefault('discountPrice'),
        bookingSessions: codeIterable<BookingSession>(
                map['booking_sessions'] as Iterable,
                (val) => _bookingSessionSerializer.fromMap(val as Map)) ??
            getJserDefault('bookingSessions'),
        bookingLimitations: codeIterable<BookingLimitation>(
                map['booking_limitations'] as Iterable,
                (val) => _bookingLimitationSerializer.fromMap(val as Map)) ??
            getJserDefault('bookingLimitations'));
    return obj;
  }
}
