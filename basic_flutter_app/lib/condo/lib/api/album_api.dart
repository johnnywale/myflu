import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_serializer/src/repo/repo.dart';
import 'dart:async';

import '../model/album.dart';
import '../model/error.dart';
import '../model/album_photo.dart';


part 'album_api.jretro.dart';

@GenApiClient()
class AlbumApi extends _$AlbumApiClient with ApiClient {
    final Route base;

    AlbumApi({this.base, SerializerRepo serializers}){
        super.jsonConverter = serializers;    
    }

    /// Get Photo By album Id
    ///
    /// Get Photo By album Id 
    @GetReq(path: "/album/:album_id/photo", metadata: {"auth": [ {"type": "apiKey", "name": "jovx", "keyName": "Authorization", "where": "header" }]})
    Future<List<AlbumPhoto>> albumAlbumIdPhotoGet(
            @PathParam("album_id") int albumId
    );

    /// Get Album list
    ///
    /// Get Album list 
    @GetReq(path: "/album", metadata: {"auth": [ {"type": "apiKey", "name": "jovx", "keyName": "Authorization", "where": "header" }]})
    Future<List<Album>> albumGet(
    );


}
