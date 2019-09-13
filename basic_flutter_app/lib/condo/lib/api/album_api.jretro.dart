// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$AlbumApiClient implements ApiClient {
  final String basePath = "";
  Future<List<AlbumPhoto>> albumAlbumIdPhotoGet(int albumId) async {
    var req = base.get
        .metadata({
          "auth": [
            {
              "type": "apiKey",
              "name": "jovx",
              "keyName": "Authorization",
              "where": "header",
            }
          ],
        })
        .path(basePath)
        .path("/album/:album_id/photo")
        .pathParams("album_id", albumId);
    return req.go(throwOnErr: true).map(decodeList);
  }

  Future<List<Album>> albumGet() async {
    var req = base.get
        .metadata({
          "auth": [
            {
              "type": "apiKey",
              "name": "jovx",
              "keyName": "Authorization",
              "where": "header",
            }
          ],
        })
        .path(basePath)
        .path("/album");
    return req.go(throwOnErr: true).map(decodeList);
  }
}
