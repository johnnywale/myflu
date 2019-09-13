import 'package:jaguar_serializer/jaguar_serializer.dart';

import '../model/page_base.dart';
import '../model/article.dart';
part 'paged_article.jser.dart';

class PagedArticle {
  
  final int pageNo;
  
  final int pageSize;
  
  final int totalResults;
  
  final int totalPages;
  
  final String orderBy;
  
  final String order;
  
  final String filters;
  
  final List<Article> data;
  

  PagedArticle(
    

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
    return 'PagedArticle[pageNo=$pageNo, pageSize=$pageSize, totalResults=$totalResults, totalPages=$totalPages, orderBy=$orderBy, order=$order, filters=$filters, data=$data, ]';
  }
}

@GenSerializer(nameFormatter: toSnakeCase)
class PagedArticleSerializer extends Serializer<PagedArticle> with _$PagedArticleSerializer {

}
