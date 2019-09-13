import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'page_base.jser.dart';

class PageBase {
  
  final int pageNo;
  
  final int pageSize;
  
  final int totalResults;
  
  final int totalPages;
  
  final String orderBy;
  
  final String order;
  
  final String filters;
  

  PageBase(
    

{
     this.pageNo = null,  
     this.pageSize = null,  
     this.totalResults = null,  
     this.totalPages = null,  
     this.orderBy = null,  
     this.order = null,  
     this.filters = null 
    
    }
  );

  @override
  String toString() {
    return 'PageBase[pageNo=$pageNo, pageSize=$pageSize, totalResults=$totalResults, totalPages=$totalPages, orderBy=$orderBy, order=$order, filters=$filters, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class PageBaseSerializer extends Serializer<PageBase> with _$PageBaseSerializer {

}
