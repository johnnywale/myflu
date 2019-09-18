import 'package:flutter/material.dart';

enum MsgType { INFO, WARN, ERROR }

class ToastNotification extends Notification {
  ToastNotification({this.msg, this.msgType});

  final MsgType msgType;
  final String msg;
}
