// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_booking.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$FacilityBookingSerializer
    implements Serializer<FacilityBooking> {
  Serializer<BookingSession> __bookingSessionSerializer;
  Serializer<BookingSession> get _bookingSessionSerializer =>
      __bookingSessionSerializer ??= BookingSessionSerializer();
  Serializer<Facility> __facilitySerializer;
  Serializer<Facility> get _facilitySerializer =>
      __facilitySerializer ??= FacilitySerializer();
  Serializer<Member> __memberSerializer;
  Serializer<Member> get _memberSerializer =>
      __memberSerializer ??= MemberSerializer();
  @override
  Map<String, dynamic> toMap(FacilityBooking model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'booking_begin',
        dateTimeUtcProcessor.serialize(model.bookingBegin));
    setMapValue(
        ret, 'booking_end', dateTimeUtcProcessor.serialize(model.bookingEnd));
    setMapValue(ret, 'booking_id', model.bookingId);
    setMapValue(
        ret, 'cancel_date', dateTimeUtcProcessor.serialize(model.cancelDate));
    setMapValue(ret, 'booking_session',
        _bookingSessionSerializer.toMap(model.bookingSession));
    setMapValue(ret, 'booking_status', model.bookingStatus);
    setMapValue(
        ret, 'booking_time', dateTimeUtcProcessor.serialize(model.bookingTime));
    setMapValue(ret, 'channel', model.channel);
    setMapValue(ret, 'checkin_by', model.checkinBy);
    setMapValue(ret, 'check_in_date',
        dateTimeUtcProcessor.serialize(model.checkInDate));
    setMapValue(ret, 'customer_name', model.customerName);
    setMapValue(ret, 'day', dateTimeUtcProcessor.serialize(model.day));
    setMapValue(ret, 'facility', _facilitySerializer.toMap(model.facility));
    setMapValue(ret, 'first', model.first);
    setMapValue(ret, 'member', _memberSerializer.toMap(model.member));
    setMapValue(ret, 'peak', model.peak);
    setMapValue(ret, 'place', model.place);
    setMapValue(ret, 'price', model.price);
    setMapValue(ret, 'purpose', model.purpose);
    setMapValue(ret, 'relation', model.relation);
    setMapValue(ret, 'remark', model.remark);
    setMapValue(ret, 'service_by', model.serviceBy);
    setMapValue(ret, 'status', model.status);
    setMapValue(ret, 'main_booking', model.mainBooking);
    setMapValue(ret, 'notified', model.notified);
    return ret;
  }

  @override
  FacilityBooking fromMap(Map map) {
    if (map == null) return null;
    final obj = FacilityBooking(
        id: map['id'] as int ?? getJserDefault('id'),
        name: map['name'] as String ?? getJserDefault('name'),
        bookingBegin:
            dateTimeUtcProcessor.deserialize(map['booking_begin'] as String) ??
                getJserDefault('bookingBegin'),
        bookingEnd:
            dateTimeUtcProcessor.deserialize(map['booking_end'] as String) ??
                getJserDefault('bookingEnd'),
        bookingId: map['booking_id'] as String ?? getJserDefault('bookingId'),
        cancelDate:
            dateTimeUtcProcessor.deserialize(map['cancel_date'] as String) ??
                getJserDefault('cancelDate'),
        bookingSession:
            _bookingSessionSerializer.fromMap(map['booking_session'] as Map) ??
                getJserDefault('bookingSession'),
        bookingStatus:
            map['booking_status'] as String ?? getJserDefault('bookingStatus'),
        bookingTime:
            dateTimeUtcProcessor.deserialize(map['booking_time'] as String) ??
                getJserDefault('bookingTime'),
        channel: map['channel'] as String ?? getJserDefault('channel'),
        checkinBy: map['checkin_by'] as String ?? getJserDefault('checkinBy'),
        checkInDate:
            dateTimeUtcProcessor.deserialize(map['check_in_date'] as String) ??
                getJserDefault('checkInDate'),
        customerName:
            map['customer_name'] as String ?? getJserDefault('customerName'),
        day: dateTimeUtcProcessor.deserialize(map['day'] as String) ?? getJserDefault('day'),
        facility: _facilitySerializer.fromMap(map['facility'] as Map) ?? getJserDefault('facility'),
        first: map['first'] as bool ?? getJserDefault('first'),
        member: _memberSerializer.fromMap(map['member'] as Map) ?? getJserDefault('member'),
        peak: map['peak'] as bool ?? getJserDefault('peak'),
        place: map['place'] as String ?? getJserDefault('place'),
        price: map['price'] as double ?? getJserDefault('price'),
        purpose: map['purpose'] as String ?? getJserDefault('purpose'),
        relation: map['relation'] as String ?? getJserDefault('relation'),
        remark: map['remark'] as String ?? getJserDefault('remark'),
        serviceBy: map['service_by'] as String ?? getJserDefault('serviceBy'),
        status: map['status'] as String ?? getJserDefault('status'),
        mainBooking: map['main_booking'] as bool ?? getJserDefault('mainBooking'),
        notified: map['notified'] as bool ?? getJserDefault('notified'));
    return obj;
  }
}
