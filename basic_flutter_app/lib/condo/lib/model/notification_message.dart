import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'notification_message.jser.dart';

class NotificationMessage {
   /* id */
  final int id;
   /* content */
  final String content;
  

  NotificationMessage(
    

{
     this.id = null,  
     this.content = null 
    
    }
  );

  @override
  String toString() {
    return 'NotificationMessage[id=$id, content=$content, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class NotificationMessageSerializer extends Serializer<NotificationMessage> with _$NotificationMessageSerializer {

}
