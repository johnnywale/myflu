// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_message.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$NotificationMessageSerializer
    implements Serializer<NotificationMessage> {
  @override
  Map<String, dynamic> toMap(NotificationMessage model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'content', model.content);
    return ret;
  }

  @override
  NotificationMessage fromMap(Map map) {
    if (map == null) return null;
    final obj = NotificationMessage(
        id: map['id'] as int ?? getJserDefault('id'),
        content: map['content'] as String ?? getJserDefault('content'));
    return obj;
  }
}
