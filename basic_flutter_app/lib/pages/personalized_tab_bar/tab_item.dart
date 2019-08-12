import 'package:flutter/material.dart';

class TabItem {
  final IconData data;
  final double size;
  final String text;
  WidgetBuilder builder;

  TabItem({this.data, this.size, this.text});
}
