import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_serializer/src/repo/repo.dart';
import 'dart:async';

import '../model/error.dart';
import '../model/paged_article.dart';


part 'article_api.jretro.dart';

@GenApiClient()
class ArticleApi extends _$ArticleApiClient with ApiClient {
    final Route base;

    ArticleApi({this.base, SerializerRepo serializers}){
        super.jsonConverter = serializers;    
    }

    /// Get All Article By Parameter
    ///
    /// Get All Article By Parameter 
    @GetReq(path: "/article", metadata: {"auth": [ {"type": "apiKey", "name": "jovx", "keyName": "Authorization", "where": "header" }]})
    Future<PagedArticle> articleGet(
        
        @QueryParam("page_no") int pageNo, 
        
        @QueryParam("page_size") int pageSize, 
        
        @QueryParam("order_by") String orderBy, 
        
        @QueryParam("order") String order, 
        
        @QueryParam("filters") String filters
    );


}
