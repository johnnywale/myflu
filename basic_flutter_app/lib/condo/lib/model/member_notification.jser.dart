// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_notification.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$MemberNotificationSerializer
    implements Serializer<MemberNotification> {
  Serializer<NotificationMessage> __notificationMessageSerializer;
  Serializer<NotificationMessage> get _notificationMessageSerializer =>
      __notificationMessageSerializer ??= NotificationMessageSerializer();
  @override
  Map<String, dynamic> toMap(MemberNotification model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'title', model.title);
    setMapValue(ret, 'sub_title', model.subTitle);
    setMapValue(
        ret, 'message', _notificationMessageSerializer.toMap(model.message));
    setMapValue(
        ret, 'send_time', dateTimeUtcProcessor.serialize(model.sendTime));
    setMapValue(ret, 'readed', model.readed);
    return ret;
  }

  @override
  MemberNotification fromMap(Map map) {
    if (map == null) return null;
    final obj = MemberNotification(
        id: map['id'] as int ?? getJserDefault('id'),
        title: map['title'] as String ?? getJserDefault('title'),
        subTitle: map['sub_title'] as String ?? getJserDefault('subTitle'),
        message:
            _notificationMessageSerializer.fromMap(map['message'] as Map) ??
                getJserDefault('message'),
        sendTime:
            dateTimeUtcProcessor.deserialize(map['send_time'] as String) ??
                getJserDefault('sendTime'),
        readed: map['readed'] as bool ?? getJserDefault('readed'));
    return obj;
  }
}
