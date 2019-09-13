// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$ChannelSerializer implements Serializer<Channel> {
  Serializer<Template> __templateSerializer;
  Serializer<Template> get _templateSerializer =>
      __templateSerializer ??= TemplateSerializer();
  @override
  Map<String, dynamic> toMap(Channel model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'path', model.path);
    setMapValue(ret, 'title', model.title);
    setMapValue(ret, 'meta_keywords', model.metaKeywords);
    setMapValue(ret, 'meta_title', model.metaTitle);
    setMapValue(ret, 'meta_description', model.metaDescription);
    setMapValue(ret, 'code', model.code);
    setMapValue(ret, 'parallax_scrolling', model.parallaxScrolling);
    setMapValue(
        ret, 'self_template', _templateSerializer.toMap(model.selfTemplate));
    setMapValue(ret, 'meta_og', model.metaOg);
    setMapValue(ret, 'meta_seo', model.metaSeo);
    setMapValue(ret, 'required_attribute', model.requiredAttribute);
    setMapValue(ret, 'sub_banner', model.subBanner);
    setMapValue(ret, 'sub_title', model.subTitle);
    setMapValue(ret, 'sub_description', model.subDescription);
    setMapValue(ret, 'template_type', model.templateType);
    return ret;
  }

  @override
  Channel fromMap(Map map) {
    if (map == null) return null;
    final obj = Channel(
        id: map['id'] as int ?? getJserDefault('id'),
        name: map['name'] as String ?? getJserDefault('name'),
        path: map['path'] as String ?? getJserDefault('path'),
        title: map['title'] as String ?? getJserDefault('title'),
        metaKeywords:
            map['meta_keywords'] as String ?? getJserDefault('metaKeywords'),
        metaTitle: map['meta_title'] as String ?? getJserDefault('metaTitle'),
        metaDescription: map['meta_description'] as String ??
            getJserDefault('metaDescription'),
        code: map['code'] as String ?? getJserDefault('code'),
        parallaxScrolling: map['parallax_scrolling'] as bool ??
            getJserDefault('parallaxScrolling'),
        selfTemplate:
            _templateSerializer.fromMap(map['self_template'] as Map) ??
                getJserDefault('selfTemplate'),
        metaOg: map['meta_og'] as String ?? getJserDefault('metaOg'),
        metaSeo: map['meta_seo'] as String ?? getJserDefault('metaSeo'),
        requiredAttribute: map['required_attribute'] as String ??
            getJserDefault('requiredAttribute'),
        subBanner: map['sub_banner'] as String ?? getJserDefault('subBanner'),
        subTitle: map['sub_title'] as String ?? getJserDefault('subTitle'),
        subDescription: map['sub_description'] as String ??
            getJserDefault('subDescription'),
        templateType:
            map['template_type'] as String ?? getJserDefault('templateType'));
    return obj;
  }
}
