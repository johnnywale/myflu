import 'package:jaguar_serializer/jaguar_serializer.dart';

import '../model/html_content.dart';
part 'template.jser.dart';

class Template {
   /* id */
  final int id;
   /* name */
  final String name;
   /* path */
  final String path;
   /* encode */
  final String encode;
   /* modifyTime */
  final int modifyTime;
   /* partial */
  final bool partial;
   /* htmlContent */
  final HtmlContent htmlContent;
   /* fullPath */
  final String fullPath;
   /* language */
  final String language;
   /* inlineEdit */
  final bool inlineEdit;
   /* templateFull */
  final bool templateFull;
   /* search */
  final bool search;
   /* css */
  final String css;
   /* background */
  final String background;
   /* icon */
  final String icon;
   /* rightside */
  final bool rightside;
   /* style */
  final String style;
   /* project */
  final bool project;
  

  Template(
    

{
     this.id = null,  
     this.name = null,  
     this.path = null,  
     this.encode = null,  
     this.modifyTime = null,  
     this.partial = null,  
     this.htmlContent = null,  
     this.fullPath = null,  
     this.language = null,  
     this.inlineEdit = null,  
     this.templateFull = null,  
     this.search = null,  
     this.css = null,  
     this.background = null,  
     this.icon = null,  
     this.rightside = null,  
     this.style = null,  
     this.project = null 
    
    }
  );

  @override
  String toString() {
    return 'Template[id=$id, name=$name, path=$path, encode=$encode, modifyTime=$modifyTime, partial=$partial, htmlContent=$htmlContent, fullPath=$fullPath, language=$language, inlineEdit=$inlineEdit, templateFull=$templateFull, search=$search, css=$css, background=$background, icon=$icon, rightside=$rightside, style=$style, project=$project, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class TemplateSerializer extends Serializer<Template> with _$TemplateSerializer {

}
