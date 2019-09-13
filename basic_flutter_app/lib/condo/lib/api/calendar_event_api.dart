import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_serializer/src/repo/repo.dart';
import 'dart:async';

import '../model/paged_calendar_event.dart';
import '../model/error.dart';


part 'calendar_event_api.jretro.dart';

@GenApiClient()
class CalendarEventApi extends _$CalendarEventApiClient with ApiClient {
    final Route base;

    CalendarEventApi({this.base, SerializerRepo serializers}){
        super.jsonConverter = serializers;    
    }

    /// Get All Calendar Event By Parameter
    ///
    /// Get All Calendar Event By Parameter 
    @GetReq(path: "/calendar-event", metadata: {"auth": [ {"type": "apiKey", "name": "jovx", "keyName": "Authorization", "where": "header" }]})
    Future<PagedCalendarEvent> calendarEventGet(
        
        @QueryParam("page_no") int pageNo, 
        
        @QueryParam("page_size") int pageSize, 
        
        @QueryParam("order_by") String orderBy, 
        
        @QueryParam("order") String order, 
        
        @QueryParam("filters") String filters
    );


}
