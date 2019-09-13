import 'package:jaguar_serializer/jaguar_serializer.dart';

import '../model/meta.dart';
import '../model/error_content.dart';
part 'error.jser.dart';

class Error {
   /* meta */
  final Meta meta;
   /* content */
  final ErrorContent error;
  

  Error(
    

{
     this.meta = null,  
     this.error = null 
    
    }
  );

  @override
  String toString() {
    return 'Error[meta=$meta, error=$error, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class ErrorSerializer extends Serializer<Error> with _$ErrorSerializer {

}
