import 'package:jaguar_serializer/jaguar_serializer.dart';

import '../model/member.dart';
import '../model/booking_session.dart';
import '../model/facility.dart';
part 'facility_booking.jser.dart';

class FacilityBooking {
   /* id */
  final int id;
   /* name */
  final String name;
   /* bookingBegin */
  final DateTime bookingBegin;
   /* bookingEnd */
  final DateTime bookingEnd;
   /* bookingId */
  final String bookingId;
   /* cancelDate */
  final DateTime cancelDate;
   /* bookingSession */
  final BookingSession bookingSession;
   /* bookingStatus */
  final String bookingStatus;
   /* bookingTime */
  final DateTime bookingTime;
   /* channel */
  final String channel;
   /* checkinBy */
  final String checkinBy;
   /* checkInDate */
  final DateTime checkInDate;
   /* customerName */
  final String customerName;
   /* day */
  final DateTime day;
   /* facility */
  final Facility facility;
   /* first */
  final bool first;
   /* member */
  final Member member;
   /* peak */
  final bool peak;
   /* place */
  final String place;
   /* price */
  final double price;
   /* purpose */
  final String purpose;
   /* relation */
  final String relation;
   /* remark */
  final String remark;
   /* serviceBy */
  final String serviceBy;
   /* status */
  final String status;
   /* mainBooking */
  final bool mainBooking;
   /* notified */
  final bool notified;
  

  FacilityBooking(
    

{
     this.id = null,  
     this.name = null,  
     this.bookingBegin = null,  
     this.bookingEnd = null,  
     this.bookingId = null,  
     this.cancelDate = null,  
     this.bookingSession = null,  
     this.bookingStatus = null,  
     this.bookingTime = null,  
     this.channel = null,  
     this.checkinBy = null,  
     this.checkInDate = null,  
     this.customerName = null,  
     this.day = null,  
     this.facility = null,  
     this.first = null,  
     this.member = null,  
     this.peak = null,  
     this.place = null,  
     this.price = null,  
     this.purpose = null,  
     this.relation = null,  
     this.remark = null,  
     this.serviceBy = null,  
     this.status = null,  
     this.mainBooking = null,  
     this.notified = null 
    
    }
  );

  @override
  String toString() {
    return 'FacilityBooking[id=$id, name=$name, bookingBegin=$bookingBegin, bookingEnd=$bookingEnd, bookingId=$bookingId, cancelDate=$cancelDate, bookingSession=$bookingSession, bookingStatus=$bookingStatus, bookingTime=$bookingTime, channel=$channel, checkinBy=$checkinBy, checkInDate=$checkInDate, customerName=$customerName, day=$day, facility=$facility, first=$first, member=$member, peak=$peak, place=$place, price=$price, purpose=$purpose, relation=$relation, remark=$remark, serviceBy=$serviceBy, status=$status, mainBooking=$mainBooking, notified=$notified, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class FacilityBookingSerializer extends Serializer<FacilityBooking> with _$FacilityBookingSerializer {

}
