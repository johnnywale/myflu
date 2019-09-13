import 'package:jaguar_serializer/jaguar_serializer.dart';

import '../model/calendar_event.dart';
import '../model/page_base.dart';
part 'paged_calendar_event.jser.dart';

class PagedCalendarEvent {
  
  final int pageNo;
  
  final int pageSize;
  
  final int totalResults;
  
  final int totalPages;
  
  final String orderBy;
  
  final String order;
  
  final String filters;
  
  final List<CalendarEvent> data;
  

  PagedCalendarEvent(
    

{
     this.pageNo = null,  
     this.pageSize = null,  
     this.totalResults = null,  
     this.totalPages = null,  
     this.orderBy = null,  
     this.order = null,  
     this.filters = null,  
     this.data = const [] 
    
    }
  );

  @override
  String toString() {
    return 'PagedCalendarEvent[pageNo=$pageNo, pageSize=$pageSize, totalResults=$totalResults, totalPages=$totalPages, orderBy=$orderBy, order=$order, filters=$filters, data=$data, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class PagedCalendarEventSerializer extends Serializer<PagedCalendarEvent> with _$PagedCalendarEventSerializer {

}
