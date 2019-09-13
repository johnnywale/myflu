import 'package:jaguar_serializer/jaguar_serializer.dart';

import '../model/album_photo.dart';
import '../model/category.dart';
part 'album.jser.dart';

class Album {
   /* id */
  final int id;
   /* name */
  final String name;
   /* path */
  final String path;
   /* visitPath */
  final String visitPath;
   /* createTime */
  final String createTime;
   /* createDate */
  final DateTime createDate;
   /* category */
  final Category category;
   /* location */
  final String location;
   /* totalCount */
  final int totalCount;
   /* image */
  final String image;
   /* description */
  final String description;
   /* cover */
  final AlbumPhoto cover;
  

  Album(
    

{
     this.id = null,  
     this.name = null,  
     this.path = null,  
     this.visitPath = null,  
     this.createTime = null,  
     this.createDate = null,  
     this.category = null,  
     this.location = null,  
     this.totalCount = null,  
     this.image = null,  
     this.description = null,  
     this.cover = null 
    
    }
  );

  @override
  String toString() {
    return 'Album[id=$id, name=$name, path=$path, visitPath=$visitPath, createTime=$createTime, createDate=$createDate, category=$category, location=$location, totalCount=$totalCount, image=$image, description=$description, cover=$cover, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class AlbumSerializer extends Serializer<Album> with _$AlbumSerializer {

}
