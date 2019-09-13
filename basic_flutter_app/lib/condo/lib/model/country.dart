import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'country.jser.dart';

class Country {
   /* id */
  final int id;
   /* name */
  final String name;
   /* addressFormat */
  final String addressFormat;
   /* isoCode2 */
  final String isoCode2;
   /* isoCode3 */
  final String isoCode3;
   /* importId */
  final int importId;
   /* phoneCode */
  final String phoneCode;
   /* postCodeRequired */
  final bool postCodeRequired;
   /* status */
  final bool status;
  

  Country(
    

{
     this.id = null,  
     this.name = null,  
     this.addressFormat = null,  
     this.isoCode2 = null,  
     this.isoCode3 = null,  
     this.importId = null,  
     this.phoneCode = null,  
     this.postCodeRequired = null,  
     this.status = null 
    
    }
  );

  @override
  String toString() {
    return 'Country[id=$id, name=$name, addressFormat=$addressFormat, isoCode2=$isoCode2, isoCode3=$isoCode3, importId=$importId, phoneCode=$phoneCode, postCodeRequired=$postCodeRequired, status=$status, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class CountrySerializer extends Serializer<Country> with _$CountrySerializer {

}
