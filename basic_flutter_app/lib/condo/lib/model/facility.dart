import 'package:jaguar_serializer/jaguar_serializer.dart';

import '../model/facility_sort.dart';
import '../model/booking_limitation.dart';
import '../model/booking_session.dart';
part 'facility.jser.dart';

class Facility {
   /* id */
  final int id;
   /* name */
  final String name;
   /* startTime */
  final DateTime startTime;
   /* endTime */
  final DateTime endTime;
   /* description */
  final String description;
   /* code */
  final String code;
   /* facilitySort */
  final FacilitySort facilitySort;
   /* autoConfirm */
  final bool autoConfirm;
   /* price */
  final num price;
   /* image */
  final String image;
   /* termsAndConditions */
  final String termsAndConditions;
   /* pin */
  final bool pin;
   /* discountPrice */
  final num discountPrice;
  
  final List<BookingSession> bookingSessions;
  
  final List<BookingLimitation> bookingLimitations;
  

  Facility(
    

{
     this.id = null,  
     this.name = null,  
     this.startTime = null,  
     this.endTime = null,  
     this.description = null,  
     this.code = null,  
     this.facilitySort = null,  
     this.autoConfirm = null,  
     this.price = null,  
     this.image = null,  
     this.termsAndConditions = null,  
     this.pin = null,  
     this.discountPrice = null,  
     this.bookingSessions = const [],  
     this.bookingLimitations = const [] 
    
    }
  );

  @override
  String toString() {
    return 'Facility[id=$id, name=$name, startTime=$startTime, endTime=$endTime, description=$description, code=$code, facilitySort=$facilitySort, autoConfirm=$autoConfirm, price=$price, image=$image, termsAndConditions=$termsAndConditions, pin=$pin, discountPrice=$discountPrice, bookingSessions=$bookingSessions, bookingLimitations=$bookingLimitations, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class FacilitySerializer extends Serializer<Facility> with _$FacilitySerializer {

}
