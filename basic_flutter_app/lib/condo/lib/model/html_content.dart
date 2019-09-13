import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'html_content.jser.dart';

class HtmlContent {
   /* id */
  final int id;
   /* content */
  final String content;
   /* entity */
  final String entity;
   /* highLight */
  final String highLight;
   /* language */
  final String language;
   /* search */
  final bool search;
   /* searchKey */
  final String searchKey;
   /* summary */
  final String summary;
   /* targetId */
  final int targetId;
   /* title */
  final String title;
   /* visitURL */
  final String visitUrl;
   /* entityId */
  final int entityId;
   /* metaKeywords */
  final String metaKeywords;
   /* metaTitle */
  final String metaTitle;
   /* metaDescription */
  final String metaDescription;
   /* metaOg */
  final String metaOg;
   /* metaSeo */
  final String metaSeo;
   /* urlId */
  final int urlId;
  

  HtmlContent(
    

{
     this.id = null,  
     this.content = null,  
     this.entity = null,  
     this.highLight = null,  
     this.language = null,  
     this.search = null,  
     this.searchKey = null,  
     this.summary = null,  
     this.targetId = null,  
     this.title = null,  
     this.visitUrl = null,  
     this.entityId = null,  
     this.metaKeywords = null,  
     this.metaTitle = null,  
     this.metaDescription = null,  
     this.metaOg = null,  
     this.metaSeo = null,  
     this.urlId = null 
    
    }
  );

  @override
  String toString() {
    return 'HtmlContent[id=$id, content=$content, entity=$entity, highLight=$highLight, language=$language, search=$search, searchKey=$searchKey, summary=$summary, targetId=$targetId, title=$title, visitUrl=$visitUrl, entityId=$entityId, metaKeywords=$metaKeywords, metaTitle=$metaTitle, metaDescription=$metaDescription, metaOg=$metaOg, metaSeo=$metaSeo, urlId=$urlId, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class HtmlContentSerializer extends Serializer<HtmlContent> with _$HtmlContentSerializer {

}
