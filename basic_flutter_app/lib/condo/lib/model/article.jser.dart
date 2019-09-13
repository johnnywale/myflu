// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$ArticleSerializer implements Serializer<Article> {
  Serializer<HtmlContent> __htmlContentSerializer;
  Serializer<HtmlContent> get _htmlContentSerializer =>
      __htmlContentSerializer ??= HtmlContentSerializer();
  Serializer<MetaInfo> __metaInfoSerializer;
  Serializer<MetaInfo> get _metaInfoSerializer =>
      __metaInfoSerializer ??= MetaInfoSerializer();
  Serializer<Category> __categorySerializer;
  Serializer<Category> get _categorySerializer =>
      __categorySerializer ??= CategorySerializer();
  @override
  Map<String, dynamic> toMap(Article model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'active', model.active);
    setMapValue(ret, 'cover_url', model.coverUrl);
    setMapValue(
        ret, 'create_date', dateTimeUtcProcessor.serialize(model.createDate));
    setMapValue(
        ret, 'effect_day', dateTimeUtcProcessor.serialize(model.effectDay));
    setMapValue(
        ret, 'html_content', _htmlContentSerializer.toMap(model.htmlContent));
    setMapValue(ret, 'key_url', model.keyUrl);
    setMapValue(ret, 'linking', model.linking);
    setMapValue(ret, 'meta_info', _metaInfoSerializer.toMap(model.metaInfo));
    setMapValue(ret, 'online', model.online);
    setMapValue(ret, 'location', model.location);
    setMapValue(ret, 'pic_url', model.picUrl);
    setMapValue(ret, 'title', model.title);
    setMapValue(ret, 'top_blog', model.topBlog);
    setMapValue(ret, 'visit_count', model.visitCount);
    setMapValue(ret, 'category', _categorySerializer.toMap(model.category));
    setMapValue(ret, 'preview', model.preview);
    return ret;
  }

  @override
  Article fromMap(Map map) {
    if (map == null) return null;
    final obj = Article(
        id: map['id'] as int ?? getJserDefault('id'),
        name: map['name'] as String ?? getJserDefault('name'),
        active: map['active'] as bool ?? getJserDefault('active'),
        coverUrl: map['cover_url'] as String ?? getJserDefault('coverUrl'),
        createDate:
            dateTimeUtcProcessor.deserialize(map['create_date'] as String) ??
                getJserDefault('createDate'),
        effectDay:
            dateTimeUtcProcessor.deserialize(map['effect_day'] as String) ??
                getJserDefault('effectDay'),
        htmlContent:
            _htmlContentSerializer.fromMap(map['html_content'] as Map) ??
                getJserDefault('htmlContent'),
        keyUrl: map['key_url'] as String ?? getJserDefault('keyUrl'),
        linking: map['linking'] as bool ?? getJserDefault('linking'),
        metaInfo: _metaInfoSerializer.fromMap(map['meta_info'] as Map) ??
            getJserDefault('metaInfo'),
        online: map['online'] as bool ?? getJserDefault('online'),
        location: map['location'] as String ?? getJserDefault('location'),
        picUrl: map['pic_url'] as String ?? getJserDefault('picUrl'),
        title: map['title'] as String ?? getJserDefault('title'),
        topBlog: map['top_blog'] as bool ?? getJserDefault('topBlog'),
        visitCount: map['visit_count'] as int ?? getJserDefault('visitCount'),
        category: _categorySerializer.fromMap(map['category'] as Map) ??
            getJserDefault('category'),
        preview: map['preview'] as String ?? getJserDefault('preview'));
    return obj;
  }
}
