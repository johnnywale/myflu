import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'error_field.jser.dart';

class ErrorField {
  
  final String field;
  
  final String message;
  

  ErrorField(
    

{
     this.field = null,  
     this.message = null 
    
    }
  );

  @override
  String toString() {
    return 'ErrorField[field=$field, message=$message, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class ErrorFieldSerializer extends Serializer<ErrorField> with _$ErrorFieldSerializer {

}
