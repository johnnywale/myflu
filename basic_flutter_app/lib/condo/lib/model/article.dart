import 'package:jaguar_serializer/jaguar_serializer.dart';

import '../model/html_content.dart';
import '../model/meta_info.dart';
import '../model/category.dart';
part 'article.jser.dart';

class Article {
   /* id */
  final int id;
   /* name */
  final String name;
   /* active */
  final bool active;
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
   /* linking */
  final bool linking;
   /* metaInfo */
  final MetaInfo metaInfo;
   /* online */
  final bool online;
   /* location */
  final String location;
   /* picURL */
  final String picUrl;
   /* title */
  final String title;
   /* topBlog */
  final bool topBlog;
   /* visitCount */
  final int visitCount;
   /* category */
  final Category category;
   /* preview */
  final String preview;
  

  Article(
    

{
     this.id = null,  
     this.name = null,  
     this.active = null,  
     this.coverUrl = null,  
     this.createDate = null,  
     this.effectDay = null,  
     this.htmlContent = null,  
     this.keyUrl = null,  
     this.linking = null,  
     this.metaInfo = null,  
     this.online = null,  
     this.location = null,  
     this.picUrl = null,  
     this.title = null,  
     this.topBlog = null,  
     this.visitCount = null,  
     this.category = null,  
     this.preview = null 
    
    }
  );

  @override
  String toString() {
    return 'Article[id=$id, name=$name, active=$active, coverUrl=$coverUrl, createDate=$createDate, effectDay=$effectDay, htmlContent=$htmlContent, keyUrl=$keyUrl, linking=$linking, metaInfo=$metaInfo, online=$online, location=$location, picUrl=$picUrl, title=$title, topBlog=$topBlog, visitCount=$visitCount, category=$category, preview=$preview, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class ArticleSerializer extends Serializer<Article> with _$ArticleSerializer {

}
