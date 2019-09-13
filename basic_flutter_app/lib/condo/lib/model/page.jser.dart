// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$PageSerializer implements Serializer<Page> {
  @override
  Map<String, dynamic> toMap(Page model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'page_no', model.pageNo);
    setMapValue(ret, 'page_size', model.pageSize);
    setMapValue(ret, 'total_results', model.totalResults);
    setMapValue(ret, 'total_pages', model.totalPages);
    setMapValue(ret, 'order_by', model.orderBy);
    setMapValue(ret, 'order', model.order);
    setMapValue(ret, 'filters', model.filters);
    setMapValue(ret, 'data', passProcessor.serialize(model.data));
    return ret;
  }

  @override
  Page fromMap(Map map) {
    if (map == null) return null;
    final obj = Page(
        pageNo: map['page_no'] as int ?? getJserDefault('pageNo'),
        pageSize: map['page_size'] as int ?? getJserDefault('pageSize'),
        totalResults:
            map['total_results'] as int ?? getJserDefault('totalResults'),
        totalPages: map['total_pages'] as int ?? getJserDefault('totalPages'),
        orderBy: map['order_by'] as String ?? getJserDefault('orderBy'),
        order: map['order'] as String ?? getJserDefault('order'),
        filters: map['filters'] as String ?? getJserDefault('filters'),
        data: passProcessor.deserialize(map['data']) as Object ??
            getJserDefault('data'));
    return obj;
  }
}
