import 'package:jaguar_serializer/jaguar_serializer.dart';

import '../model/template.dart';
part 'channel.jser.dart';

class Channel {
   /* id */
  final int id;
   /* name */
  final String name;
   /* path */
  final String path;
   /* title */
  final String title;
   /* metaKeywords */
  final String metaKeywords;
   /* metaTitle */
  final String metaTitle;
   /* metaDescription */
  final String metaDescription;
   /* code */
  final String code;
   /* parallaxScrolling */
  final bool parallaxScrolling;
   /* selfTemplate */
  final Template selfTemplate;
   /* metaOg */
  final String metaOg;
   /* metaSeo */
  final String metaSeo;
   /* requiredAttribute */
  final String requiredAttribute;
   /* subBanner */
  final String subBanner;
   /* subTitle */
  final String subTitle;
   /* subDescription */
  final String subDescription;
   /* templateType */
  final String templateType;
  

  Channel(
    

{
     this.id = null,  
     this.name = null,  
     this.path = null,  
     this.title = null,  
     this.metaKeywords = null,  
     this.metaTitle = null,  
     this.metaDescription = null,  
     this.code = null,  
     this.parallaxScrolling = null,  
     this.selfTemplate = null,  
     this.metaOg = null,  
     this.metaSeo = null,  
     this.requiredAttribute = null,  
     this.subBanner = null,  
     this.subTitle = null,  
     this.subDescription = null,  
     this.templateType = null 
    
    }
  );

  @override
  String toString() {
    return 'Channel[id=$id, name=$name, path=$path, title=$title, metaKeywords=$metaKeywords, metaTitle=$metaTitle, metaDescription=$metaDescription, code=$code, parallaxScrolling=$parallaxScrolling, selfTemplate=$selfTemplate, metaOg=$metaOg, metaSeo=$metaSeo, requiredAttribute=$requiredAttribute, subBanner=$subBanner, subTitle=$subTitle, subDescription=$subDescription, templateType=$templateType, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class ChannelSerializer extends Serializer<Channel> with _$ChannelSerializer {

}
