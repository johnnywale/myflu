import 'package:jaguar_serializer/jaguar_serializer.dart';

import '../model/facility.dart';
part 'booking_session.jser.dart';

class BookingSession {
   /* id */
  final int id;
   /* name */
  final String name;
   /* beginTime */
  final DateTime beginTime;
   /* endTime */
  final String endTime;
   /* facility */
  final Facility facility;
   /* sessionScope */
  final String sessionScope;
   /* weekendSkip */
  final bool weekendSkip;
   /* sequence */
  final int sequence;
   /* startTime */
  final String startTime;
   /* stopTime */
  final DateTime stopTime;
  

  BookingSession(
    

{
     this.id = null,  
     this.name = null,  
     this.beginTime = null,  
     this.endTime = null,  
     this.facility = null,  
     this.sessionScope = null,  
     this.weekendSkip = null,  
     this.sequence = null,  
     this.startTime = null,  
     this.stopTime = null 
    
    }
  );

  @override
  String toString() {
    return 'BookingSession[id=$id, name=$name, beginTime=$beginTime, endTime=$endTime, facility=$facility, sessionScope=$sessionScope, weekendSkip=$weekendSkip, sequence=$sequence, startTime=$startTime, stopTime=$stopTime, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class BookingSessionSerializer extends Serializer<BookingSession> with _$BookingSessionSerializer {

}
