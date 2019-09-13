import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'fcm_update.jser.dart';

class FcmUpdate {
   /* token data */
  final String token;
  

  FcmUpdate(
    

{
    
     this.token = null 
    }
  );

  @override
  String toString() {
    return 'FcmUpdate[token=$token, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class FcmUpdateSerializer extends Serializer<FcmUpdate> with _$FcmUpdateSerializer {

}
