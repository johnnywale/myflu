import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'booking_limitation.jser.dart';

class BookingLimitation {
   /* id */
  final int id;
   /* name */
  final String name;
   /* value */
  final int value;
   /* limitType */
  final String limitType;
  //enum limitTypeEnum {  PER_YEAR,  PER_WEEK,  PER_MONTH,  ADVANCE,  PEAK_PER_WEEK,  FIRST_FREE,  ONE_BY_ONE,  PER_DAY,  PER_TWO_WEEK,  NONE_PEAK_PER_WEEK,  };

  BookingLimitation(
    

{
     this.id = null,  
     this.name = null,  
     this.value = null,  
     this.limitType = null 
    
    }
  );

  @override
  String toString() {
    return 'BookingLimitation[id=$id, name=$name, value=$value, limitType=$limitType, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class BookingLimitationSerializer extends Serializer<BookingLimitation> with _$BookingLimitationSerializer {

}
