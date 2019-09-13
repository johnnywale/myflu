// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$CategorySerializer implements Serializer<Category> {
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
  Map<String, dynamic> toMap(Category model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'active', model.active);
    setMapValue(ret, 'attachment_url', model.attachmentUrl);
    setMapValue(ret, 'background', model.background);
    setMapValue(ret, 'copy_right', model.copyRight);
    setMapValue(ret, 'cover_url', model.coverUrl);
    setMapValue(
        ret, 'create_date', dateTimeUtcProcessor.serialize(model.createDate));
    setMapValue(
        ret, 'effect_day', dateTimeUtcProcessor.serialize(model.effectDay));
    setMapValue(
        ret, 'html_content', _htmlContentSerializer.toMap(model.htmlContent));
    setMapValue(ret, 'key_url', model.keyUrl);
    setMapValue(ret, 'lg_key', model.lgKey);
    setMapValue(ret, 'linking', model.linking);
    setMapValue(ret, 'meta_info', _metaInfoSerializer.toMap(model.metaInfo));
    setMapValue(ret, 'news_paper', model.newsPaper);
    setMapValue(ret, 'online', model.online);
    setMapValue(ret, 'location', model.location);
    setMapValue(ret, 'pic_url', model.picUrl);
    setMapValue(ret, 'recommended', model.recommended);
    setMapValue(ret, 'source', model.source);
    setMapValue(ret, 'title', model.title);
    setMapValue(ret, 'top_blog', model.topBlog);
    setMapValue(ret, 'visit_count', model.visitCount);
    setMapValue(ret, 'checked', model.checked);
    setMapValue(
        ret,
        'children',
        codeIterable(model.children,
            (val) => _categorySerializer.toMap(val as Category)));
    setMapValue(ret, 'rank_order', model.rankOrder);
    setMapValue(ret, 'is_last', model.isLast);
    return ret;
  }

  @override
  Category fromMap(Map map) {
    if (map == null) return null;
    final obj = Category(
        id: map['id'] as int ?? getJserDefault('id'),
        name: map['name'] as String ?? getJserDefault('name'),
        active: map['active'] as bool ?? getJserDefault('active'),
        attachmentUrl:
            map['attachment_url'] as String ?? getJserDefault('attachmentUrl'),
        background: map['background'] as String ?? getJserDefault('background'),
        copyRight: map['copy_right'] as String ?? getJserDefault('copyRight'),
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
        lgKey: map['lg_key'] as String ?? getJserDefault('lgKey'),
        linking: map['linking'] as bool ?? getJserDefault('linking'),
        metaInfo: _metaInfoSerializer.fromMap(map['meta_info'] as Map) ??
            getJserDefault('metaInfo'),
        newsPaper: map['news_paper'] as String ?? getJserDefault('newsPaper'),
        online: map['online'] as bool ?? getJserDefault('online'),
        location: map['location'] as String ?? getJserDefault('location'),
        picUrl: map['pic_url'] as String ?? getJserDefault('picUrl'),
        recommended:
            map['recommended'] as bool ?? getJserDefault('recommended'),
        source: map['source'] as String ?? getJserDefault('source'),
        title: map['title'] as String ?? getJserDefault('title'),
        topBlog: map['top_blog'] as bool ?? getJserDefault('topBlog'),
        visitCount: map['visit_count'] as int ?? getJserDefault('visitCount'),
        checked: map['checked'] as bool ?? getJserDefault('checked'),
        children: codeIterable<Category>(map['children'] as Iterable,
                (val) => _categorySerializer.fromMap(val as Map)) ??
            getJserDefault('children'),
        rankOrder: map['rank_order'] as int ?? getJserDefault('rankOrder'),
        isLast: map['is_last'] as bool ?? getJserDefault('isLast'));
    return obj;
  }
}
