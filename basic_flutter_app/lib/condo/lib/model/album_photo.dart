import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'album_photo.jser.dart';

class AlbumPhoto {
   /* id */
  final int id;
   /* name */
  final String name;
   /* thumb */
  final String thumb;
   /* path */
  final String path;
   /* visitThumb */
  final String visitThumb;
   /* orderRank */
  final int orderRank;
   /* description */
  final String description;
   /* videoUrl */
  final String videoUrl;
  

  AlbumPhoto(
    

{
     this.id = null,  
     this.name = null,  
     this.thumb = null,  
     this.path = null,  
     this.visitThumb = null,  
     this.orderRank = null,  
     this.description = null,  
     this.videoUrl = null 
    
    }
  );

  @override
  String toString() {
    return 'AlbumPhoto[id=$id, name=$name, thumb=$thumb, path=$path, visitThumb=$visitThumb, orderRank=$orderRank, description=$description, videoUrl=$videoUrl, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class AlbumPhotoSerializer extends Serializer<AlbumPhoto> with _$AlbumPhotoSerializer {

}
