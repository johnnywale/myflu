import 'package:jaguar_serializer/jaguar_serializer.dart';

import '../model/booking_limitation.dart';
import '../model/peak.dart';
part 'facility_sort.jser.dart';

class FacilitySort {
   /* id */
  final int id;
   /* name */
  final String name;
   /* bookingLimitations */
  final List<BookingLimitation> bookingLimitations;
   /* cancelBefore */
  final int cancelBefore;
   /* description */
  final String description;
   /* expirtTime */
  final int expirtTime;
   /* peaks */
  final List<Peak> peaks;
   /* timeUnit */
  final String timeUnit;
  //enum timeUnitEnum {  NANOSECONDS,  MICROSECONDS,  MILLISECONDS,  SECONDS,  MINUTES,  HOURS,  DAYS,  }; /* allowCancelAfterConfirm */
  final bool allowCancelAfterConfirm;
   /* batchBooking */
  final bool batchBooking;
  

  FacilitySort(
    

{
     this.id = null,  
     this.name = null,  
     this.bookingLimitations = const [],  
     this.cancelBefore = null,  
     this.description = null,  
     this.expirtTime = null,  
     this.peaks = const [],  
     this.timeUnit = null,  
     this.allowCancelAfterConfirm = null,  
     this.batchBooking = null 
    
    }
  );

  @override
  String toString() {
    return 'FacilitySort[id=$id, name=$name, bookingLimitations=$bookingLimitations, cancelBefore=$cancelBefore, description=$description, expirtTime=$expirtTime, peaks=$peaks, timeUnit=$timeUnit, allowCancelAfterConfirm=$allowCancelAfterConfirm, batchBooking=$batchBooking, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class FacilitySortSerializer extends Serializer<FacilitySort> with _$FacilitySortSerializer {

}
