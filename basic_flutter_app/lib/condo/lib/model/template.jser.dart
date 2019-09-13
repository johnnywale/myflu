// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$TemplateSerializer implements Serializer<Template> {
  Serializer<HtmlContent> __htmlContentSerializer;
  Serializer<HtmlContent> get _htmlContentSerializer =>
      __htmlContentSerializer ??= HtmlContentSerializer();
  @override
  Map<String, dynamic> toMap(Template model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'path', model.path);
    setMapValue(ret, 'encode', model.encode);
    setMapValue(ret, 'modify_time', model.modifyTime);
    setMapValue(ret, 'partial', model.partial);
    setMapValue(
        ret, 'html_content', _htmlContentSerializer.toMap(model.htmlContent));
    setMapValue(ret, 'full_path', model.fullPath);
    setMapValue(ret, 'language', model.language);
    setMapValue(ret, 'inline_edit', model.inlineEdit);
    setMapValue(ret, 'template_full', model.templateFull);
    setMapValue(ret, 'search', model.search);
    setMapValue(ret, 'css', model.css);
    setMapValue(ret, 'background', model.background);
    setMapValue(ret, 'icon', model.icon);
    setMapValue(ret, 'rightside', model.rightside);
    setMapValue(ret, 'style', model.style);
    setMapValue(ret, 'project', model.project);
    return ret;
  }

  @override
  Template fromMap(Map map) {
    if (map == null) return null;
    final obj = Template(
        id: map['id'] as int ?? getJserDefault('id'),
        name: map['name'] as String ?? getJserDefault('name'),
        path: map['path'] as String ?? getJserDefault('path'),
        encode: map['encode'] as String ?? getJserDefault('encode'),
        modifyTime: map['modify_time'] as int ?? getJserDefault('modifyTime'),
        partial: map['partial'] as bool ?? getJserDefault('partial'),
        htmlContent:
            _htmlContentSerializer.fromMap(map['html_content'] as Map) ??
                getJserDefault('htmlContent'),
        fullPath: map['full_path'] as String ?? getJserDefault('fullPath'),
        language: map['language'] as String ?? getJserDefault('language'),
        inlineEdit: map['inline_edit'] as bool ?? getJserDefault('inlineEdit'),
        templateFull:
            map['template_full'] as bool ?? getJserDefault('templateFull'),
        search: map['search'] as bool ?? getJserDefault('search'),
        css: map['css'] as String ?? getJserDefault('css'),
        background: map['background'] as String ?? getJserDefault('background'),
        icon: map['icon'] as String ?? getJserDefault('icon'),
        rightside: map['rightside'] as bool ?? getJserDefault('rightside'),
        style: map['style'] as String ?? getJserDefault('style'),
        project: map['project'] as bool ?? getJserDefault('project'));
    return obj;
  }
}
