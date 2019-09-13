import 'package:jaguar_serializer/jaguar_serializer.dart';

import '../model/error_field.dart';
part 'error_content.jser.dart';

class ErrorContent {
  
  final String type;
  //enum typeEnum {  HTTP_EXCEPTION,  BACKEND_EXCEPTION,  ENTITY_NOT_FOUND,  };
  final int code;
  
  final String message;
  
  final List<ErrorField> fields;
  

  ErrorContent(
    

{
     this.type = null,  
     this.code = null,  
     this.message = null,  
     this.fields = const [] 
    
    }
  );

  @override
  String toString() {
    return 'ErrorContent[type=$type, code=$code, message=$message, fields=$fields, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class ErrorContentSerializer extends Serializer<ErrorContent> with _$ErrorContentSerializer {

}
