import 'package:jaguar_serializer/jaguar_serializer.dart';

import '../model/html_content.dart';
import '../model/meta_info.dart';
import '../model/category.dart';
part 'calendar_event.jser.dart';

class CalendarEvent {
   /* id */
  final int id;
   /* name */
  final String name;
   /* active */
  final bool active;
   /* attachmentUrl */
  final String attachmentUrl;
   /* background */
  final String background;
   /* copyRight */
  final String copyRight;
   /* coverURL */
  final String coverURL;
   /* createDate */
  final DateTime createDate;
   /* effectDay */
  final DateTime effectDay;
   /* htmlContent */
  final HtmlContent htmlContent;
   /* keyUrl */
  final String keyUrl;
   /* lgKey */
  final String lgKey;
   /* linking */
  final bool linking;
   /* metaInfo */
  final MetaInfo metaInfo;
   /* newsPaper */
  final String newsPaper;
   /* online */
  final bool online;
   /* location */
  final String location;
   /* picURL */
  final String picUrl;
   /* recommended */
  final bool recommended;
   /* source */
  final String source;
   /* title */
  final String title;
   /* topBlog */
  final bool topBlog;
   /* visitCount */
  final int visitCount;
   /* category */
  final Category category;
   /* downloadCategory */
  final Category downloadCategory;
   /* endDate */
  final DateTime endDate;
   /* eventKey */
  final String eventKey;
   /* oldEnd */
  final DateTime oldEnd;
   /* oldStart */
  final DateTime oldStart;
   /* startDate */
  final DateTime startDate;
   /* registerOpen */
  final bool registerOpen;
   /* type */
  final String type;
  

  CalendarEvent(
    

{
     this.id = null,  
     this.name = null,  
     this.active = null,  
     this.attachmentUrl = null,  
     this.background = null,  
     this.copyRight = null,  
     this.coverURL = null,  
     this.createDate = null,  
     this.effectDay = null,  
     this.htmlContent = null,  
     this.keyUrl = null,  
     this.lgKey = null,  
     this.linking = null,  
     this.metaInfo = null,  
     this.newsPaper = null,  
     this.online = null,  
     this.location = null,  
     this.picUrl = null,  
     this.recommended = null,  
     this.source = null,  
     this.title = null,  
     this.topBlog = null,  
     this.visitCount = null,  
     this.category = null,  
     this.downloadCategory = null,  
     this.endDate = null,  
     this.eventKey = null,  
     this.oldEnd = null,  
     this.oldStart = null,  
     this.startDate = null,  
     this.registerOpen = null,  
     this.type = null 
    
    }
  );

  @override
  String toString() {
    return 'CalendarEvent[id=$id, name=$name, active=$active, attachmentUrl=$attachmentUrl, background=$background, copyRight=$copyRight, coverURL=$coverURL, createDate=$createDate, effectDay=$effectDay, htmlContent=$htmlContent, keyUrl=$keyUrl, lgKey=$lgKey, linking=$linking, metaInfo=$metaInfo, newsPaper=$newsPaper, online=$online, location=$location, picUrl=$picUrl, recommended=$recommended, source=$source, title=$title, topBlog=$topBlog, visitCount=$visitCount, category=$category, downloadCategory=$downloadCategory, endDate=$endDate, eventKey=$eventKey, oldEnd=$oldEnd, oldStart=$oldStart, startDate=$startDate, registerOpen=$registerOpen, type=$type, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class CalendarEventSerializer extends Serializer<CalendarEvent> with _$CalendarEventSerializer {

}
