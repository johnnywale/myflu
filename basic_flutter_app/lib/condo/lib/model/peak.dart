import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'peak.jser.dart';

class Peak {
   /* name */
  final String name;
   /* weekdayStart */
  final DateTime weekdayStart;
   /* weekdayEnd */
  final DateTime weekdayEnd;
   /* weekendStart */
  final DateTime weekendStart;
   /* weekendEnd */
  final DateTime weekendEnd;
  

  Peak(
    

{
     this.name = null,  
     this.weekdayStart = null,  
     this.weekdayEnd = null,  
     this.weekendStart = null,  
     this.weekendEnd = null 
    
    }
  );

  @override
  String toString() {
    return 'Peak[name=$name, weekdayStart=$weekdayStart, weekdayEnd=$weekdayEnd, weekendStart=$weekendStart, weekendEnd=$weekendEnd, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class PeakSerializer extends Serializer<Peak> with _$PeakSerializer {

}
