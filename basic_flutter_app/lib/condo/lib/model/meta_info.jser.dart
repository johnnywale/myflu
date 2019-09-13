// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_info.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$MetaInfoSerializer implements Serializer<MetaInfo> {
  @override
  Map<String, dynamic> toMap(MetaInfo model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'title', model.title);
    setMapValue(ret, 'meta_keywords', model.metaKeywords);
    setMapValue(ret, 'meta_title', model.metaTitle);
    setMapValue(ret, 'meta_description', model.metaDescription);
    setMapValue(ret, 'linked_id', model.linkedId);
    setMapValue(ret, 'meta_type', model.metaType);
    setMapValue(ret, 'meta_og', model.metaOg);
    setMapValue(ret, 'meta_seo', model.metaSeo);
    setMapValue(ret, 'description', model.description);
    return ret;
  }

  @override
  MetaInfo fromMap(Map map) {
    if (map == null) return null;
    final obj = MetaInfo(
        name: map['name'] as String ?? getJserDefault('name'),
        title: map['title'] as String ?? getJserDefault('title'),
        metaKeywords:
            map['meta_keywords'] as String ?? getJserDefault('metaKeywords'),
        metaTitle: map['meta_title'] as String ?? getJserDefault('metaTitle'),
        metaDescription: map['meta_description'] as String ??
            getJserDefault('metaDescription'),
        linkedId: map['linked_id'] as int ?? getJserDefault('linkedId'),
        metaType: map['meta_type'] as String ?? getJserDefault('metaType'),
        metaOg: map['meta_og'] as String ?? getJserDefault('metaOg'),
        metaSeo: map['meta_seo'] as String ?? getJserDefault('metaSeo'),
        description:
            map['description'] as String ?? getJserDefault('description'));
    return obj;
  }
}
