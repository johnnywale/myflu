// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_event_api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$CalendarEventApiClient implements ApiClient {
  final String basePath = "";
  Future<PagedCalendarEvent> calendarEventGet(int pageNo, int pageSize,
      String orderBy, String order, String filters) async {
    var req = base.get
        .metadata({
          "auth": [
            {
              "type": "apiKey",
              "name": "jovx",
              "keyName": "Authorization",
              "where": "header",
            }
          ],
        })
        .path(basePath)
        .path("/calendar-event")
        .query("page_no", pageNo)
        .query("page_size", pageSize)
        .query("order_by", orderBy)
        .query("order", order)
        .query("filters", filters);
    return req.go(throwOnErr: true).map(decodeOne);
  }
}
