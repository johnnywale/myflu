// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_article.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$PagedArticleSerializer implements Serializer<PagedArticle> {
  Serializer<Article> __articleSerializer;
  Serializer<Article> get _articleSerializer =>
      __articleSerializer ??= ArticleSerializer();
  @override
  Map<String, dynamic> toMap(PagedArticle model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'page_no', model.pageNo);
    setMapValue(ret, 'page_size', model.pageSize);
    setMapValue(ret, 'total_results', model.totalResults);
    setMapValue(ret, 'total_pages', model.totalPages);
    setMapValue(ret, 'order_by', model.orderBy);
    setMapValue(ret, 'order', model.order);
    setMapValue(ret, 'filters', model.filters);
    setMapValue(
        ret,
        'data',
        codeIterable(
            model.data, (val) => _articleSerializer.toMap(val as Article)));
    return ret;
  }

  @override
  PagedArticle fromMap(Map map) {
    if (map == null) return null;
    final obj = PagedArticle(
        pageNo: map['page_no'] as int ?? getJserDefault('pageNo'),
        pageSize: map['page_size'] as int ?? getJserDefault('pageSize'),
        totalResults:
            map['total_results'] as int ?? getJserDefault('totalResults'),
        totalPages: map['total_pages'] as int ?? getJserDefault('totalPages'),
        orderBy: map['order_by'] as String ?? getJserDefault('orderBy'),
        order: map['order'] as String ?? getJserDefault('order'),
        filters: map['filters'] as String ?? getJserDefault('filters'),
        data: codeIterable<Article>(map['data'] as Iterable,
                (val) => _articleSerializer.fromMap(val as Map)) ??
            getJserDefault('data'));
    return obj;
  }
}
