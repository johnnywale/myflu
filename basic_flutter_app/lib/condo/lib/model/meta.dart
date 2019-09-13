import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'meta.jser.dart';

class Meta {
  
  final String timeZone;
  
  final String transactionId;
  
  final String currency;
  
  final int processingTime;
  

  Meta(
    

{
     this.timeZone = null,  
     this.transactionId = null,  
     this.currency = null,  
     this.processingTime = null 
    
    }
  );

  @override
  String toString() {
    return 'Meta[timeZone=$timeZone, transactionId=$transactionId, currency=$currency, processingTime=$processingTime, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class MetaSerializer extends Serializer<Meta> with _$MetaSerializer {

}
