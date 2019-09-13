import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'country_zone.jser.dart';

class CountryZone {
   /* id */
  final int id;
   /* name */
  final String name;
   /* code */
  final String code;
   /* status */
  final bool status;
   /* allZone */
  final bool allZone;
  

  CountryZone(
    

{
     this.id = null,  
     this.name = null,  
     this.code = null,  
     this.status = null,  
     this.allZone = null 
    
    }
  );

  @override
  String toString() {
    return 'CountryZone[id=$id, name=$name, code=$code, status=$status, allZone=$allZone, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class CountryZoneSerializer extends Serializer<CountryZone> with _$CountryZoneSerializer {

}
