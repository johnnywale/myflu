import 'package:jaguar_serializer/jaguar_serializer.dart';

import '../model/notification_message.dart';
part 'member_notification.jser.dart';

class MemberNotification {
   /* id */
  final int id;
   /* title */
  final String title;
   /* subTitle */
  final String subTitle;
   /* message */
  final NotificationMessage message;
   /* sendTime */
  final DateTime sendTime;
   /* readed */
  final bool readed;
  

  MemberNotification(
    

{
     this.id = null,  
     this.title = null,  
     this.subTitle = null,  
     this.message = null,  
     this.sendTime = null,  
     this.readed = null 
    
    }
  );

  @override
  String toString() {
    return 'MemberNotification[id=$id, title=$title, subTitle=$subTitle, message=$message, sendTime=$sendTime, readed=$readed, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class MemberNotificationSerializer extends Serializer<MemberNotification> with _$MemberNotificationSerializer {

}
