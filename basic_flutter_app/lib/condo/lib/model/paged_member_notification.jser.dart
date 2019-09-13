// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_member_notification.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$PagedMemberNotificationSerializer
    implements Serializer<PagedMemberNotification> {
  Serializer<MemberNotification> __memberNotificationSerializer;
  Serializer<MemberNotification> get _memberNotificationSerializer =>
      __memberNotificationSerializer ??= MemberNotificationSerializer();
  @override
  Map<String, dynamic> toMap(PagedMemberNotification model) {
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
            model.data,
            (val) => _memberNotificationSerializer
                .toMap(val as MemberNotification)));
    return ret;
  }

  @override
  PagedMemberNotification fromMap(Map map) {
    if (map == null) return null;
    final obj = PagedMemberNotification(
        pageNo: map['page_no'] as int ?? getJserDefault('pageNo'),
        pageSize: map['page_size'] as int ?? getJserDefault('pageSize'),
        totalResults:
            map['total_results'] as int ?? getJserDefault('totalResults'),
        totalPages: map['total_pages'] as int ?? getJserDefault('totalPages'),
        orderBy: map['order_by'] as String ?? getJserDefault('orderBy'),
        order: map['order'] as String ?? getJserDefault('order'),
        filters: map['filters'] as String ?? getJserDefault('filters'),
        data: codeIterable<MemberNotification>(map['data'] as Iterable,
                (val) => _memberNotificationSerializer.fromMap(val as Map)) ??
            getJserDefault('data'));
    return obj;
  }
}
