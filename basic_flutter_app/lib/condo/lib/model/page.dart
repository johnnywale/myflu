import 'package:jaguar_serializer/jaguar_serializer.dart';

import '../model/page_base.dart';
//import '../model/object.dart';
part 'page.jser.dart';

class Page {
  
  final int pageNo;
  
  final int pageSize;
  
  final int totalResults;
  
  final int totalPages;
  
  final String orderBy;
  
  final String order;
  
  final String filters;
  
  final Object data;
  

  Page(
    

{
     this.pageNo = null,  
     this.pageSize = null,  
     this.totalResults = null,  
     this.totalPages = null,  
     this.orderBy = null,  
     this.order = null,  
     this.filters = null,  
     this.data = null 
    
    }
  );

  @override
  String toString() {
    return 'Page[pageNo=$pageNo, pageSize=$pageSize, totalResults=$totalResults, totalPages=$totalPages, orderBy=$orderBy, order=$order, filters=$filters, data=$data, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class PageSerializer extends Serializer<Page> with _$PageSerializer {

}
