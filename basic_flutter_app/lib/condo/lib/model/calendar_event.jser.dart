// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_event.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$CalendarEventSerializer implements Serializer<CalendarEvent> {
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
  Map<String, dynamic> toMap(CalendarEvent model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'active', model.active);
    setMapValue(ret, 'attachment_url', model.attachmentUrl);
    setMapValue(ret, 'background', model.background);
    setMapValue(ret, 'copy_right', model.copyRight);
    setMapValue(ret, 'cover_u_r_l', model.coverURL);
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
    setMapValue(ret, 'category', _categorySerializer.toMap(model.category));
    setMapValue(ret, 'download_category',
        _categorySerializer.toMap(model.downloadCategory));
    setMapValue(ret, 'end_date', dateTimeUtcProcessor.serialize(model.endDate));
    setMapValue(ret, 'event_key', model.eventKey);
    setMapValue(ret, 'old_end', dateTimeUtcProcessor.serialize(model.oldEnd));
    setMapValue(
        ret, 'old_start', dateTimeUtcProcessor.serialize(model.oldStart));
    setMapValue(
        ret, 'start_date', dateTimeUtcProcessor.serialize(model.startDate));
    setMapValue(ret, 'register_open', model.registerOpen);
    setMapValue(ret, 'type', model.type);
    return ret;
  }

  @override
  CalendarEvent fromMap(Map map) {
    if (map == null) return null;
    final obj = CalendarEvent(
        id: map['id'] as int ?? getJserDefault('id'),
        name: map['name'] as String ?? getJserDefault('name'),
        active: map['active'] as bool ?? getJserDefault('active'),
        attachmentUrl:
            map['attachment_url'] as String ?? getJserDefault('attachmentUrl'),
        background: map['background'] as String ?? getJserDefault('background'),
        copyRight: map['copy_right'] as String ?? getJserDefault('copyRight'),
        coverURL: map['cover_u_r_l'] as String ?? getJserDefault('coverURL'),
        createDate: dateTimeUtcProcessor.deserialize(map['create_date'] as String) ??
            getJserDefault('createDate'),
        effectDay: dateTimeUtcProcessor.deserialize(map['effect_day'] as String) ??
            getJserDefault('effectDay'),
        htmlContent: _htmlContentSerializer.fromMap(map['html_content'] as Map) ??
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
        category: _categorySerializer.fromMap(map['category'] as Map) ??
            getJserDefault('category'),
        downloadCategory:
            _categorySerializer.fromMap(map['download_category'] as Map) ??
                getJserDefault('downloadCategory'),
        endDate: dateTimeUtcProcessor.deserialize(map['end_date'] as String) ??
            getJserDefault('endDate'),
        eventKey: map['event_key'] as String ?? getJserDefault('eventKey'),
        oldEnd: dateTimeUtcProcessor.deserialize(map['old_end'] as String) ??
            getJserDefault('oldEnd'),
        oldStart: dateTimeUtcProcessor.deserialize(map['old_start'] as String) ??
            getJserDefault('oldStart'),
        startDate: dateTimeUtcProcessor.deserialize(map['start_date'] as String) ??
            getJserDefault('startDate'),
        registerOpen: map['register_open'] as bool ?? getJserDefault('registerOpen'),
        type: map['type'] as String ?? getJserDefault('type'));
    return obj;
  }
}
