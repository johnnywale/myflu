import 'package:intl/intl.dart';

class SwaggerDateTime extends DateTime {
  SwaggerDateTime.now() : super.now();

  SwaggerDateTime.fromMillisecondsSinceEpoch(int millisecondsSinceEpoch)
      : super.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);

  @override
  String toString() {
    return DateFormat("yyyy-MM-dd").format(this);
  }
}
