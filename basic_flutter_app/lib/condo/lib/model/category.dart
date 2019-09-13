import 'package:jaguar_serializer/jaguar_serializer.dart';

import '../model/html_content.dart';
import '../model/meta_info.dart';
import '../model/category.dart';
part 'category.jser.dart';

class Category {
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
  final String coverUrl;
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
   /* checked */
  final bool checked;
   /* children */
  final List<Category> children;
   /* rankOrder */
  final int rankOrder;
   /* isLast */
  final bool isLast;
  

  Category(
    

{
     this.id = null,  
     this.name = null,  
     this.active = null,  
     this.attachmentUrl = null,  
     this.background = null,  
     this.copyRight = null,  
     this.coverUrl = null,  
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
     this.checked = null,  
     this.children = const [],  
     this.rankOrder = null,  
     this.isLast = null 
    
    }
  );

  @override
  String toString() {
    return 'Category[id=$id, name=$name, active=$active, attachmentUrl=$attachmentUrl, background=$background, copyRight=$copyRight, coverUrl=$coverUrl, createDate=$createDate, effectDay=$effectDay, htmlContent=$htmlContent, keyUrl=$keyUrl, lgKey=$lgKey, linking=$linking, metaInfo=$metaInfo, newsPaper=$newsPaper, online=$online, location=$location, picUrl=$picUrl, recommended=$recommended, source=$source, title=$title, topBlog=$topBlog, visitCount=$visitCount, checked=$checked, children=$children, rankOrder=$rankOrder, isLast=$isLast, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class CategorySerializer extends Serializer<Category> with _$CategorySerializer {

}
