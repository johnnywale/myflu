import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'facility_booking_create.jser.dart';

class FacilityBookingCreate {
   /* day for book */
  final DateTime day;
   /* purpose */
  final String purpose;
  

  FacilityBookingCreate(
    

{
    
     this.day = null,   this.purpose = null 
    
    }
  );

  @override
  String toString() {
    return 'FacilityBookingCreate[day=$day, purpose=$purpose, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class FacilityBookingCreateSerializer extends Serializer<FacilityBookingCreate> with _$FacilityBookingCreateSerializer {

}
