import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'meta_info.jser.dart';

class MetaInfo {
   /* name */
  final String name;
   /* title */
  final String title;
   /* metaKeywords */
  final String metaKeywords;
   /* metaTitle */
  final String metaTitle;
   /* metaDescription */
  final String metaDescription;
   /* linkedId */
  final int linkedId;
   /* metaType */
  final String metaType;
  //enum metaTypeEnum {  CHANNEL,  HOME,  PRODUCT,  CATEGORY,  WEIGHT,  QUANTITYUNIT,  ALBUM,  OTHER,  }; /* metaOg */
  final String metaOg;
   /* metaSeo */
  final String metaSeo;
   /* description */
  final String description;
  

  MetaInfo(
    

{
     this.name = null,  
     this.title = null,  
     this.metaKeywords = null,  
     this.metaTitle = null,  
     this.metaDescription = null,  
     this.linkedId = null,  
     this.metaType = null,  
     this.metaOg = null,  
     this.metaSeo = null,  
     this.description = null 
    
    }
  );

  @override
  String toString() {
    return 'MetaInfo[name=$name, title=$title, metaKeywords=$metaKeywords, metaTitle=$metaTitle, metaDescription=$metaDescription, linkedId=$linkedId, metaType=$metaType, metaOg=$metaOg, metaSeo=$metaSeo, description=$description, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class MetaInfoSerializer extends Serializer<MetaInfo> with _$MetaInfoSerializer {

}
