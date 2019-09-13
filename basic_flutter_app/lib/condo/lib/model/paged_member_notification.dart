import 'package:jaguar_serializer/jaguar_serializer.dart';

import '../model/member_notification.dart';
import '../model/page_base.dart';
part 'paged_member_notification.jser.dart';

class PagedMemberNotification {
  
  final int pageNo;
  
  final int pageSize;
  
  final int totalResults;
  
  final int totalPages;
  
  final String orderBy;
  
  final String order;
  
  final String filters;
  
  final List<MemberNotification> data;
  

  PagedMemberNotification(
    

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
    return 'PagedMemberNotification[pageNo=$pageNo, pageSize=$pageSize, totalResults=$totalResults, totalPages=$totalPages, orderBy=$orderBy, order=$order, filters=$filters, data=$data, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class PagedMemberNotificationSerializer extends Serializer<PagedMemberNotification> with _$PagedMemberNotificationSerializer {

}
