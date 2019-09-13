// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_photo.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$AlbumPhotoSerializer implements Serializer<AlbumPhoto> {
  @override
  Map<String, dynamic> toMap(AlbumPhoto model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'thumb', model.thumb);
    setMapValue(ret, 'path', model.path);
    setMapValue(ret, 'visit_thumb', model.visitThumb);
    setMapValue(ret, 'order_rank', model.orderRank);
    setMapValue(ret, 'description', model.description);
    setMapValue(ret, 'video_url', model.videoUrl);
    return ret;
  }

  @override
  AlbumPhoto fromMap(Map map) {
    if (map == null) return null;
    final obj = AlbumPhoto(
        id: map['id'] as int ?? getJserDefault('id'),
        name: map['name'] as String ?? getJserDefault('name'),
        thumb: map['thumb'] as String ?? getJserDefault('thumb'),
        path: map['path'] as String ?? getJserDefault('path'),
        visitThumb:
            map['visit_thumb'] as String ?? getJserDefault('visitThumb'),
        orderRank: map['order_rank'] as int ?? getJserDefault('orderRank'),
        description:
            map['description'] as String ?? getJserDefault('description'),
        videoUrl: map['video_url'] as String ?? getJserDefault('videoUrl'));
    return obj;
  }
}
