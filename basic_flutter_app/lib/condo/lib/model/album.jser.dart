// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$AlbumSerializer implements Serializer<Album> {
  Serializer<Category> __categorySerializer;
  Serializer<Category> get _categorySerializer =>
      __categorySerializer ??= CategorySerializer();
  Serializer<AlbumPhoto> __albumPhotoSerializer;
  Serializer<AlbumPhoto> get _albumPhotoSerializer =>
      __albumPhotoSerializer ??= AlbumPhotoSerializer();
  @override
  Map<String, dynamic> toMap(Album model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'path', model.path);
    setMapValue(ret, 'visit_path', model.visitPath);
    setMapValue(ret, 'create_time', model.createTime);
    setMapValue(
        ret, 'create_date', dateTimeUtcProcessor.serialize(model.createDate));
    setMapValue(ret, 'category', _categorySerializer.toMap(model.category));
    setMapValue(ret, 'location', model.location);
    setMapValue(ret, 'total_count', model.totalCount);
    setMapValue(ret, 'image', model.image);
    setMapValue(ret, 'description', model.description);
    setMapValue(ret, 'cover', _albumPhotoSerializer.toMap(model.cover));
    return ret;
  }

  @override
  Album fromMap(Map map) {
    if (map == null) return null;
    final obj = Album(
        id: map['id'] as int ?? getJserDefault('id'),
        name: map['name'] as String ?? getJserDefault('name'),
        path: map['path'] as String ?? getJserDefault('path'),
        visitPath: map['visit_path'] as String ?? getJserDefault('visitPath'),
        createTime:
            map['create_time'] as String ?? getJserDefault('createTime'),
        createDate:
            dateTimeUtcProcessor.deserialize(map['create_date'] as String) ??
                getJserDefault('createDate'),
        category: _categorySerializer.fromMap(map['category'] as Map) ??
            getJserDefault('category'),
        location: map['location'] as String ?? getJserDefault('location'),
        totalCount: map['total_count'] as int ?? getJserDefault('totalCount'),
        image: map['image'] as String ?? getJserDefault('image'),
        description:
            map['description'] as String ?? getJserDefault('description'),
        cover: _albumPhotoSerializer.fromMap(map['cover'] as Map) ??
            getJserDefault('cover'));
    return obj;
  }
}
