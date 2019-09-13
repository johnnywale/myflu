// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'html_content.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$HtmlContentSerializer implements Serializer<HtmlContent> {
  @override
  Map<String, dynamic> toMap(HtmlContent model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'content', model.content);
    setMapValue(ret, 'entity', model.entity);
    setMapValue(ret, 'high_light', model.highLight);
    setMapValue(ret, 'language', model.language);
    setMapValue(ret, 'search', model.search);
    setMapValue(ret, 'search_key', model.searchKey);
    setMapValue(ret, 'summary', model.summary);
    setMapValue(ret, 'target_id', model.targetId);
    setMapValue(ret, 'title', model.title);
    setMapValue(ret, 'visit_url', model.visitUrl);
    setMapValue(ret, 'entity_id', model.entityId);
    setMapValue(ret, 'meta_keywords', model.metaKeywords);
    setMapValue(ret, 'meta_title', model.metaTitle);
    setMapValue(ret, 'meta_description', model.metaDescription);
    setMapValue(ret, 'meta_og', model.metaOg);
    setMapValue(ret, 'meta_seo', model.metaSeo);
    setMapValue(ret, 'url_id', model.urlId);
    return ret;
  }

  @override
  HtmlContent fromMap(Map map) {
    if (map == null) return null;
    final obj = HtmlContent(
        id: map['id'] as int ?? getJserDefault('id'),
        content: map['content'] as String ?? getJserDefault('content'),
        entity: map['entity'] as String ?? getJserDefault('entity'),
        highLight: map['high_light'] as String ?? getJserDefault('highLight'),
        language: map['language'] as String ?? getJserDefault('language'),
        search: map['search'] as bool ?? getJserDefault('search'),
        searchKey: map['search_key'] as String ?? getJserDefault('searchKey'),
        summary: map['summary'] as String ?? getJserDefault('summary'),
        targetId: map['target_id'] as int ?? getJserDefault('targetId'),
        title: map['title'] as String ?? getJserDefault('title'),
        visitUrl: map['visit_url'] as String ?? getJserDefault('visitUrl'),
        entityId: map['entity_id'] as int ?? getJserDefault('entityId'),
        metaKeywords:
            map['meta_keywords'] as String ?? getJserDefault('metaKeywords'),
        metaTitle: map['meta_title'] as String ?? getJserDefault('metaTitle'),
        metaDescription: map['meta_description'] as String ??
            getJserDefault('metaDescription'),
        metaOg: map['meta_og'] as String ?? getJserDefault('metaOg'),
        metaSeo: map['meta_seo'] as String ?? getJserDefault('metaSeo'),
        urlId: map['url_id'] as int ?? getJserDefault('urlId'));
    return obj;
  }
}
