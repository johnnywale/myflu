import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'booking_session_status.jser.dart';

class BookingSessionStatus {
   /* id */
  final int id;
   /* name */
  final String name;
   /* beginTime */
  final DateTime beginTime;
   /* endTime */
  final String endTime;
  
  final String status;
   /* startTime */
  final String startTime;
   /* stopTime */
  final DateTime stopTime;
  

  BookingSessionStatus(
    

{
     this.id = null,  
     this.name = null,  
     this.beginTime = null,  
     this.endTime = null,  
     this.status = null,  
     this.startTime = null,  
     this.stopTime = null 
    
    }
  );

  @override
  String toString() {
    return 'BookingSessionStatus[id=$id, name=$name, beginTime=$beginTime, endTime=$endTime, status=$status, startTime=$startTime, stopTime=$stopTime, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class BookingSessionStatusSerializer extends Serializer<BookingSessionStatus> with _$BookingSessionStatusSerializer {

}
