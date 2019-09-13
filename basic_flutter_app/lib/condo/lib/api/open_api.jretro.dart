// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$OpenApiClient implements ApiClient {
  final String basePath = "";
  Future<TokenMemberResponse> openUserLoginPost(LoginCredentials body) async {
    var req = base.post
        .path(basePath)
        .path("/open/user-login")
        .json(jsonConverter.to(body));
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<Success> openUserLogoutPost() async {
    var req = base.post
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
        .path("/open/user-logout");
    return req.go(throwOnErr: true).map(decodeOne);
  }
}
