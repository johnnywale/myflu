import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_serializer/src/repo/repo.dart';
import 'dart:async';

import '../model/token_member_response.dart';
import '../model/success.dart';
import '../model/login_credentials.dart';
import '../model/error.dart';


part 'open_api.jretro.dart';

@GenApiClient()
class OpenApi extends _$OpenApiClient with ApiClient {
    final Route base;

    OpenApi({this.base, SerializerRepo serializers}){
        super.jsonConverter = serializers;    
    }

    /// User logout 
    ///
    /// Login with credentials
    @PostReq(path: "/open/user-login")
    Future<TokenMemberResponse> openUserLoginPost(
        
        @AsJson() LoginCredentials body
    );

    /// User logout 
    ///
    /// Login with credentials
    @PostReq(path: "/open/user-logout", metadata: {"auth": [ {"type": "apiKey", "name": "jovx", "keyName": "Authorization", "where": "header" }]})
    Future<Success> openUserLogoutPost(
    );


}
