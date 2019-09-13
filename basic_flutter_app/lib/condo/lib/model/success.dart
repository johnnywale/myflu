import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'success.jser.dart';

class Success {
   /* always ok */
  final String result;
  

  Success(
    

{
     this.result = null 
    
    }
  );

  @override
  String toString() {
    return 'Success[result=$result, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class SuccessSerializer extends Serializer<Success> with _$SuccessSerializer {

}
